import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/entities/base_field.dart';
import '../../../../../../core/models/base_status.dart';
import '../../../data/models/requests/student_statistics_request.dart';
import '../../../domain/entites/student_statistics.dart';
import '../../../domain/usecases/get_student_statistics_use_case.dart';

part 'student_statistics_state.dart';
part 'student_statistics_cubit.freezed.dart';

@injectable
class StudentStatisticsCubit extends Cubit<StudentStatisticsState> {
  final GetStudentStatisticsUseCase _getStudentStatisticsUseCase;
  StudentStatisticsCubit(this._getStudentStatisticsUseCase)
      : super(const StudentStatisticsState());

  BaseField? readingMinutesAverageInterval;
  BaseField? completedPagesAverageInterval;

  void initValues(
    BaseField value,
  ) {
    setReadingMinutesAverageInterval(value);
    setCompletedPagesAverageInterval(value);
  }

  void setReadingMinutesAverageInterval(BaseField? value) =>
      readingMinutesAverageInterval = value;

  void setCompletedPagesAverageInterval(BaseField? value) =>
      completedPagesAverageInterval = value;

  void getStudentStatistics() async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await _getStudentStatisticsUseCase(
      StudentStatisticsRequest(
        readingMinutesAverageInterval: readingMinutesAverageInterval?.id,
        completedPagesAverageInterval: completedPagesAverageInterval?.id,
      ),
    );
    response.when(
        success: (studentStatisticsResponse) {
          emit(
            state.copyWith(
              status: const BaseStatus.success(),
              studentStatistics: studentStatisticsResponse,
            ),
          );
        },
        failure: (error) =>
            emit(state.copyWith(status: const BaseStatus.failure())));
  }
}
