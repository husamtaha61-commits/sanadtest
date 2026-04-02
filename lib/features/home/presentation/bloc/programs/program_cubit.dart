import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/models/base_status.dart';
import '../../../domain/entites/program.dart';
import '../../../domain/usecases/get_all_programs_use_case.dart';

part 'program_state.dart';
part 'program_cubit.freezed.dart';

@injectable
class ProgramCubit extends Cubit<ProgramState> {
  final GetAllProgramsUseCase getAllProgramsUseCase;

  ProgramCubit(this.getAllProgramsUseCase) : super(const ProgramState());

  void getAllPrograms() async {
    final response = await getAllProgramsUseCase();
    response.when(
      success: (programsResponse) {
        final selectedIndex = programsResponse.indexWhere(
          (program) => program.id == Programs.sanadItqan.intValue,
        );

        if (selectedIndex != -1) {
          final selectedItem = programsResponse.removeAt(selectedIndex);
          programsResponse.insert(0, selectedItem);
        }

        emit(state.copyWith(
          status: const BaseStatus.success(),
          programs: programsResponse,
        ));
      },
      failure: (error) =>
          emit(state.copyWith(status: const BaseStatus.failure())),
    );
  }
}
