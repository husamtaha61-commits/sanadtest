import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../../core/widgets/app_text_field.dart';
import 'reciter_complete_profile_payment_information_payment_card_item.dart';
import 'reciter_complete_profile_payment_information_payment_cards.dart';
import '../../../../../../gen/assets.gen.dart';

import '../../../../../../core/utils/app_form_validator.dart';
import '../../../../../../core/widgets/steps/app_steps_form_text.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../bloc/reciter_complete_profile/reciter_complete_profile_cubit.dart';

final paymentCards = [
  {
    "imagePath": Assets.icons.bank.path,
    "label": LocaleKeys.reciter_completeProfile_paymentInformation_type1,
  },
  {
    "imagePath": Assets.icons.paypal.path,
    "label": LocaleKeys.reciter_completeProfile_paymentInformation_type2,
  },
  {
    "imagePath": Assets.icons.westrenUnion.path,
    "label": LocaleKeys.reciter_completeProfile_paymentInformation_type3,
  }
];

class ReciterCompleteProfilePaymentInformation extends StatelessWidget {
  const ReciterCompleteProfilePaymentInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final reciterCompleteProfileCubit =
        context.read<ReciterCompleteProfileCubit>();

    return BlocBuilder<ReciterCompleteProfileCubit,
        ReciterCompleteProfileState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppStepsFormText(
              text: LocaleKeys.reciter_completeProfile_paymentInformation_title,
            ),
            20.verticalSpace,
            const AppStepsFormText(
              text: LocaleKeys.reciter_completeProfile_paymentInformation_st1,
              isSubTitle: true,
            ),
            10.verticalSpace,
            const _Note1(),
            10.verticalSpace,
            ReciterCompleteProfilePaymentInformationPaymentCards(
              children: [
                for (int i = 0; i < paymentCards.length; i++) ...[
                  ReciterCompleteProfilePaymentInformationPaymentCardItem(
                    imagePath: paymentCards[i]['imagePath']!,
                    label: paymentCards[i]['label']!,
                    onTap: () =>
                        reciterCompleteProfileCubit.updatePaymnetId(i + 1),
                    isActive: reciterCompleteProfileCubit.state.paymentTypeId ==
                        i + 1,
                  ),
                ],
              ],
            ),
            40.verticalSpace,
            _CurrentPaymentFields(
              paymentTypeId: reciterCompleteProfileCubit.state.paymentTypeId!,
            )
          ],
        );
      },
    );
  }
}

class _CurrentPaymentFields extends StatelessWidget {
  final int paymentTypeId;
  const _CurrentPaymentFields({required this.paymentTypeId});

  @override
  Widget build(BuildContext context) {
    final reciterCompleteProfileCubit =
        context.read<ReciterCompleteProfileCubit>();
    if (paymentTypeId == 1) {
      return Column(
        children: [
          AppTextFormField(
            label: LocaleKeys.form_field_iban,
            textEditingController: reciterCompleteProfileCubit.iban,
            validator: (value) =>
                AppFormValidator.validateField(AppFormFields.iban, value),
          ),
          17.verticalSpace,
          AppTextFormField(
            label: LocaleKeys.form_field_swift,
            textEditingController: reciterCompleteProfileCubit.swiftCode,
            validator: (value) =>
                AppFormValidator.validateField(AppFormFields.swiftCode, value),
          ),
          17.verticalSpace,
          AppTextFormField(
            label: LocaleKeys.form_field_bankName,
            textEditingController: reciterCompleteProfileCubit.bankName,
            validator: (value) =>
                AppFormValidator.validateField(AppFormFields.bankName, value),
          ),
        ],
      );
    } else if (paymentTypeId == 2) {
      return AppTextFormField(
        label: LocaleKeys.form_field_paypal,
        textEditingController: reciterCompleteProfileCubit.payPal,
        validator: (value) =>
            AppFormValidator.validateField(AppFormFields.paypal, value),
      );
    } else {
      return AppTextFormField(
        label: LocaleKeys.form_field_westernUnion,
        textEditingController: reciterCompleteProfileCubit.westrenUnion,
        validator: (value) =>
            AppFormValidator.validateField(AppFormFields.westrenUnion, value),
      );
    }
  }
}

class _Note1 extends StatelessWidget {
  const _Note1();

  @override
  Widget build(BuildContext context) {
    return Text(
      context.tr(LocaleKeys.reciter_completeProfile_paymentInformation_noteSt1),
      style: AppTextStyles.font12TextW400,
    );
  }
}
