import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/models/base_status.dart';
import '../../../domain/usecases/generate_meeting_link_use_case.dart';
import '../../../domain/usecases/is_meeting_running_use_case.dart';

part 'meeting_state.dart';
part 'meeting_cubit.freezed.dart';

@injectable
class MeetingCubit extends Cubit<MeetingState> {
  final GenerateMeetingLinkUseCase _generateMeetingLinkUseCase;
  final IsMeetingRunningUseCase _isMeetingRunningUseCase;
  MeetingCubit(this._generateMeetingLinkUseCase, this._isMeetingRunningUseCase) : super(const MeetingState());

  void generateMeetingLink(String sessionId) async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await _generateMeetingLinkUseCase(sessionId);
    response.when(
      success: (meetingResponse)async {
        final isRunning = await isMeetingRunning(meetingResponse.url);
        if ( isRunning) {
          emit(state.copyWith(
              status: const BaseStatus.success(),
              url: meetingResponse.url,
              sessionStarted: true
          ));
        } else {
          emit(state.copyWith(status: const BaseStatus.success(), sessionStarted: false));
        }
      }, 
      failure: (err) {
        emit(state.copyWith(status: const BaseStatus.failure()));
      }
    );
  }

  Future<String> generateMeetingLinkRaw(String sessionId) async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    String link = "";
    final response = await _generateMeetingLinkUseCase(sessionId);
    response.when(
        success: (meetingResponse)async {
          link = meetingResponse.url;
        },
      failure: (_) {}
    );
    return link;
  }

  Future<bool> isMeetingRunning(String meetingUrl) async {
    try {
      final uri = Uri.parse(meetingUrl);
      final meetingId = uri.queryParameters['meetingID'];

      if (meetingId == null || meetingId.isEmpty) {
        return false;
      }

      final result = await _isMeetingRunningUseCase(meetingId);
      return result.when(
        success: (isRunning) => isRunning,
        failure: (_) => false,
      );
    } catch (_) {
      return false;
    }
  }
}
