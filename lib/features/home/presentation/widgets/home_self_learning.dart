import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/enums/app_enums.dart';
import '../../../../core/services/app_preferences.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/utils/snackbar.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/app_page_title.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../data/datasources/home_remote_data_source.dart';
import '../../domain/entites/program.dart';
import '../bloc/programs/program_cubit.dart';

class HomeSelfLearning extends StatelessWidget {
  const HomeSelfLearning({super.key});

  @override
  Widget build(BuildContext context) {
    final userInfo = getIt<AppPreferences>().getUserCachedResponse();
    final images = [
      Assets.images.test4.path,
      Assets.images.test2.path,
      Assets.images.test6.path,
      Assets.images.test5.path,
      Assets.images.test7.path,
    ];

    return BlocBuilder<ProgramCubit, ProgramState>(
      builder: (context, state) {
        return state.status.maybeWhen(
            success: () {
              final Program sanadMinhaj = state.programs.firstWhere(
                (element) => element.id == Programs.sanadMinhaj.intValue,
              );
              return Column(
                children: [
                  const AppPageTitle(title: LocaleKeys.home_selfLearning_title),
                  30.verticalSpace,
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF6F9BC4),
                          Color(0xFF003D7A),
                        ],
                        begin: Alignment(1, 0),
                        end: Alignment(0, 1.5),
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StaggeredGrid.count(
                          crossAxisCount: 3,
                          crossAxisSpacing: 14.w,
                          mainAxisSpacing: 12.w,
                          children: images
                              .asMap()
                              .map(
                                (index, value) => MapEntry(
                                  index,
                                  StaggeredGridTile.extent(
                                    crossAxisCellCount: 1,
                                    mainAxisExtent: [0, 4].contains(index)
                                        ? 75.w
                                        : [2, 3].contains(index)
                                            ? 120.w
                                            : 205.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.r),
                                      child: Image.asset(
                                        value,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .values
                              .toList(),
                        ),
                        32.verticalSpace,
                        Text(
                            context.tr(
                                LocaleKeys.home_selfLearning_startYourJourney),
                            style: AppTextStyles.font16WhiteW600),
                        8.verticalSpace,
                        Text(
                            context.tr(
                                LocaleKeys.home_selfLearning_withSanadMinhaj),
                            style: AppTextStyles.font30WhiteW700),
                        // AppPrice(
                        //   price: sanadMinhaj.price,
                        //   textColor: Colors.white,
                        //   mainAxisAlignment: getIt<AppPreferences>().isAr
                        //       ? MainAxisAlignment.end
                        //       : MainAxisAlignment.start,
                        // ),
                        30.verticalSpace,
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(left: 4.w),
                          shrinkWrap: true,
                          itemCount: sanadMinhaj.programDescription.length,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(bottom: 12.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 24.w,
                                  height: 24.w,
                                  child: SvgPicture.asset(
                                    Assets.icons.checkOrange.path,
                                  ),
                                ),
                                10.horizontalSpace,
                                Flexible(
                                  child: Text(
                                    sanadMinhaj.programDescription[index].name,
                                    style: AppTextStyles.font14WhiteW400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: context.tr(LocaleKeys
                                      .home_selfLearning_discoverMore),
                                  style: AppTextStyles.font16WhiteW700),
                              TextSpan(
                                text: context
                                    .tr(LocaleKeys.home_selfLearning_st1),
                                style: AppTextStyles.font14WhiteW400,
                              ),
                              TextSpan(
                                text: context.tr(LocaleKeys.button_sanadMinhaj),
                                style: AppTextStyles.font16WhiteW700,
                              ),
                              TextSpan(
                                text: context
                                    .tr(LocaleKeys.home_selfLearning_now),
                                style: AppTextStyles.font14WhiteW400,
                              ),
                            ],
                          ),
                        ),
                        20.verticalSpace,
                        AppElevatedButton(
                          onPressed: () {},
                          backgroundColor: AppColors.goldenOrange,
                          child: const Text(
                            LocaleKeys.button_moreDetails,
                          ).tr(),
                        ),
                      ],
                    ),
                  ),
                  if (userInfo.subscriptionStatus ==
                      SubscriptionStatus.approved)
                    SizedBox(
                      width: double.infinity,
                      height: 220.w,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          30.verticalSpace,
                          Image.asset(
                            Assets.images.sanadMinhaj.path,
                            width: double.infinity,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              children: [
                                40.verticalSpace,
                                Text(
                                  LocaleKeys.home_sanadMinhaj_st1,
                                  style: AppTextStyles.font16WhiteW700,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ).tr(),
                                10.verticalSpace,
                                Text(
                                  LocaleKeys.home_sanadMinhaj_st2,
                                  style: AppTextStyles.font12WhiteW700,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ).tr(),
                              ],
                            ),
                          ),
                          18.verticalSpace,
                          Positioned(
                            bottom: 37.w,
                            child: Center(
                              child: SizedBox(
                                width: 110.w,
                                height: 34.w,
                                child: AppElevatedButton(
                                  onPressed: () async {
                                    final result =
                                        await getIt<HomeRemoteDataSource>()
                                            .getSanadMinhajURL();
                                    result.when(
                                      success: (url) => openUrl(url),
                                      failure: (err) => showGlobalSnackBar(
                                          err, SnackBarStatus.error),
                                    );
                                  },
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.white,
                                  borderSide: BorderSide(
                                      width: 2.w, color: Colors.white),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  padding: EdgeInsets.all(8.w),
                                  child: Text(
                                    LocaleKeys.mainDrawer_sanadMinhaj,
                                    style: AppTextStyles.font12WhiteW700,
                                    textAlign: TextAlign.center,
                                  ).tr(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              );
            },
            orElse: () => const SizedBox());
      },
    );
  }
}
