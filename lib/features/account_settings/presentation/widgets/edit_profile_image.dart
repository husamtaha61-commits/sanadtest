import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/services/image_picker_service.dart';

class AddEditProfileImage extends StatefulWidget {
  const AddEditProfileImage({
    super.key,
    required this.imageId,
    this.onImagePicked,
    this.enabled = true,
  });

  final String imageId;
  final bool enabled;
  final void Function(File?)? onImagePicked;

  @override
  State<AddEditProfileImage> createState() => _AddEditProfileImageState();
}

class _AddEditProfileImageState extends State<AddEditProfileImage> {
  File? selectedImage;

  ImagePickerService get _pickerService => getIt<ImagePickerService>();

  Future<void> pickImage() async {
    final result = await _pickerService.pickImage(
      context,
      allowMultiple: false,
      navigateToImageEditor: false,
    );

    if (result != null) {
      final file = result is XFile
          ? File(result.path)
          : (result is List<XFile> && result.isNotEmpty
              ? File(result.first.path)
              : null);

      if (file != null) {
        setState(() => selectedImage = file);
        widget.onImagePicked?.call(file);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final fileName = selectedImage != null
        ? p.basename(selectedImage!.path)
        : (widget.imageId.isNotEmpty && widget.imageId.toLowerCase() != 'null'
            ? p.basename(widget.imageId)
            : '');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.form_field_profilePicture,
          style: AppTextStyles.font15TextW400OP8,
        ).tr(),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 36.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.textColor.withValues(alpha: .2),
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  fileName,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.font15TextW400OP8,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            SizedBox(
              width: 80.w,
              height: 36.w,
              child: TextButton(
                onPressed: widget.enabled ? pickImage : null,
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.slateBlue,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    LocaleKeys.button_browse,
                    style: AppTextStyles.font15WhiteW400,
                  ).tr(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
