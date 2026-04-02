import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/models/base_status.dart';
import '../../../data/models/requests/schedule_session_request.dart';

import '../../../domain/usecases/student_schedule_session_use_case.dart';

part 'student_schedule_session_state.dart';
part 'student_schedule_session_cubit.freezed.dart';

@injectable
class StudentScheduleSessionCubit extends Cubit<StudentScheduleSessionState> {
  final StudentScheduleSessionUseCase scheduleSessionUseCase;
  StudentScheduleSessionCubit(this.scheduleSessionUseCase)
      : super(const StudentScheduleSessionState());

  var reciterAvailableTimesSelectedNum = 0;
  List<WeeklyScheduleTimes> selectedWeeklyScheduleTimes = [];
  String pickedDateForOneTime = '';
  int pickedDayIdForOneTime = -1;
  String? pickedDateTimeForOneTime;

  void pickTime(int dayId, int timeId) {
    emit(state.copyWith(status: const BaseStatus.initial()));
    var isFound = false;
    if (selectedWeeklyScheduleTimes.isEmpty) {
      selectedWeeklyScheduleTimes.add(
        WeeklyScheduleTimes(dayId: dayId, timeId: timeId),
      );
      reciterAvailableTimesSelectedNum++;
    } else {
      for (var item in selectedWeeklyScheduleTimes) {
        if (item.dayId == dayId && item.timeId == timeId) {
          selectedWeeklyScheduleTimes.remove(item);
          reciterAvailableTimesSelectedNum--;
          isFound = true;
          break;
        }
      }
      if (!isFound) {
        selectedWeeklyScheduleTimes.add(
          WeeklyScheduleTimes(dayId: dayId, timeId: timeId),
        );
        reciterAvailableTimesSelectedNum++;
      }
    }

    withStateEmission(() {});
  }

  void pickOneTime(String suggestionTime, int dayId, String? dateTime) {
    emit(state.copyWith(status: const BaseStatus.initial()));

    // Check if the same time slot is being selected (same time AND same day)
    final isSameSelection = pickedDateForOneTime == suggestionTime &&
        pickedDayIdForOneTime == dayId;

    // Clear previous selection
    pickedDateForOneTime = '';
    pickedDayIdForOneTime = -1;
    pickedDateTimeForOneTime = null;
    selectedWeeklyScheduleTimes.clear();
    reciterAvailableTimesSelectedNum = 0;

    // If user tapped a different slot, select it
    if (!isSameSelection) {
      pickedDateForOneTime = suggestionTime;
      pickedDayIdForOneTime = dayId;
      pickedDateTimeForOneTime = dateTime;
      reciterAvailableTimesSelectedNum = 1;
    }

    withStateEmission(() {});
  }

  void scheduleSession(int reciterId) async {
    emit(state.copyWith(status: const BaseStatus.loading()));

    final response = await scheduleSessionUseCase(
      ScheduleSessionRequest(
        recieverId: reciterId,
        weeklyScheduleTimes: selectedWeeklyScheduleTimes,
      ),
    );
    response.when(
      success: (data) {
        emit(
          state.copyWith(
            status: const BaseStatus.success(),
          ),
        );
      },
      failure: (error) {
        emit(state.copyWith(status: const BaseStatus.failure()));
      },
    );
  }

  void showError(String errMsg) {
    errorMsg['availableTimes'] = errMsg;
    withStateEmission(() {});
  }

  final errorMsg = {
    'availableTimes': '',
  };

  void withStateEmission(VoidCallback callback) {
    emit(state.copyWith(status: const BaseStatus.initial()));
    callback();
    emit(state.copyWith(status: const BaseStatus.changed()));
  }
}
