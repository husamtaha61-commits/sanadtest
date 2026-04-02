import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/models/base_status.dart';
import '../../../../../core/services/analytics_service.dart';
import '../../../../../core/services/app_preferences.dart';
import '../../../data/models/requests/complete_session_request.dart';
import '../../../domain/entites/page.dart';
import '../../../domain/usecases/complete_session_use_case.dart';
import '../../../domain/usecases/get_last_page_by_session_id_use_case.dart';

part 'session_confirmation_state.dart';
part 'session_confirmation_cubit.freezed.dart';

@injectable
class SessionConfirmationCubit extends Cubit<SessionConfirmationState> {
  final CompleteSessionUseCase _completeSessionUseCase;
  final GetLastPageBySessionIdUseCase _getLastPageBySessionIdUseCase;
  SessionConfirmationCubit(
    this._completeSessionUseCase,
    this._getLastPageBySessionIdUseCase,
  ) : super(const SessionConfirmationState());

  Future<void> fetchLastPage(String sessionId) async {
    final response = await _getLastPageBySessionIdUseCase(sessionId);
    response.when(
      success: (page) => emit(state.copyWith(lastPage: page)),
      failure: (_) => emit(state.copyWith(lastPage: 1)),
    );
  }

  void sessionConfirmationNextStep(bool actionValue) {
    // Trigger "Lesson Started" only if this is the first step
    if (state.activeStep == 0) {
      AnalyticsService.instance.logEvent(
        'session_confirmation',
        parameters: {
          'session_id': state.pages.isNotEmpty ? state.pages.first.value : 0,
          'student_id': getIt<AppPreferences>().getUserCachedResponse().id,
        },
      );
    }

    emit(state.copyWith(
      activeStep: state.activeStep + 1,
      actionValue: actionValue,
    ));
  }

  void initPages(int startPage, int endPage) {
    List<Page> updatedPages = [];
    if (startPage != 0) {
      for (var i = startPage; i <= endPage; i++) {
        updatedPages.add(Page(value: i, isChecked: true));
      }
    }
    emit(state.copyWith(pages: updatedPages));
  }

  void updatePages(int value, bool isChecked) {
    final updatedPages = state.pages.map((page) {
      if (page.value == value) {
        return page.copyWith(isChecked: !isChecked);
      } else if (page.value > value) {
        return page.copyWith(isChecked: false);
      } else {
        return page.copyWith(isChecked: true);
      }
    }).toList();

    emit(state.copyWith(pages: updatedPages));
  }

  void addPage(String sessionId) async {
    final Page? lastPage = state.pages.lastOrNull;
    final List<Page> updatedPages =
        state.pages.map((page) => page.copyWith()).toList();
    if (lastPage != null) {
      updatedPages.add(Page(value: lastPage.value + 1, isChecked: false));
    } else {
      await fetchLastPage(sessionId);
      updatedPages.add(Page(value: state.lastPage, isChecked: false));
    }

    emit(state.copyWith(pages: updatedPages));
  }

  void confirmSession(String sessionId) async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final completeSessionRequest = CompleteSessionRequest(
      sessionId: sessionId,
      startPage: state.pages.first.value,
      endPage: state.pages.last.value,
      isCompleted: state.actionValue!,
    );
    // Trigger "Lesson Completed" when confirming session
    if (state.actionValue == true) {
      AnalyticsService.instance.logEvent(
        'session_completed',
        parameters: {
          'session_id': sessionId,
          'student_id': getIt<AppPreferences>().getUserCachedResponse().id,
          'pages_completed': state.pages.length,
        },
      );
    }

    final response = await _completeSessionUseCase(completeSessionRequest);
    response.when(
      success: (data) =>
          emit(state.copyWith(status: const BaseStatus.success())),
      failure: (error) =>
          emit(state.copyWith(status: const BaseStatus.failure())),
    );
  }
}
