import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/enums/app_enums.dart';
import '../../../../../../core/models/base_status.dart';
import '../../../../../../core/utils/app_date.dart';
import '../../../../../shared/domain/entites/user_info.dart';
import '../../../../../shared/domain/entites/user_role.dart';
import '../../../../../shared/domain/usecases/get_user_info_usecase.dart';

part 'student_profile_state.dart';
part 'student_profile_cubit.freezed.dart';

@injectable
class StudentProfileCubit extends Cubit<StudentProfileState> {
  final GetUserInfoUseCase _getUserInfoUseCase;

  StudentProfileCubit(this._getUserInfoUseCase)
      : super(const StudentProfileState());

  void getUserInfo(int studentId) async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await _getUserInfoUseCase(studentId);
    response.when(
        success: (userInfoResponse) => emit(
              state.copyWith(
                status: const BaseStatus.success(),
                id: userInfoResponse.id,
                firstName: userInfoResponse.firstName,
                middleName: userInfoResponse.middleName ?? '',
                lastName: userInfoResponse.lastName,
                dateOfBirth: AppDate.beToAppDate(userInfoResponse.dateOfBirth),
                hasActiveSchedule: userInfoResponse.hasActiveSchedule,
                isVerified: userInfoResponse.isVerified,
                email: userInfoResponse.email,
                role: userInfoResponse.roles[0],
                phoneNumber: userInfoResponse.phoneNumber,
                mainLanguage: userInfoResponse.mainLanguage,
                learningLanguages: userInfoResponse.learningLanguages,
                description: userInfoResponse.description,
                profileImageUrl: userInfoResponse.profileImageUrl,
                introVideoUrl: userInfoResponse.introVideoUrl,
                placeOfResidence: userInfoResponse.placeOfResidence,
                nationality: userInfoResponse.nationality,
                gender: userInfoResponse.gender,
                subscriptionStatus: userInfoResponse.subscriptionStatus,
              ),
            ),
        failure: (error) =>
            emit(state.copyWith(status: const BaseStatus.failure())));
  }
}
