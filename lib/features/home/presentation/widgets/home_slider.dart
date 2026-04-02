import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/models/base_status.dart';
import '../../../../core/services/app_preferences.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/widgets/app_directionality.dart';
import '../../../../core/widgets/pictures/app_network_image.dart';
import '../../../../gen/assets.gen.dart';
import '../../../shared/presentation/bloc/user/user_cubit.dart';
import '../../domain/entites/slider_content.dart';
import '../bloc/slider_content/slider_content_cubit.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SliderContentCubit>()..getSliderContent(),
      lazy: false,
      child: const HomeSliderContent(),
    );
  }
}

class HomeSliderContent extends StatefulWidget {
  const HomeSliderContent({super.key});

  @override
  State<HomeSliderContent> createState() => _HomeSliderContentState();
}

class _HomeSliderContentState extends State<HomeSliderContent> {
  int _currentIndex = 0;
  final controller = CarouselSliderController();

  void updateIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final hasActiveSchedule = context.read<UserCubit>().state.hasActiveSchedule;
    final isAr = getIt<AppPreferences>().isAr;
    return BlocBuilder<SliderContentCubit, SliderContentState>(
      builder: (context, state) {
        if (state.status is Loading) {
          return Skeletonizer(
            enabled: true,
            child: Container(
              width: double.infinity,
              height: 600.w,
              color: Colors.white,
            ),
          );
        } else if (state.status is Success && state.sliderContent.isNotEmpty) {
          return Stack(
            children: [
              _ImageCarousel(
                controller: controller,
                sliderContent: state.sliderContent,
                currentIndex: _currentIndex,
                updateIndex: updateIndex,
              ),
              Positioned(
                bottom: 18.w,
                left: 0.0,
                right: 0.0,
                child: _CarouselIndicator(
                  controller: controller,
                  sliderContent: state.sliderContent,
                  currentIndex: _currentIndex,
                ),
              ),
              if (!hasActiveSchedule)
                Positioned.directional(
                  textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
                  top: 12.w,
                  start: 32.w,
                  child: SvgPicture.asset(
                    isAr
                        ? Assets.images.logoAr.path
                        : Assets.images.logoEn.path,
                    width: 113.w,
                    height: 42.w,
                  ),
                ),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class _ImageCarousel extends StatelessWidget {
  final List<SliderContent> sliderContent;
  final int currentIndex;
  final CarouselSliderController controller;
  final void Function(int) updateIndex;

  const _ImageCarousel({
    required this.sliderContent,
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
        autoPlay: true,
        height: 550.w,
        onPageChanged: (index, reason) {
          updateIndex(index);
        },
      ),
      items: sliderContent
          .map(
            (content) => InkWell(
              // Post MVP
              // onTap: () => openUrl(content.link, false),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AppNetworkImage(imageId: content.imageUrl),
                  Positioned(
                    bottom: 36.w,
                    left: 40.w,
                    right: 40.w,
                    child: Column(
                      children: [
                        Text(
                          content.title,
                          style: AppTextStyles.font20White700,
                          textAlign: TextAlign.center,
                        ),
                        8.verticalSpace,
                        AppDirectionality(
                          text: content.description,
                          child: Text(
                            content.description,
                            style: AppTextStyles.font12WhiteW400,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _CarouselIndicator extends StatelessWidget {
  final List<SliderContent> sliderContent;
  final int currentIndex;
  final CarouselSliderController controller;
  const _CarouselIndicator({
    required this.sliderContent,
    required this.currentIndex,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(sliderContent.length, (index) {
        return GestureDetector(
          onTap: () {
            controller.animateToPage(index);
          },
          child: Container(
            margin: EdgeInsets.only(right: 2.w),
            width: currentIndex == index ? 36.w : 18.w,
            height: 4.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: currentIndex == index
                  ? AppColors.goldenOrange
                  : Colors.white.withOpacity(0.6),
            ),
          ),
        );
      }).toList(),
    );
  }
}
