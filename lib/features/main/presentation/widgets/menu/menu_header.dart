import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/extenstions/string.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/pictures/app_circular_avatar_image.dart';
import '../../../../../core/widgets/pictures/app_cirular_nework_image.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../shared/presentation/bloc/user/user_cubit.dart';

class MenuHeader extends StatelessWidget {
  final String firstName;
  final String secondName;
  final String? imagePath;
  const MenuHeader({
    super.key,
    required this.firstName,
    required this.secondName,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          imagePath != null
              ? AppCirularNeworkImage(
                  imageId: imagePath!,
                  imageSize: 66,
                  memCache: 293,
                )
              : const AppCircularAvatarImage(imageSize: 66),
          16.horizontalSpace,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${firstName.toCapitalize()} ${secondName.toCapitalize()}",
                  style: AppTextStyles.font18TextW700,
                ),
                12.verticalSpace,
                InkWell(
                  onTap: () {
                    if (isStudentRole(context)) {
                      context.router.push(StudentProfileRoute());
                    } else {
                      context.router.push(const ReciterProfileRoute());
                    }
                  },
                  child: Text(
                    context.tr(LocaleKeys.mainDrawer_viewProfile),
                    style: AppTextStyles.font12TextW400OP6,
                  ),
                ),
                // 10.verticalSpace,
                if (userCubit.state.subscriptionStatus ==
                        SubscriptionStatus.approved &&
                    !userCubit.state.hasActiveSchedule)
                  if (isStudentRole(context))
                    InkWell(
                      onTap: () =>
                          context.router.push(const ReciterListingRoute()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.warning,
                            color: AppColors.goldenOrange,
                            size: 22.w,
                          ),
                          4.horizontalSpace,
                          Expanded(
                            child: Text(
                              context.tr(LocaleKeys
                                  .mainDrawer_completeBySelectingReciter),
                              style: AppTextStyles.font12TextW400OP6.copyWith(
                                color: AppColors.goldenOrange,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.goldenOrange,
                                decorationThickness: 1.5.w,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
