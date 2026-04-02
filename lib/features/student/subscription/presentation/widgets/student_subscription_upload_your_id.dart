import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/entities/base_field.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/extenstions/date_time.dart';
import '../../../../../core/extenstions/string.dart';
import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/utils/app_date.dart';
import '../../../../../core/widgets/form_fields/app_single_menu.dart';
import '../../../../../core/widgets/steps/app_steps_form_text.dart';
import '../../../../../core/widgets/steps/app_steps_user_identity_types.dart';

import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../shared/presentation/bloc/lookup/lookup_cubit.dart';
import '../../../../shared/presentation/bloc/user/user_cubit.dart';
import '../bloc/subscription/subscription_cubit.dart';

class StudentSubscriptionUploadYourId extends StatefulWidget {
  const StudentSubscriptionUploadYourId({super.key});

  @override
  State<StudentSubscriptionUploadYourId> createState() =>
      _StudentSubscriptionUploadYourIdState();
}

class _StudentSubscriptionUploadYourIdState
    extends State<StudentSubscriptionUploadYourId> {
  late int? dateBirthInYear;

  @override
  void initState() {
    super.initState();
    final subscriptionCubit = context.read<SubscriptionCubit>();
    final dob = subscriptionCubit.dateOfBirth.text.toDate(AppDate.MMddyyyy);
    dateBirthInYear = dob != null ? DateTime.now().diffInYears(dob) : null;

    final userState = context.read<UserCubit>().state;
    if (userState.userIdentities.isNotEmpty) {
      final firstIdentity = userState.userIdentities.first;
      final userIdTypeId = firstIdentity.userIdentityType?.id;

      final lookup = context.read<LookupCubit>().state.userIdTypes;
      final matchingDocument = lookup.firstWhere(
        (e) => e.id == userIdTypeId,
        orElse: () => lookup.first,
      );

      subscriptionCubit.setDocument(matchingDocument);
    }

    _loadIdentityImages(subscriptionCubit);
  }

  Future<void> _loadIdentityImages(SubscriptionCubit subscriptionCubit) async {
    final userState = context.read<UserCubit>().state;
    final identities = userState.userIdentities;
    if (identities.isEmpty) return;

    for (final identity in identities) {
      final bytes = await subscriptionCubit
          .downloadFileFromUrl(identity.fileUrl.toString());
      if (bytes == null) continue;

      final xfile = await subscriptionCubit.saveBytesToTempFile(
        bytes,
        identity.fileName.toString(),
      );

      final isIdentityCard =
          identity.userIdentityType?.id == UserIdTypes.identityCard.intValue;

      if (isIdentityCard && subscriptionCubit.state.frontImage == null) {
        subscriptionCubit.setImage(xfile, false);
      } else {
        subscriptionCubit.setImage(xfile, true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final subscriptionCubit = context.read<SubscriptionCubit>();
    final lookUpState = context.watch<LookupCubit>().state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppStepsFormText(text: LocaleKeys.subscription_uploadID_title),
        BlocBuilder<SubscriptionCubit, SubscriptionState>(
          buildWhen: (prev, curr) => prev.document != curr.document,
          builder: (context, state) {
            final doc = state.document;
            if (doc == null) return const SizedBox.shrink();

            String key;
            if (doc.name == LocaleKeys.subscription_documents_passport) {
              key = LocaleKeys.subscription_uploadID_passport;
            } else if (doc.name ==
                LocaleKeys.subscription_documents_identityCard) {
              key = LocaleKeys.subscription_uploadID_identityCard;
            } else if (doc.name ==
                LocaleKeys.subscription_documents_drivingLicense) {
              key = LocaleKeys.subscription_uploadID_drivingLicense;
            } else {
              key = LocaleKeys.subscription_uploadID_birthCertificate;
            }

            return Column(
              children: [
                25.verticalSpace,
                Text(key, style: AppTextStyles.font15TextW400).tr(),
              ],
            );
          },
        ),
        20.verticalSpace,
        BlocBuilder<SubscriptionCubit, SubscriptionState>(
          buildWhen: (prev, curr) => prev.document != curr.document,
          builder: (context, state) {
            return AppSingleMenu<BaseField>(
              dropdownBuilder: (context, selectedItem) {
                if (selectedItem == null) return const SizedBox.shrink();

                if (selectedItem.id == UserIdTypes.birthCertificate.intValue) {
                  return RichText(
                    text: TextSpan(
                      style: AppTextStyles.font15TextW400,
                      children: [
                        TextSpan(
                          text: LocaleKeys
                              .subscription_documents_birthCertificate
                              .tr(),
                        ),
                        const TextSpan(text: " "),
                        TextSpan(
                          text: LocaleKeys
                              .subscription_documents_birthCertificate_under18
                              .tr(),
                          style: AppTextStyles.font15TextW400.copyWith(
                            color: AppColors.textColor.withValues(alpha: 0.4),
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return Text(
                  selectedItem.name,
                  style: AppTextStyles.font15TextW400,
                );
              },
              items: lookUpState.userIdTypes
                  .where((e) => !(dateBirthInYear! >= 18 && e.id == 5))
                  .toList(),
              itemAsString: (item) =>
                  item.id == UserIdTypes.birthCertificate.intValue
                      ? LocaleKeys.subscription_documents_birthCertificate.tr()
                      : item.name,
              selectedItem: state.document,
              onItemSelected: (selected) {
                subscriptionCubit.clearImages();
                subscriptionCubit.setDocument(selected);
              },
              customValidator: (value) => subscriptionCubit.validateDocument(
                value,
                LocaleKeys.form_field_document,
              ),
              fieldName: LocaleKeys.form_field_document,
              selectedItemName: state.document?.name ?? '',
            );
          },
        ),
        20.verticalSpace,
        BlocBuilder<SubscriptionCubit, SubscriptionState>(
          buildWhen: (prev, curr) =>
              prev.frontImage != curr.frontImage ||
              prev.backImage != curr.backImage ||
              prev.document?.id != curr.document?.id,
          builder: (context, state) {
            return AppStepsUserIdentityTypes(
              documentId: state.document?.id,
              setImage: subscriptionCubit.setImage,
              unSetImage: subscriptionCubit.unSetImage,
              frontImage: state.frontImage,
              backImage: state.backImage,
            );
          },
        ),
      ],
    );
  }
}
