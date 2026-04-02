// sanad_minhaj_progress_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/entities/base_field.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/models/base_status.dart';
import '../../../../student/rescheduling/domain/entites/session.dart';
import '../../../../student/rescheduling/domain/entites/student_info.dart';
import '../../../domain/entites/sanad_minhaj_progress.dart';
import '../../../domain/usecases/get_sanad_minhaj_progress_use_case.dart';

part 'sanad_minhaj_state.dart';
part 'sanad_minhaj_progress_cubit.freezed.dart';

@injectable
class SanadMinhajProgressCubit extends Cubit<SanadMinhajProgressState> {
  final GetSanadMinhajProgressUseCase _getSanadMinhajProgressUseCase;

  SanadMinhajProgressCubit(this._getSanadMinhajProgressUseCase)
      : super(const SanadMinhajProgressState());

  Future<void> getSanadMinhajProgress() async {
    emit(state.copyWith(status: const BaseStatus.loading()));

    final response = await _getSanadMinhajProgressUseCase();
    response.when(
      success: (courses) {
        final Map<int, List<Session>> groupedSessions = {};

        for (final course in courses) {
          final sessions = List.generate(course.stepsTotal, (index) {
            final status = index < course.stepsCompleted
                ? SessionStatus.completed
                : SessionStatus.incompleted;

            return Session(
              sessionId: '${course.courseId}_$index',
              type: BaseField(id: course.courseId, name: course.courseTitle),
              sessionDateTime: DateTime.now(),
              status: BaseField(
                id: status.intValue,
                name: status.name,
              ),
              studentInfo: StudentInfo(
                id: -1,
                firstName: "",
                lastName: "",
                middleName: "",
              ),
            );
          });

          groupedSessions[course.courseId] = sessions;
        }

        emit(state.copyWith(
          status: const BaseStatus.success(),
          courses: courses,
          sessionsByCourseId: groupedSessions,
        ));
      },
      failure: (error) =>
          emit(state.copyWith(status: const BaseStatus.failure())),
    );
  }
}
