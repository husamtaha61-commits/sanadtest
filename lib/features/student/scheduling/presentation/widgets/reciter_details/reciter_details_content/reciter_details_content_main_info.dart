import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/entities/base_field.dart';
import '../../../../../../../core/enums/app_enums.dart';
import '../../../../../../../core/extenstions/date_time.dart';
import '../../../../../../../core/extenstions/string.dart';
import '../../../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../../../core/utils/app_date.dart';
import '../../../../../../../core/widgets/pictures/app_circular_avatar_image.dart';
import '../../../../../../../core/widgets/pictures/app_cirular_nework_image.dart';
import '../../../../../../../gen/translations/locale_keys.g.dart';
import '../../../../../../shared/presentation/bloc/user/user_cubit.dart';
import '../../../../domain/entites/reciter.dart';

class ReciterDetailsContentMainInfo extends StatelessWidget {
  final Reciter reciter;

  const ReciterDetailsContentMainInfo({super.key, required this.reciter});

  @override
  Widget build(BuildContext context) {
    final subscriptionStatus = context.read<UserCubit>().state.subscriptionStatus;
    return Row(
      children: [
        reciter.gender == "Male" || subscriptionStatus == SubscriptionStatus.approved ?
        AppCirularNeworkImage(
          imageId: reciter.profileImageId,
          imageSize: 70,
          memCache: 293,
        ) 
        :const AppCircularAvatarImage(imageSize: 70),
        10.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          '${reciter.firstName.toCapitalize()} ${reciter.middleName.toCapitalize()}',
                      style: AppTextStyles.font15TextW600.copyWith(
                        color: const Color(0xff636173),
                      ),
                    ),
                    const WidgetSpan(
                      child: SizedBox(width: 4),
                    ),
                    TextSpan(
                      text:
                          "(${DateTime.now().diffInYears(reciter.dateOfBirth.toDate(AppDate.yyyyMMdd)!)} ${context.tr(LocaleKeys.student_scheduling_reciterDetails_old)})",
                      style: AppTextStyles.font10TextW500.copyWith(
                        color: const Color(0xff636173),
                      ),
                    ),
                  ],
                ),
              ),
              4.verticalSpace,
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: _buildTeachingLanguages(reciter.teachingLanguages),
              ),
              4.verticalSpace,
              Wrap(
                children: _buildRecitations(reciter.recitations),
              )
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _buildTeachingLanguages(List<BaseField> teachingLanguages) {
    final List<Widget> children = [];
    for (var i = 0; i < teachingLanguages.length; i++) {
      children.addAll(
        [
          Text(
            teachingLanguages[i].name,
            style: AppTextStyles.font10TextW400.copyWith(
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

  List<Widget> _buildRecitations(List<BaseField>? recitations) {
    final List<Widget> children = [];
    if (recitations != null) {
      for (var i = 0; i < recitations.length; i++) {
        children.addAll(
          [
            Text(
              i == 0
                  ? '${LocaleKeys.student_scheduling_reciterDetails_recitation.tr()} ${recitations[i].name}'
                  : ", ${recitations[i].name}",
              style: AppTextStyles.font10TextW400OP8,
            ),
          ],
        );
      }
    }

    return children;
  }
}
