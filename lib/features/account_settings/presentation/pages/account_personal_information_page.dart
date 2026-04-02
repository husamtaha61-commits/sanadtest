import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phone_form_field/phone_form_field.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/entities/base_field.dart';
import '../../../../core/enums/app_enums.dart';
import '../../../../core/services/app_preferences.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../core/widgets/app_custom_scroll_view.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/app_shadow_container.dart';
import '../../../../core/widgets/form_fields/app_multi_menu.dart';
import '../../../../core/widgets/form_fields/app_single_menu.dart';
import '../../../../core/widgets/form_fields/date_text_field.dart';
import '../../../../core/widgets/form_fields/email_text_field.dart';
import '../../../../core/widgets/form_fields/name_text_field.dart';
import '../../../../core/widgets/form_fields/phone_text_field.dart';
import '../../../../core/widgets/steps/app_steps_button.dart';
import '../../../../core/widgets/steps/app_steps_button_container.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../../reciter/registration/presentation/bloc/reciter_submit_job/reciter_submit_job_cubit.dart';
import '../../../shared/domain/entites/user_info.dart';
import '../../../shared/presentation/bloc/lookup/lookup_cubit.dart';
import '../../../student/subscription/presentation/bloc/subscription/subscription_cubit.dart';
import '../bloc/account_settings/account_settings_cubit.dart';
import '../widgets/document_setting_preview_replace.dart';
import '../widgets/edit_profile_image.dart';
import '../widgets/reciter_certificate_and_recitation_widget.dart';
import '../widgets/video_preview_styled_with_change_button_widget.dart';

@RoutePage()
class AccountPersonalInformationPage extends StatelessWidget {
  const AccountPersonalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AccountSettingsCubit>()..initialize(),
          lazy: false,
        ),
        BlocProvider.value(
          value: getIt<SubscriptionCubit>(),
        ),
        BlocProvider.value(value: getIt<ReciterSubmitJobCubit>()),
      ],
      child: const AccountPersonalInformationContent(),
    );
  }
}

class AccountPersonalInformationContent extends StatefulWidget {
  const AccountPersonalInformationContent({super.key});

  @override
  State<AccountPersonalInformationContent> createState() =>
      _AccountPersonalInformationContentState();
}

class _AccountPersonalInformationContentState
    extends State<AccountPersonalInformationContent> {
  final GlobalKey _firstNameKey = GlobalKey();
  final GlobalKey _middleNameKey = GlobalKey();
  final GlobalKey _lastNameKey = GlobalKey();
  final GlobalKey _dateOfBirthKey = GlobalKey();
  final GlobalKey _nationalityKey = GlobalKey();
  final GlobalKey _placeOfResidenceKey = GlobalKey();
  final GlobalKey _emailKey = GlobalKey();
  final GlobalKey _phoneKey = GlobalKey();
  final GlobalKey _mainLanguageKey = GlobalKey();
  final GlobalKey _learningLanguagesKey = GlobalKey();
  final GlobalKey _recitationKey = GlobalKey();
  final GlobalKey _genderKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToFirstInvalidField(AccountSettingsCubit cubit) {
    if (cubit.firstNameController.text.isEmpty) {
      _scrollToKey(_firstNameKey);
    } else if (cubit.middleNameController.text.isEmpty) {
      _scrollToKey(_middleNameKey);
    } else if (cubit.lastNameController.text.isEmpty) {
      _scrollToKey(_lastNameKey);
    } else if (cubit.dateOfBirthController.text.isEmpty) {
      _scrollToKey(_dateOfBirthKey);
    } else if (cubit.emailController.text.isEmpty) {
      _scrollToKey(_emailKey);
    } else if (cubit.state.phoneNumber == null ||
        cubit.state.phoneNumber!.nsn.isEmpty) {
      _scrollToKey(_phoneKey);
    } else if (cubit.state.learningLanguages.isEmpty) {
      _scrollToKey(_learningLanguagesKey);
    } else if (cubit.state.nationality!.id.isNaN) {
      _scrollToKey(_nationalityKey);
    } else if (cubit.state.mainLanguage!.intValue.isNaN) {
      _scrollToKey(_mainLanguageKey);
    } else if (cubit.state.recitation!.id.isNaN) {
      _scrollToKey(_recitationKey);
    } else if (cubit.state.genderId!.isNaN) {
      _scrollToKey(_genderKey);
    }
  }

  void _scrollToKey(GlobalKey key) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = key.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountSettingsCubit, AccountSettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        final lookupState = context.watch<LookupCubit>().state;

        final userInfo = getIt<AppPreferences>().getUserCachedResponse();

        return AppBlocWrapperScreen(
          child: AppCustomScrollView(
            scrollController: _scrollController,
            appPageHeader: AppPageHeader.subtitle,
            title: LocaleKeys.accountSettings_personalInformation_title.tr(),
            bottomChildren: [
              if (state.isReadMode)
                _buildEditButton(context, context.read<AccountSettingsCubit>()),
              if (!state.isReadMode)
                _buildActionButtons(
                    context, context.read<AccountSettingsCubit>()),
            ],
            children: [
              20.verticalSpace,
              _buildPersonalInfoForm(
                context.read<AccountSettingsCubit>(),
                state,
                lookupState,
                userInfo,
                context,
              ),
              28.verticalSpace,
              _buildVideoSection(
                  context.read<AccountSettingsCubit>(), state, userInfo),
              if (!isStudentRole(context))
                _buildCertificatesSection(state.isReadMode),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEditButton(BuildContext context, AccountSettingsCubit cubit) {
    return AppStepsButton(
      onPressed: () {
        final userInfo = getIt<AppPreferences>().getUserCachedResponse();
        if (userInfo.subscriptionStatus != SubscriptionStatus.approved) {
          cubit.showSubscriptionWarning(
              context,
              LocaleKeys.accountSettings_personalInformation_updateInformation
                  .tr());
          return;
        }

        cubit.toggleEditMode();
      },
      icon: const SizedBox(),
      label: Text(LocaleKeys.button_edit.tr()),
    );
  }

  Widget _buildActionButtons(BuildContext context, AccountSettingsCubit cubit) {
    return AppStepsButtonContainer(
      children: [
        AppElevatedButton(
          elevation: 0,
          onPressed: () => _handleSave(context, cubit),
          child: Text(LocaleKeys.button_save.tr()),
        ),
        16.verticalSpace,
        AppElevatedButton(
          elevation: 0,
          onPressed: cubit.resetForm,
          foregroundColor: AppColors.navyBlue,
          backgroundColor: const Color(0xffDCE2E8),
          child: Text(LocaleKeys.button_cancel.tr()),
        ),
      ],
    );
  }

  Widget _buildPersonalInfoForm(
    AccountSettingsCubit cubit,
    AccountSettingsState state,
    LookupState lookupState,
    UserInfo userInfo,
    BuildContext context,
  ) {
    return AppShadowContainer(
      child: Form(
        key: cubit.formKey,
        child: Column(
          children: [
            _buildNameFields(cubit, state),
            24.verticalSpace,
            _buildDateOfBirthField(cubit, state),
            24.verticalSpace,
            _buildLocationFields(cubit, state, lookupState),
            24.verticalSpace,
            _buildContactFields(cubit, state),
            24.verticalSpace,
            _buildLanguageFields(cubit, state, lookupState, context),
            if (isStudentRole(context))
              _buildRecitationField(cubit, state, lookupState),
            30.verticalSpace,
            _buildGenderField(cubit, state, lookupState, userInfo),
            30.verticalSpace,
            _buildDocumentField(cubit, state, userInfo),
            20.verticalSpace,
            _buildProfileImageField(cubit, state, userInfo),
          ],
        ),
      ),
    );
  }

  Widget _buildNameFields(
      AccountSettingsCubit cubit, AccountSettingsState state) {
    return Column(
      children: [
        NameTextField(
          key: _firstNameKey,
          label: AppFormFields.firstName,
          textEditingController: cubit.firstNameController,
          readOnly: state.isReadMode,
        ),
        24.verticalSpace,
        NameTextField(
          key: _middleNameKey,
          label: AppFormFields.middleName,
          textEditingController: cubit.middleNameController,
          readOnly: state.isReadMode,
        ),
        24.verticalSpace,
        NameTextField(
          key: _lastNameKey,
          label: AppFormFields.lastName,
          textEditingController: cubit.lastNameController,
          readOnly: state.isReadMode,
        ),
      ],
    );
  }

  Widget _buildDateOfBirthField(
      AccountSettingsCubit cubit, AccountSettingsState state) {
    return DateTextField(
      key: _dateOfBirthKey,
      useBirthOfDateValidator: true,
      label: LocaleKeys.form_field_dateOfBirth.tr(),
      textEditingController: cubit.dateOfBirthController,
      minimumAge: 13,
      readOnly: state.isReadMode,
    );
  }

  Widget _buildLocationFields(
    AccountSettingsCubit cubit,
    AccountSettingsState state,
    LookupState lookupState,
  ) {
    return Column(
      children: [
        AppSingleMenu<BaseField>(
          label: LocaleKeys.form_field_nationality.tr(),
          items: lookupState.nationalities.toList(),
          itemAsString: (item) => item.name,
          selectedItem: state.nationality,
          onItemSelected: cubit.setNationality,
          showSearchBox: true,
          enabled: !state.isReadMode,
          key: _nationalityKey,
          fieldName: AppFormFields.nationality,
          selectedItemName: state.nationality?.name ?? '',
        ),
        24.verticalSpace,
        AppSingleMenu<BaseField>(
          label: LocaleKeys.form_field_placeOfResidence.tr(),
          items: lookupState.countries.toList(),
          itemAsString: (item) => item.name,
          selectedItem: state.country,
          onItemSelected: cubit.setCountry,
          showSearchBox: true,
          enabled: !state.isReadMode,
          key: _placeOfResidenceKey,
          fieldName: AppFormFields.placeOfResidence,
          selectedItemName: state.country?.name ?? '',
        ),
      ],
    );
  }

  Widget _buildContactFields(
      AccountSettingsCubit cubit, AccountSettingsState state) {
    final safePhoneNumber = state.phoneNumber ??
        const PhoneNumber(
          isoCode: IsoCode.JO,
          nsn: '',
        );

    return Column(
      children: [
        EmailTextField(
          textEditingController: cubit.emailController,
          readOnly: state.isReadMode,
          key: _emailKey,
        ),
        24.verticalSpace,
        PhoneTextField(
          key: _phoneKey,
          enabled: !state.isReadMode,
          label: LocaleKeys.form_field_phoneNumber.tr(),
          onChanged: (phoneNumber) => cubit.setPhoneNumber(phoneNumber),
          controller: PhoneController(initialValue: safePhoneNumber),
        ),
      ],
    );
  }

  Widget _buildLanguageFields(
    AccountSettingsCubit cubit,
    AccountSettingsState state,
    LookupState lookupState,
    BuildContext context,
  ) {
    final isStudent = isStudentRole(context);

    return Column(
      children: [
        AppSingleMenu<Language>(
          label: isStudent
              ? LocaleKeys.form_field_mainLanguage.tr()
              : LocaleKeys.form_field_motherTongue.tr(),
          items:
              lookupState.languages.map((e) => Language.fromId(e.id)!).toList(),
          itemAsString: (item) => item.name,
          selectedItem: state.mainLanguage,
          onItemSelected: cubit.setMainLanguage,
          enabled: !state.isReadMode,
          key: _mainLanguageKey,
          fieldName: isStudent
              ? AppFormFields.mainLanguage
              : AppFormFields.motherTongue,
          selectedItemName: state.mainLanguage?.name ?? '',
        ),
        24.verticalSpace,
        AppMultiMenu<Language>(
          label: isStudent
              ? LocaleKeys.form_field_learningLanguages.tr()
              : LocaleKeys.form_field_teachingLanguages.tr(),
          items:
              lookupState.languages.map((e) => Language.fromId(e.id)!).toList(),
          itemAsString: (item) => item.name,
          selectedItems: state.learningLanguages,
          onItemSelected: cubit.setLearningLanguages,
          enabled: !state.isReadMode,
          compareFn: (p0, p1) => p0 == p1,
          key: _learningLanguagesKey,
          fieldName: isStudent
              ? AppFormFields.learningLanguages
              : AppFormFields.teachingLanguages,
          selectedItemName:
              state.learningLanguages.isNotEmpty ? "Not Empty" : '',
        ),
      ],
    );
  }

  Widget _buildRecitationField(
    AccountSettingsCubit cubit,
    AccountSettingsState state,
    LookupState lookupState,
  ) {
    return Column(
      children: [
        24.verticalSpace,
        AppSingleMenu<BaseField>(
          label: LocaleKeys.form_field_recitation.tr(),
          items: lookupState.recitations.toList(),
          itemAsString: (item) => item.name,
          selectedItem: state.recitation,
          onItemSelected: cubit.setRecitation,
          showSearchBox: true,
          enabled: !state.isReadMode,
          key: _recitationKey,
          fieldName: AppFormFields.recitation,
          selectedItemName: state.recitation?.name ?? '',
        ),
      ],
    );
  }

  Widget _buildGenderField(
    AccountSettingsCubit cubit,
    AccountSettingsState state,
    LookupState lookupState,
    UserInfo userInfo,
  ) {
    return AppSingleMenu<String>(
      label: LocaleKeys.form_field_gender.tr(),
      items: lookupState.genders.map((e) => e.name).toList(),
      itemAsString: (item) => item.tr(),
      selectedItem: userInfo.gender?.name,
      fieldName: LocaleKeys.form_field_gender.tr(),
      selectedItemName: userInfo.gender?.name ?? '',
      enabled: !state.isReadMode,
      key: _genderKey,
      onItemSelected: (selectedName) {
        final selectedGender =
            lookupState.genders.firstWhere((g) => g.name == selectedName);
        cubit.setGenderId(selectedGender.id);
      },
    );
  }

  Widget _buildDocumentField(
    AccountSettingsCubit cubit,
    AccountSettingsState state,
    UserInfo userInfo,
  ) {
    return DocumentField(
      title: userInfo.userIdentities.isNotEmpty
          ? userInfo.userIdentities[0].documentTypeName ?? "Document"
          : "Document",
      files: userInfo.userIdentities,
      enabled: !state.isReadMode,
      onReplace: cubit.selectDocument,
    );
  }

  Widget _buildProfileImageField(
    AccountSettingsCubit cubit,
    AccountSettingsState state,
    UserInfo userInfo,
  ) {
    return AddEditProfileImage(
      enabled: !state.isReadMode,
      imageId: userInfo.profileImageUrl ??
          'https://www.goodhousekeeping.com/life/pets/g61070837/cutest-cat-breeds/',
      onImagePicked: (file) {
        if (file != null) {
          cubit.setProfileImage(XFile(file.path));
        }
      },
    );
  }

  Widget _buildVideoSection(
    AccountSettingsCubit cubit,
    AccountSettingsState state,
    UserInfo userInfo,
  ) {
    return VideoPlayerWithChange(
      enabled: !state.isReadMode,
      videoURL: userInfo.introVideoUrl,
      videoFile: state.videoFile,
      onVideoEditFinished: (file) {
        if (file != null) {
          cubit.setVideoFile(XFile(file.path));
        }
      },
    );
  }

  Widget _buildCertificatesSection(bool isReadMode) {
    return Column(
      children: [
        28.verticalSpace,
        ReciterSubmitJobCertificates(
          renderWithButtons: false,
          enabled: !isReadMode,
        ),
      ],
    );
  }

  Future<void> _handleSave(
    BuildContext context,
    AccountSettingsCubit cubit,
  ) async {
    if (!cubit.formKey.currentState!.validate()) {
      _scrollToFirstInvalidField(cubit);
      return;
    }

    ReciterSubmitJobState reciterSubmitJobState =
        context.read<ReciterSubmitJobCubit>().state;
    final success = await cubit.submitAccountSettings(
      context,
      reciterSubmitJobState.certificates,
      reciterSubmitJobState.otherCertificates,
    );
    if (success && context.mounted) {
      _showSuccessBottomSheet(context);
    }
  }

  void _showSuccessBottomSheet(BuildContext context) {
    showAppModalBottomSheet(
      isDismissible: true,
      mainBtnLabel: LocaleKeys.button_done,
      context: context,
      secOnPressed: context.router.popForced,
      mainOnPressed: () {
        context.router.popForced();
        context.router.popForced();
      },
      title: LocaleKeys.modalBottomSheet_title_alright,
      subTitle: LocaleKeys.modalBottomSheet_subTitle_st19,
      imagePath: Assets.images.sucessPopup.path,
    );
  }
}
