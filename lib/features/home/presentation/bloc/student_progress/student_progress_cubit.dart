import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/base_status.dart';
import '../../../domain/entites/student_progress.dart';
import '../../../domain/usecases/get_student_progress_use_case.dart';

part 'student_progress_state.dart';
part 'student_progress_cubit.freezed.dart';

@injectable
class StudentProgressCubit extends Cubit<StudentProgressState> {
  final GetStudentProgressUseCase _getStudentProgressUseCase;
  StudentProgressCubit(this._getStudentProgressUseCase)
      : super(const StudentProgressState());

  void getStudentProgress(int studentId) async {
    emit(state.copyWith(status: const BaseStatus.loading()));

    final response = await _getStudentProgressUseCase(studentId);
    response.when(
      success: (studentProgress) {
        emit(state.copyWith(
          status: const BaseStatus.success(),
          studentProgress: studentProgress,
          studentId: studentId,
        ));
      },
      failure: (error) =>
          emit(state.copyWith(status: const BaseStatus.failure())),
    );
  }
}
