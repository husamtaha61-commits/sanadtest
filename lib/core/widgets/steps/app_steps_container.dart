import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../bloc/app/app_cubit.dart';

import '../app_arrow_back_button.dart';
import 'app_step_cards.dart';
import '../../../gen/assets.gen.dart';
import 'app_steps_container_text.dart';

class AppStepsContainer extends StatelessWidget {
  final String programTitle;
  final String? programSubtitle;
  final List<Map<String, String>> items;
  final List<Widget> children;
  final Widget sliverFillChild;
  final int activeIndex;
  final VoidCallback backFunction;
  const AppStepsContainer({
    super.key,
    required this.programTitle,
    required this.items,
    required this.children,
    required this.activeIndex,
    required this.backFunction,
    required this.sliverFillChild,
    this.programSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      controller: context.read<AppCubit>().scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const _ImageBg(),
              Padding(
                padding: EdgeInsets.only(top: 10.w),
                child: Column(
                  children: [
                    _Title(
                      activeIndex: activeIndex,
                      programTitle: programTitle,
                      backFunction: backFunction,
                    ),
                    45.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: AppSetpCards(
                        activeIndex: activeIndex,
                        items: items,
                      ),
                    ),
                    17.verticalSpace,
                    ...children,
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [20.verticalSpace, sliverFillChild],
          ),
        ),
      ],
    );
  }
}

class _ImageBg extends StatelessWidget {
  const _ImageBg();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 300.w,
      left: 0.w,
      right: 0.w,
      child: SvgPicture.asset(
        Assets.images.subscriptionBg.path,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _Title extends StatefulWidget {
  final int activeIndex;
  final String programTitle;
  final VoidCallback backFunction;
  const _Title({
    required this.activeIndex,
    required this.programTitle,
    required this.backFunction,
  });

  @override
  State<_Title> createState() => _TitleState();
}

class _TitleState extends State<_Title> {
  final GlobalKey _backButtonKey = GlobalKey();
  Size? backButtonSize;

  void setBackBtnSize() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox? renderBox =
          _backButtonKey.currentContext?.findRenderObject() as RenderBox?;
      setState(() => backButtonSize = renderBox?.size);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.activeIndex > 1 && backButtonSize == null) {
      setBackBtnSize();
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        children: [
          AppArrowBackButton(
              onPressed: widget.backFunction, key: _backButtonKey),
          Expanded(child: AppStepsContainerText(text: widget.programTitle)),
          if (backButtonSize != null)
            SizedBox(
              width: backButtonSize!.width,
              height: backButtonSize!.height,
            ),
        ],
      ),
    );
  }
}
