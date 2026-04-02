import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/base_status.dart';
import '../../../../reciter/registration/domain/entities/available_times_options.dart';
import '../../../domain/usecases/get_program_available_times_usecase.dart';

part 'program_available_times_state.dart';
part 'program_available_times_cubit.freezed.dart';

@injectable
class ProgramAvailableTimesCubit extends Cubit<ProgramAvailableTimesState> {
  final GetProgramAvailableTimesUseCase getProgramAvailableTimesUsecase;
  ProgramAvailableTimesCubit(this.getProgramAvailableTimesUsecase)
      : super(const ProgramAvailableTimesState());

  Future<void> getProgramAvailableTimes() async {
    emit(state.copyWith(status: const BaseStatus.loading()));

    final response = await getProgramAvailableTimesUsecase();
    response.when(
      success: (availableTimesResponse) {
        emit(
          state.copyWith(
            status: const BaseStatus.success(),
            programAvailableTimes: availableTimesResponse,
          ),
        );
      },
      failure: (error) {
        emit(state.copyWith(status: BaseStatus.failure(error)));
      },
    );
  }
}
