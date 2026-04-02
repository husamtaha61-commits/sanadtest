import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'app_arrow_back_button.dart';
import 'app_page_title.dart';

class AppPageActionTitle extends StatefulWidget {
  final String title;
  final bool isTranslated;
  final bool withPadding;
  const AppPageActionTitle(
      {super.key,
      required this.title,
      this.isTranslated = false,
      this.withPadding = false});

  @override
  State<AppPageActionTitle> createState() => _AppPageActionTitleState();
}

class _AppPageActionTitleState extends State<AppPageActionTitle> {
  final GlobalKey _backButtonKey = GlobalKey();
  Size? backButtonSize;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox =
          _backButtonKey.currentContext!.findRenderObject() as RenderBox;
      setState(() => backButtonSize = renderBox.size);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          widget.withPadding ? AppPadding.pageTitlteBackBtn : EdgeInsets.zero,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppArrowBackButton(key: _backButtonKey),
          const Spacer(),
          AppPageTitle(
            title: widget.title,
            isTranslated: widget.isTranslated,
          ),
          const Spacer(),
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
