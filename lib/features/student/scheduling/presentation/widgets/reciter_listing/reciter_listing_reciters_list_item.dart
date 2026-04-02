import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/enums/app_enums.dart';
import '../../../../../../core/extenstions/string.dart';
import '../../../../../../core/routes/app_router.dart';
import '../../../../../../core/theme/styles/app_colors.dart';
import '../../../../../../core/widgets/pictures/app_profile_country_image.dart';
import '../../../../../../core/widgets/reciter/reciter_description.dart';

import '../../../../../../core/theme/styles/app_shadows.dart';
import '../../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../../../../shared/presentation/bloc/user/user_cubit.dart';
import '../../../../subscription/presentation/bloc/subscription/subscription_cubit.dart';
import '../../../domain/entites/reciter.dart';

class ReciterListingRecitersListItem extends StatefulWidget {
  final Reciter reciter;
  final bool isLiveSession;
  const ReciterListingRecitersListItem(
      {super.key, required this.reciter, this.isLiveSession = false});

  @override
  State<ReciterListingRecitersListItem> createState() =>
      _ReciterListingRecitersListItemState();
}

class _ReciterListingRecitersListItemState
    extends State<ReciterListingRecitersListItem>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final subscriptionStatus =
        context.read<UserCubit>().state.subscriptionStatus;

    // Read SubscriptionCubit outside of BlocBuilder if in live session mode
    SubscriptionCubit? subscriptionCubit;
    if (widget.isLiveSession) {
      try {
        subscriptionCubit = context.read<SubscriptionCubit>();
      } catch (e) {
        // If SubscriptionCubit is not available in tree, subscriptionCubit stays null
        debugPrint('SubscriptionCubit not found in widget tree: $e');
      }
    }

    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      return GestureDetector(
        onTap: () {
          context.router.push(
            ReciterDetailsRoute(
              isLiveSession: widget.isLiveSession,
              reciterId: widget.reciter.id,
              subscriptionCubit: subscriptionCubit,
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            boxShadow: AppShadows.blur4BlackOP25,
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    7.horizontalSpace,
                    AppProfileCountryImage(
                      countryIsoCode: widget.reciter.countryIsocode,
                      imageSize: 106,
                      memCache: 293,
                      profileImageId: widget.reciter.gender == "Male" ||
                              subscriptionStatus == SubscriptionStatus.approved
                          ? widget.reciter.profileImageId
                          : null,
                    ),
                    2.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (!widget.reciter.isReceivingNewStudents)
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.w),
                                border: Border.all(
                                  color: AppColors.goldenOrange,
                                  width: 1.5,
                                ),
                              ),
                              padding: EdgeInsets.all(3.w),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.block,
                                    color: AppColors.navyBlue,
                                    size: 11.w,
                                  ),
                                  4.horizontalSpace,
                                  Expanded(
                                    child: Text(
                                      LocaleKeys.reciter_profile_unavailable,
                                      style: AppTextStyles.font10NavyBlueW400,
                                    ).tr(),
                                  ),
                                  16.horizontalSpace
                                ],
                              ),
                            ),
                          if (!widget.reciter.isReceivingNewStudents)
                            8.verticalSpace,
                          _FullName(
                            firstName: widget.reciter.firstName,
                            middleName: widget.reciter.middleName,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              24.verticalSpace,
              if (widget.reciter.description != null)
                ReciterDescription(description: widget.reciter.description!)
            ],
          ),
        ),
      );
    });
  }
}

class _FullName extends StatelessWidget {
  final String firstName;
  final String middleName;
  const _FullName({required this.firstName, required this.middleName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '${firstName.toCapitalize()} ${middleName.toCapitalize()}',
          style: AppTextStyles.font16TextW600,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        )
      ],
    );
  }
}
