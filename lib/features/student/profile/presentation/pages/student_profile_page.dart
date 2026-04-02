import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/models/base_status.dart';
import '../../../../../core/network/api_constants.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../../core/widgets/app_shadow_container.dart';
import '../../../../../core/widgets/app_custom_scroll_view.dart';
import '../../../../../core/widgets/camera/video_player_view.dart';
import '../../../../../core/widgets/pictures/app_profile_country_image.dart';
import '../../../../../core/widgets/steps/app_steps_button.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../shared/presentation/bloc/user/user_cubit.dart';
import '../bloc/student_profile/student_profile_cubit.dart';

@RoutePage()
class StudentProfilePage extends StatelessWidget {
  final bool fromStudentSide;
  final int? studentId;
  const StudentProfilePage(
      {super.key, this.fromStudentSide = true, this.studentId});

  @override
  Widget build(BuildContext context) {
    return AppBlocWrapperScreen(
      child: BlocProvider(
        create: (context) => getIt<StudentProfileCubit>()
          ..getUserInfo(
            studentId ?? context.read<UserCubit>().state.id,
          ),
        lazy: false,
        child: Builder(
          builder: (ctx) =>
              BlocBuilder<StudentProfileCubit, StudentProfileState>(
            builder: (ctx, state) {
              return Skeletonizer(
                enabled: state.status is Loading,
                child: _StudentProfileContent(
                  fromStudentSide: fromStudentSide,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _StudentProfileContent extends StatelessWidget {
  final bool fromStudentSide;

  const _StudentProfileContent({required this.fromStudentSide});

  @override
  Widget build(BuildContext context) {
    late Map<String, dynamic> mainInfo;
    final userState = context.read<StudentProfileCubit>().state;
    mainInfo = {
      LocaleKeys.student_profile_birthday: userState.dateOfBirth,
      LocaleKeys.student_profile_phoneNumber: userState.phoneNumber,
      LocaleKeys.student_profile_gender: userState.gender?.name,
      LocaleKeys.student_profile_residentCountry:
          userState.placeOfResidence?.name,
    };

    List<Widget> buildTeachingLanguages(List<Language> teachingLanguages) {
      final List<Widget> children = [];
      for (var i = 0; i < teachingLanguages.length; i++) {
        children.addAll(
          [
            Text(
              teachingLanguages[i].name,
              style: AppTextStyles.font16TextW400OP8,
            ),
            5.horizontalSpace,
          ],
        );
        if (i != teachingLanguages.length - 1) {
          children.addAll(
            [
              CircleAvatar(
                backgroundColor: const Color(0xff636173),
                radius: 1.5.r,
              ),
              5.horizontalSpace,
            ],
          );
        }
      }
      return children;
    }

    return AppCustomScrollView(
      appPageHeader: AppPageHeader.subtitle,
      title: isStudentRole(context)
          ? LocaleKeys.student_profile_title.tr()
          : LocaleKeys.student_profile_studentProfile.tr(),
      bottomChildren: [
        if (fromStudentSide)
          AppStepsButton(
            icon: const SizedBox(),
            onPressed: () =>
                context.router.push(const AccountPersonalInformationRoute()),
            label: Text(
              context.tr(LocaleKeys.button_editProfile),
            ),
          )
      ],
      children: [
        10.verticalSpace,
        if (userState.introVideoUrl != null)
          AppShadowContainer(
            child: VideoPlayerView(
              url:
                  '${DioConstants.baseUrl}${DioConstants.getVideoByIdEndpoint}?fileId=${userState.introVideoUrl}',
              dataSourceType: DataSourceType.network,
              aspectRatio: 1 / 1,
            ),
          ),
        16.verticalSpace,
        AppShadowContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AppProfileCountryImage(
                    countryIsoCode: userState.placeOfResidence?.isoCode,
                    imageSize: 67,
                    memCache: 293,
                    profileImageId: userState.profileImageUrl,
                    right: 18,
                    bottom: -8,
                    radius: 8,
                    width: 80,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getFullName(
                            userState.firstName,
                            userState.middleName,
                            userState.lastName,
                          ),
                          style: AppTextStyles.font16TextW600,
                        ),
                        4.verticalSpace,
                        Text(
                          userState.email,
                          style: AppTextStyles.font12TextW400OP8,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              ...mainInfo.entries.map(
                (info) => Padding(
                  padding: EdgeInsets.only(top: 10.w),
                  child: Row(
                    children: [
                      Text(
                        context.tr(info.key),
                        style: AppTextStyles.font16TextW500,
                      ),
                      8.horizontalSpace,
                      Text(
                        info.value ?? 'N/A',
                        style: AppTextStyles.font16TextW400OP8,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        16.verticalSpace,
        AppShadowContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.w),
                child: Row(
                  children: [
                    Text(
                      context.tr(LocaleKeys.student_profile_motherLanguage),
                      style: AppTextStyles.font16TextW500,
                    ),
                    8.horizontalSpace,
                    Text(
                      userState.mainLanguage?.name ?? 'N/A',
                      style: AppTextStyles.font16TextW400OP8,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.w),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      context.tr(LocaleKeys.student_profile_teachingLanguages),
                      style: AppTextStyles.font16TextW500,
                    ),
                    8.horizontalSpace,
                    if (userState.learningLanguages.isNotEmpty)
                      ...buildTeachingLanguages(userState.learningLanguages)
                    else
                      Text(
                        "N/A",
                        style: AppTextStyles.font16TextW400OP8,
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
        16.verticalSpace,
      ],
    );
  }
}
