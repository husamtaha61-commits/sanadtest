import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/entities/base_field.dart';
import '../../../../../../core/enums/app_enums.dart';
import '../../../../../../core/models/base_status.dart';
import '../../../../scheduling/domain/entites/reciter.dart';
import '../../../domain/entites/session.dart';
import '../../../domain/usecases/get_student_my_schedule.dart';

part 'student_my_schedule_state.dart';
part 'student_my_schedule_cubit.freezed.dart';

@injectable
class StudentMyScheduleCubit extends Cubit<StudentMyScheduleState> {
  final GetStudentMySchedule _getStudentMySchedule;
  StudentMyScheduleCubit(this._getStudentMySchedule)
      : super(const StudentMyScheduleState());

  Future<void> getMySchedule() async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await _getStudentMySchedule();
    response.when(
      success: (myScheduleResponse) {
        emit(state.copyWith(
          status: const BaseStatus.success(),
          reciterInfo: myScheduleResponse.reciterInfo,
          sessionResponse: myScheduleResponse.sessions,
        ));
      },
      failure: (error) {
        emit(state.copyWith(status: const BaseStatus.failure()));
      },
    );
  }

  void updateReciterIsFavorite(bool isFav) {
    final reciter = state.reciterInfo!.copyWith(isFavorite: isFav);
    emit(state.copyWith(reciterInfo: reciter));
  }

  void updateSessions(String sessionId) {
    emit(
      state.copyWith(
        sessionResponse: state.sessionResponse
            .map(
              (e) => e.sessionId == sessionId
                  ? e.copyWith(
                      status: BaseField(
                          id: SessionStatus.cancelled.intValue,
                          name: SessionStatus.cancelled.name))
                  : e,
            )
            .toList(),
      ),
    );
  }
}
