import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/entities/base_field.dart';
import '../../../../core/extenstions/string.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/widgets/app_divider.dart';
import '../../../../core/widgets/app_shadow_container.dart';
import '../../../../core/widgets/pictures/app_circular_avatar_image.dart';
import '../../../../core/widgets/pictures/app_profile_country_image.dart';
import '../../domain/entites/session_details.dart';

class SessionDetailsUserInfo extends StatelessWidget {
  final DetailsStudentInfo userInfo;
  const SessionDetailsUserInfo({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    List<BaseField> mergedLanguages = [...userInfo.languages];
    if (!mergedLanguages
        .any((item) => item.name == userInfo.mainLanguage.name)) {
      mergedLanguages.add(userInfo.mainLanguage);
    }

    return AppShadowContainer(
      child: Column(
        children: [
          userInfo.profileImageUrl.isNotEmpty
              ? AppProfileCountryImage(
                  countryIsoCode: userInfo.nationality.isoCode,
                  imageSize: 74,
                  memCache: 293,
                  profileImageId: userInfo.profileImageUrl,
                  right: 12,
                  bottom: -8,
                  radius: 8,
                  width: 80,
                )
              : const AppCircularAvatarImage(imageSize: 80),
          16.verticalSpace,
          Text(
            textAlign: TextAlign.center,
            "${userInfo.firstName.toCapitalize()} ${userInfo.lastName.toCapitalize()}",
            style: AppTextStyles.font20TextW600,
          ),
          8.verticalSpace,
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: _buildTeachingLanguages(mergedLanguages),
          ),
          4.verticalSpace,
          const AppDivider(
            width: 46,
            height: 3,
          ),
          12.verticalSpace,
          ...userInfo.recitations.map(
            (recitation) => Padding(
              padding: EdgeInsets.only(bottom: 4.w),
              child:
                  Text(recitation.name, style: AppTextStyles.font16TextW400OP8),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> _buildTeachingLanguages(List<BaseField> teachingLanguages) {
  final List<Widget> children = [];
  for (var i = 0; i < teachingLanguages.length; i++) {
    children.addAll(
      [
        Text(
          teachingLanguages[i].name,
          style: AppTextStyles.font16TextW400.copyWith(
            color: const Color(0xff636173),
          ),
        ),
        5.horizontalSpace,
      ],
    );
    if (i != teachingLanguages.length - 1) {
      children.addAll(
        [
          CircleAvatar(
            backgroundColor: const Color(0xff636173),
            radius: 1.5.r,
          ),
          5.horizontalSpace,
        ],
      );
    }
  }
  return children;
}
