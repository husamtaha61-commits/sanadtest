import 'package:flutter/material.dart';

import '../app_text_field.dart';

class AppTextAreaField extends StatelessWidget {
  final TextEditingController textEditingController;

  const AppTextAreaField({
    super.key,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      maxLines: 7,
      textEditingController: textEditingController,
    );
  }
}
