import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/base_status.dart';
import '../../../domain/entites/reciter_student.dart';
import '../../../domain/usecases/get_all_reciter_students_use_case.dart';

part 'reciter_student_state.dart';
part 'reciter_student_cubit.freezed.dart';

@injectable
class ReciterStudentCubit extends Cubit<ReciterStudentState> {
  final GetAllReciterStudentsUseCase _getAllReciterStudentsUseCase;
  ReciterStudentCubit(this._getAllReciterStudentsUseCase)
      : super(const ReciterStudentState());

  void getAllReciterStudents() async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await _getAllReciterStudentsUseCase();
    response.when(
      success: (studentsResponse) {
        emit(state.copyWith(
          status: const BaseStatus.success(),
          students: studentsResponse,
        ));
      },
      failure: (error) =>
          emit(state.copyWith(status: const BaseStatus.failure())),
    );
  }

  void setActiveStudent(int id) {
    emit(state.copyWith(activeStudentId: id));
  }
}
