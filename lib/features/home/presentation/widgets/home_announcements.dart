import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/models/base_status.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/widgets/app_directionality.dart';
import '../../../../core/widgets/app_page_title.dart';
import '../../../../core/widgets/app_shadow_container.dart';
import '../../../../core/widgets/pictures/app_network_image.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../bloc/Announcements/announcements_cubit.dart';

class HomeAnnouncements extends StatelessWidget {
  const HomeAnnouncements({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AnnouncementsCubit>()..getAnnouncements(),
      child: const HomeAnnouncementsContent(),
    );
  }
}

class HomeAnnouncementsContent extends StatefulWidget {
  const HomeAnnouncementsContent({super.key});

  @override
  State<HomeAnnouncementsContent> createState() =>
      _HomeAnnouncementsContentState();
}

class _HomeAnnouncementsContentState extends State<HomeAnnouncementsContent> {
  int _currentIndex = 0;
  final controller = CarouselSliderController();

  void updateIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnouncementsCubit, AnnouncementsState>(
      builder: (context, state) {
        if (state.status is Success) {
          return Column(
            children: [
              20.verticalSpace,
              const AppPageTitle(title: LocaleKeys.home_announcements_title),
              25.verticalSpace,
              state.announcements.isNotEmpty
                  ? Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: AppShadowContainer(
                            padding: EdgeInsets.zero,
                            child: _ImageCarousel(
                              controller: controller,
                              currentIndex: _currentIndex,
                              updateIndex: updateIndex,
                              images: state.announcements.map((announcement) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(8.r),
                                        ),
                                      ),
                                      child: AppNetworkImage(
                                        imageId: announcement.imageUrl,
                                        imageSize: 360.w,
                                        isCenterLoading: true,
                                      ),
                                    ),
                                    20.verticalSpace,
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: AppDirectionality(
                                          text: announcement.body,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 22.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  announcement.title,
                                                  style: AppTextStyles
                                                      .font16TextW600,
                                                ),
                                                24.verticalSpace,
                                                Text(
                                                  announcement.body,
                                                  style: AppTextStyles
                                                      .font12TextW400,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        20.verticalSpace,
                        _CarouselIndicator(
                          controller: controller,
                          images: state.announcements,
                          currentIndex: _currentIndex,
                        ),
                      ],
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: AppShadowContainer(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 40),
                        child: Text(
                          context.tr(
                              LocaleKeys.home_announcements_noAnnouncements),
                          style: AppTextStyles.font16TextW600,
                        ),
                      ),
                    ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}

class _ImageCarousel extends StatelessWidget {
  final List<Widget> images;
  final int currentIndex;
  final CarouselSliderController controller;
  final void Function(int) updateIndex;

  const _ImageCarousel({
    required this.images,
    required this.currentIndex,
    required this.controller,
    required this.updateIndex,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: controller,
      options: CarouselOptions(
        viewportFraction: 1,
        height: 600.w,
        autoPlay: false,
        onPageChanged: (index, reason) {
          updateIndex(index);
        },
      ),
      items: images.map((img) {
        return img;
      }).toList(),
    );
  }
}

class _CarouselIndicator extends StatelessWidget {
  final List<dynamic> images;
  final int currentIndex;
  final CarouselSliderController controller;
  const _CarouselIndicator({
    required this.images,
    required this.currentIndex,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: images.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () {
            controller.animateToPage(entry.key);
          },
          child: Container(
            margin: EdgeInsets.only(right: 4.w),
            width: 12.w,
            height: 12.w,
            decoration: BoxDecoration(
              border: currentIndex == entry.key
                  ? null
                  : Border.all(
                      color: AppColors.navyBlue,
                      width: 1.w,
                    ),
              borderRadius: BorderRadius.circular(6.w),
              color: currentIndex == entry.key
                  ? AppColors.goldenOrange
                  : Colors.transparent,
            ),
          ),
        );
      }).toList(),
    );
  }
}
