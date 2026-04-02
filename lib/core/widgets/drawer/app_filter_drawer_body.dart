import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/translations/locale_keys.g.dart';
import '../../theme/styles/app_text_style.dart';

class AppFilterDrawerBody extends StatelessWidget {
  final List<Widget> children;
  const AppFilterDrawerBody({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        top: 20.w,
        bottom: 100.w,
        right: 24.w,
        left: 24.w,
      ),
      children: [
        47.verticalSpace,
        const _Header(),
        const _Divider(),
        24.verticalSpace,
        ...List.generate(
          children.length,
          (index) {
            return Column(
              children: [children[index], const _Divider()],
            );
          },
        )
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _BackButton(),
        60.horizontalSpace,
        Text(
          context.tr(LocaleKeys.student_scheduling_reciterListing_drawer_title),
          style: AppTextStyles.font24TextW600,
        ),
      ],
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: Colors.transparent,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.zero,
      onPressed: context.router.maybePop,
      icon: SvgPicture.asset(
        Assets.icons.clear.path,
        width: 14.w,
        height: 14.w,
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.w),
      child: Divider(
        color: const Color(0xffD8D7DC),
        height: 1.w,
      ),
    );
  }
}
