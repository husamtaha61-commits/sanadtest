import 'package:flutter/widgets.dart';

import '../constants/constants.dart';
import 'app_page_action_subtitle.dart';
import 'app_page_action_title.dart';

enum AppPageHeader { title, subtitle, sizeOnly, none }

class AppCustomScrollView extends StatelessWidget {
  final List<Widget> children;
  final List<Widget>? bottomChildren;
  final EdgeInsetsGeometry? padding;
  final AppPageHeader appPageHeader;
  final bool isTitleTranslated;
  final String? title;
  final ScrollController? scrollController;

  const AppCustomScrollView({
    super.key,
    required this.children,
    this.bottomChildren,
    this.padding,
    this.appPageHeader = AppPageHeader.sizeOnly,
    this.isTitleTranslated = false,
    this.title,
    this.scrollController,
  });

  Widget getPageHeader() {
    if (appPageHeader == AppPageHeader.title) {
      return AppPageActionTitle(title: title!, isTranslated: isTitleTranslated);
    } else if (appPageHeader == AppPageHeader.subtitle) {
      return AppPageActionSubtitle(
        subTitle: title!,
        isTranslated: isTitleTranslated,
      );
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      controller: scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: appPageHeader == AppPageHeader.none
                ? EdgeInsets.zero
                : AppPadding.pageTitlteBackBtn,
            child: getPageHeader(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: padding ?? AppPadding.customScrollView,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: bottomChildren ?? [],
          ),
        )
      ],
    );
  }
}
