import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/base_status.dart';
import '../../../../../core/services/app_preferences.dart';
import '../../../domain/entites/note.dart';
import '../../../domain/entites/session_details.dart';
import '../../../domain/usecases/get_session_details_by_session_id_use_case.dart';

part 'session_details_state.dart';
part 'session_details_cubit.freezed.dart';

@injectable
class SessionDetailsCubit extends Cubit<SessionDetailsState> {
  final GetSessionDetailsBySessionIdUseCase
      _getSessionDetailsBySessionIdUseCase;
  final AppPreferences _appPreferences;
  SessionDetailsCubit(
      this._getSessionDetailsBySessionIdUseCase, this._appPreferences)
      : super(const SessionDetailsState());

  Future<SessionDetails?> getSessionDetails(String sessionId) async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await _getSessionDetailsBySessionIdUseCase(sessionId);
    SessionDetails? result;
    response.when(
      success: (sessionDetailsResponse) {
        final userId = _appPreferences.getUserCachedResponse().id;
        final myNotes = sessionDetailsResponse.notes
            .where((note) => note.authorId == userId)
            .toList();
        final otherNotes = sessionDetailsResponse.notes
            .where((note) => note.authorId != userId)
            .toList();

        emit(state.copyWith(
          status: const BaseStatus.success(),
          sessionDetails: sessionDetailsResponse,
          myNotes: myNotes,
          otherNotes: otherNotes,
        ));
        result = sessionDetailsResponse;
      },
      failure: (error) =>
          emit(state.copyWith(status: const BaseStatus.failure())),
    );

    return result;
  }
}
