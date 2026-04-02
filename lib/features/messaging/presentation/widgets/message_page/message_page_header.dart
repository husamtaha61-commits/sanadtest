import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extenstions/string.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/widgets/pictures/app_circular_avatar_image.dart';
import '../../../../../core/widgets/pictures/app_cirular_nework_image.dart';
import '../../../domain/entities/messaging_contact.dart';

class MessagePageHeader extends StatelessWidget {
  final MessagingContact contact;
  const MessagePageHeader({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.w),
      color: const Color(0xffF8F9FA),
      width: double.infinity,
      child: Row(
        children: [
          IconButton(
            onPressed: context.router.popForced,
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
          2.horizontalSpace,
          contact.profileImageUrl != null
              ? AppCirularNeworkImage(
                  imageId: contact.profileImageUrl!,
                  imageSize: 56,
                  memCache: 292,
                )
              : const AppCircularAvatarImage(imageSize: 56),
          16.horizontalSpace,
          Text(
            "${contact.firstName.toCapitalize()} ${contact.lastName.toCapitalize()}",
            style: AppTextStyles.font15TextW800,
          )
        ],
      ),
    );
  }
}
