import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/models/base_status.dart';
import '../../../../../reciter/registration/domain/entities/available_times_options.dart';
import '../../../../../shared/domain/usecases/get_program_available_times_usecase.dart';
import '../../../data/models/requests/reciter_available_times_for_limit_specification_request.dart';
import '../../../data/models/requests/reciter_available_times_specification_request.dart';
import '../../../domain/entites/change_reciter_availability_request.dart';
import '../../../domain/usecases/change_reciter_availability_use_case.dart';
import '../../../domain/usecases/get_reciter_available_times_for_limit_use_case.dart';
import '../../../domain/usecases/get_reciter_available_times_use_case.dart';

part 'reciter_available_times_state.dart';
part 'reciter_available_times_cubit.freezed.dart';

@injectable
class ReciterAvailableTimesCubit extends Cubit<ReciterAvailableTimesState> {
  final GetReciterAvailableTimesUseCase _getReciterAvailableTimesUseCase;
  final GetProgramAvailableTimesUseCase _getProgramAvailableTimesUsecase;
  final ChangeReciterAvailabilityUseCase _changeReciterAvailabilityUseCase;

  final GetReciterAvailableTimesForLimitUseCase
      _getReciterAvailableTimesForLimitUseCase;

  ReciterAvailableTimesCubit(
      this._getReciterAvailableTimesUseCase,
      this._getReciterAvailableTimesForLimitUseCase,
      this._getProgramAvailableTimesUsecase,
      this._changeReciterAvailabilityUseCase)
      : super(const ReciterAvailableTimesState(
            reciterTimeDataMap: <int, TimeData>{},
            reciterSelectedTimeDataMap: <int, TimeData>{}));

  void getReciterAvailableTimes(
      ReciterAvailableTimesSpecificationRequest
          reciterAvailableTimesSpecificationRequest) async {
    emit(state.copyWith(status: const BaseStatus.loading()));

    final response = await _getReciterAvailableTimesUseCase(
      ReciterAvailableTimesSpecificationRequest(
        reciterId: reciterAvailableTimesSpecificationRequest.reciterId,
      ),
    );
    response.when(
      success: (reciterAvailableTimes) {
        final reciterTimesMap = <int, TimeData>{};
        for (var list in reciterAvailableTimes) {
          for (var timeData in list.times) {
            reciterTimesMap.putIfAbsent(timeData.uniqueId, () => timeData);
          }
        }
        emit(
          state.copyWith(
              status: const BaseStatus.success(),
              reciterAvailableTimes: reciterAvailableTimes,
              reciterTimeDataMap: reciterTimesMap),
        );
      },
      failure: (error) {
        emit(state.copyWith(status: const BaseStatus.failure()));
      },
    );
  }

  void getReciterAvailableTimesForLimit(
      ReciterAvailableTimesForLimitSpecificationRequest
          reciterAvailableTimesForLimitSpecificationRequest,
      {bool includesThirds = false}) async {
    emit(state.copyWith(status: const BaseStatus.loading()));

    final response = await _getReciterAvailableTimesForLimitUseCase(
      ReciterAvailableTimesForLimitSpecificationRequest(
        reciterId: reciterAvailableTimesForLimitSpecificationRequest.reciterId,
        includeQuarters:
            reciterAvailableTimesForLimitSpecificationRequest.includeQuarters,
        limitByDays:
            reciterAvailableTimesForLimitSpecificationRequest.limitByDays,
        includesThirds: includesThirds,
      ),
    );
    response.when(
      success: (reciterAvailableTimesForLimit) {
        emit(
          state.copyWith(
            status: const BaseStatus.success(),
            reciterAvailableTimes: reciterAvailableTimesForLimit,
          ),
        );
      },
      failure: (error) {
        emit(state.copyWith(status: const BaseStatus.failure()));
      },
    );
  }

  Future<void> getProgramAvailableTimes() async {
    final response = await _getProgramAvailableTimesUsecase();
    response.when(
      success: (availableTimesResponse) {
        emit(
          state.copyWith(
            programAvailableTimes: availableTimesResponse,
          ),
        );
      },
      failure: (_) {},
    );
  }

  setIsEditingAvailability(bool isEditing) {
    final reciterSelectedTimeDataMap = <int, TimeData>{};

    if (isEditing && !state.isEditingAvailability) {
      for (var list in state.reciterAvailableTimes) {
        for (var timeData in list.times) {
          if (timeData.isReserved) {
            reciterSelectedTimeDataMap.putIfAbsent(
                timeData.uniqueId, () => timeData);
          }
        }
      }
    }
    emit(state.copyWith(
        isEditingAvailability: isEditing,
        reciterSelectedTimeDataMap: reciterSelectedTimeDataMap));
  }

  toggleReciterSelection(TimeData timeData) {
    final selectionCopy =
        Map<int, TimeData>.from(state.reciterSelectedTimeDataMap);
    if (selectionCopy.containsKey(timeData.uniqueId)) {
      selectionCopy.remove(timeData.uniqueId);
    } else {
      selectionCopy.putIfAbsent(timeData.uniqueId, () => timeData);
    }
    emit(state.copyWith(reciterSelectedTimeDataMap: selectionCopy));
  }

  Future<bool> changeReciterAvailability() async {
    final requestMap = <int, List<int>>{};
    for (var entry in state.reciterSelectedTimeDataMap.entries) {
      if (requestMap.containsKey(entry.value.dayId)) {
        requestMap[entry.value.dayId]!.add(entry.value.timeId);
      } else {
        requestMap.putIfAbsent(entry.value.dayId, () => [entry.value.timeId]);
      }
    }

    final request = <ChangeReciterAvailabilityRequest>[];

    for (var entry in requestMap.entries) {
      request.add(ChangeReciterAvailabilityRequest(
          dayId: entry.key, hoursIds: entry.value));
    }

    final response = await _changeReciterAvailabilityUseCase(request);

    bool result = false;

    response.whenOrNull(success: (didChange) {
      result = didChange;
    });

    return result;
  }
}
