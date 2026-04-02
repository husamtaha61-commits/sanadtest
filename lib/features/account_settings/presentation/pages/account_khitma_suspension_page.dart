import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/enums/app_enums.dart';
import '../../../../core/services/app_preferences.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/utils/snackbar.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../core/widgets/app_custom_scroll_view.dart';
import '../../../../core/widgets/app_shadow_container.dart';
import '../../../../core/widgets/form_fields/app_single_menu.dart';
import '../../../../core/widgets/steps/app_steps_button.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../bloc/account_settings/account_settings_cubit.dart';
import '../widgets/suspend_khitma_intended_duration.dart';

@RoutePage()
class AccountKhitmaSuspensionPage extends StatefulWidget {
  const AccountKhitmaSuspensionPage({super.key});
  @override
  State<AccountKhitmaSuspensionPage> createState() =>
      _AccountKhitmaSuspensionPageState();
}

class _AccountKhitmaSuspensionPageState
    extends State<AccountKhitmaSuspensionPage> {
  SuspensionReason? selectedReason;
  final TextEditingController otherReasonController = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;

  bool showOtherReasonError = false;
  bool showStartDateError = false;
  bool showEndDateError = false;

  @override
  void dispose() {
    otherReasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBlocWrapperScreen(
      child: BlocProvider(
        create: (context) => getIt<AccountSettingsCubit>(),
        child: Builder(
          builder: (ctx) {
            return BlocListener<AccountSettingsCubit, AccountSettingsState>(
              listener: (ctx, state) => state.status.whenOrNull(
                loading: () => showAppLoadingDialog(ctx),
                failure: (error) {
                  Navigator.of(ctx, rootNavigator: true).pop();
                  showGlobalSnackBar(error!, SnackBarStatus.error);
                  return null;
                },
                success: () {
                  Navigator.of(ctx, rootNavigator: true).pop();
                  showGlobalSnackBar(
                    LocaleKeys.modalBottomSheet_subTitle_st19,
                    SnackBarStatus.success,
                  );
                  ctx.router.pop();
                  return null;
                },
              ),
              child: AppCustomScrollView(
                appPageHeader: AppPageHeader.subtitle,
                title: LocaleKeys.accountSettings_khitmaSuspension_title.tr(),
                bottomChildren: [
                  AppStepsButton(
                    onPressed: () {
                      setState(() {
                        showOtherReasonError = false;
                        showStartDateError = false;
                        showEndDateError = false;

                        if (selectedReason == null) {
                          return;
                        }
                        if (startDate == null) {
                          showStartDateError = true;
                        }
                        if (endDate == null) {
                          showEndDateError = true;
                        }
                        if (selectedReason == SuspensionReason.other &&
                            (otherReasonController.text.isEmpty ||
                                otherReasonController.text.trim().isEmpty)) {
                          showOtherReasonError = true;
                        }
                      });

                      if (showOtherReasonError ||
                          showStartDateError ||
                          showEndDateError ||
                          selectedReason == null) {
                        return;
                      }
                      final userInfo =
                          getIt<AppPreferences>().getUserCachedResponse();
                      final cubit = getIt<AccountSettingsCubit>();
                      if (userInfo.subscriptionStatus !=
                          SubscriptionStatus.approved) {
                        cubit.showSubscriptionWarning(
                            context,
                            LocaleKeys.modalBottomSheet_title_khitmaSuspension
                                .tr());
                        return;
                      }
                      showAppModalBottomSheet(
                        isDismissible: true,
                        mainBtnLabel: LocaleKeys.button_suspend,
                        secBtnLabel: LocaleKeys.button_cancel,
                        context: ctx,
                        secOnPressed: ctx.router.popForced,
                        mainOnPressed: () {
                          ctx.router.popForced();

                          ctx.read<AccountSettingsCubit>().suspendKhitma(
                                startDate: startDate!,
                                endDate: endDate!,
                                reason: selectedReason!,
                                otherReason:
                                    selectedReason == SuspensionReason.other
                                        ? otherReasonController.text.trim()
                                        : null,
                              );
                        },
                        title: LocaleKeys
                            .modalBottomSheet_title_khitmaSuspension
                            .tr(),
                        subTitle:
                            LocaleKeys.modalBottomSheet_subTitle_st17.tr(),
                        imagePath: Assets.images.deleteAccount.path,
                      );
                    },
                    backgroundColor: AppColors.navyBlue,
                    icon: const SizedBox(),
                    label: Text(ctx.tr(LocaleKeys.button_suspend)),
                  ),
                ],
                children: [
                  20.verticalSpace,
                  AppShadowContainer(
                    child: Text(
                      LocaleKeys.accountSettings_khitmaSuspension_stm1,
                      style: AppTextStyles.font16TextW400OP8,
                    ).tr(),
                  ),
                  20.verticalSpace,
                  AppSingleMenu<SuspensionReason>(
                    items: SuspensionReason.values,
                    itemAsString: (e) => e.displayName,
                    fieldName: LocaleKeys
                        .accountSettings_khitmaSuspension_suspensionReason
                        .tr(),
                    selectedItem: selectedReason,
                    selectedItemName: LocaleKeys
                        .accountSettings_khitmaSuspension_suspensionReason
                        .tr(),
                    onItemSelected: (value) {
                      setState(() {
                        selectedReason = value;
                      });
                    },
                  ),
                  if (selectedReason == SuspensionReason.other) ...[
                    16.verticalSpace,
                    TextField(
                      controller: otherReasonController,
                      minLines: 3,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: "Suspension reason",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorText: showOtherReasonError
                            ? LocaleKeys.form_error_requiredField.tr()
                            : null,
                      ),
                    ),
                  ],
                  IntendedDurationPicker(
                    onDurationSelected: (from, to) {
                      setState(() {
                        startDate = from;
                        endDate = to;
                      });
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
