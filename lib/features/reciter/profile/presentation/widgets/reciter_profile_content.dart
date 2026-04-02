import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/extenstions/string.dart';
import '../../../../../core/models/base_status.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/skeletons/fake_data/reciter_response_fake_data.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/widgets/app_elevated_button.dart';
import '../../../../../core/widgets/app_shadow_container.dart';
import '../../../../../core/widgets/pictures/app_profile_country_image.dart';
import '../../../../../core/widgets/reciter/reciter_description.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../student/scheduling/presentation/bloc/reciter_details/reciter_details_cubit.dart';
import '../../../../student/scheduling/presentation/widgets/reciter_details/reciter_details_content/reciter_details_content_video_preview.dart';

class ReciterProfileContent extends StatelessWidget {
  const ReciterProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    final reciterState = BlocProvider.of<ReciterDetailsCubit>(context).state;
    final reciter = reciterState.reciter ?? reciterResponseFakeData;
    return AppShadowContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _VideoPreview(),
          if (reciterState.reciter?.videoId != null) 30.verticalSpace,
          Skeletonizer(
            enabled: reciterState.status is Loading,
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 7.w),
                        child: AppProfileCountryImage(
                          countryIsoCode: reciter.countryIsocode,
                          imageSize: 106,
                          memCache: 293,
                          profileImageId: reciter.profileImageId,
                        ),
                      ),
                      2.horizontalSpace,
                      _FullName(
                        firstName: reciter.firstName,
                        middleName: reciter.middleName,
                      )
                    ],
                  ),
                ),
                24.verticalSpace,
                if (reciter.description != null) ...[
                  ReciterDescription(description: reciter.description!),
                  16.verticalSpace,
                ],
                AppElevatedButton(
                  onPressed: () => context.router
                      .push(const AccountPersonalInformationRoute()),
                  child: Text(context.tr(LocaleKeys.button_editProfile)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _VideoPreview extends StatelessWidget {
  const _VideoPreview();

  @override
  Widget build(BuildContext context) {
    final reciterDetailsCubit = BlocProvider.of<ReciterDetailsCubit>(context);
    final reciterDetailsIsLoading = reciterDetailsCubit.state.status is Loading;

    return reciterDetailsIsLoading
        ? Skeletonizer(
            child: Padding(
              padding: EdgeInsets.only(bottom: 30.w),
              child: Container(
                width: double.infinity,
                height: 300.w,
                color: Colors.white,
              ),
            ),
          )
        : reciterDetailsCubit.state.reciter?.videoId != null
            ? Padding(
                padding: EdgeInsets.only(bottom: 12.w),
                child: BlocBuilder<ReciterDetailsCubit, ReciterDetailsState>(
                  builder: (context, state) =>
                      ReciterDetailsContentVideoPreview(
                    reciter: reciterDetailsIsLoading
                        ? reciterResponseFakeData
                        : reciterDetailsCubit.state.reciter!,
                    isShared: false,
                  ),
                ),
              )
            : const SizedBox();
  }
}

class _FullName extends StatelessWidget {
  final String firstName;
  final String middleName;
  const _FullName({required this.firstName, required this.middleName});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '${firstName.toCapitalize()} ${middleName.toCapitalize()}',
            style: AppTextStyles.font16TextW600,
            softWrap: true,
          ),
          40.verticalSpace
        ],
      ),
    );
  }
}
