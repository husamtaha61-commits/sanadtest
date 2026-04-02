import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/translations/locale_keys.g.dart';
import '../../di/injection.dart';
import '../../enums/app_enums.dart';
import '../../services/image_picker_service.dart';
import 'app_steps_user_identity_item.dart';

class AppStepsUserIdentityTypes extends StatelessWidget {
  final int? documentId;
  final XFile? frontImage;
  final XFile? backImage;
  final void Function(bool) unSetImage;
  final void Function(XFile?, bool) setImage;

  const AppStepsUserIdentityTypes({
    super.key,
    required this.documentId,
    required this.unSetImage,
    required this.setImage,
    this.frontImage,
    this.backImage,
  });

  @override
  Widget build(BuildContext context) {
    if (documentId == null) {
      return const SizedBox();
    } else if (documentId == UserIdTypes.identityCard.intValue) {
      return Column(
        children: [
          frontImage != null
              ? uploadIdentity(context, pickedImageName: frontImage!.name)
              : uploadIdentity(context,
                  assetImagePath: Assets.images.idFront.path),
          58.verticalSpace,
          backImage != null
              ? uploadIdentity(
                  context,
                  pickedImageName: backImage!.name,
                  label: LocaleKeys.subscription_uploadID_back,
                  isBack: true,
                )
              : uploadIdentity(
                  context,
                  assetImagePath: Assets.images.idBack.path,
                  label: LocaleKeys.subscription_uploadID_back,
                  isBack: true,
                ),
        ],
      );
    } else {
      return frontImage != null
          ? uploadIdentity(context, pickedImageName: frontImage!.name)
          : uploadIdentity(context,
              assetImagePath: getAssetImagePath(documentId!));
    }
  }

  String getAssetImagePath(int documentId) {
    if (documentId == UserIdTypes.passport.intValue) {
      return Assets.images.passport.path;
    } else if (documentId == UserIdTypes.drivingLicense.intValue) {
      return Assets.images.driverLicense.path;
    } else if (documentId == UserIdTypes.birthCertificate.intValue) {
      return Assets.images.birthCertificate.path;
    }
    return "";
  }

  Widget uploadIdentity(
    BuildContext context, {
    String? assetImagePath,
    String? pickedImageName,
    String label = LocaleKeys.subscription_uploadID_front,
    bool isBack = false,
  }) {
    return AppStepsUserIdentityItem(
      btnLabel: pickedImageName != null
          ? LocaleKeys.button_replace
          : LocaleKeys.button_upload,
      label: label,
      assetImagePath: assetImagePath,
      pickedImageName: pickedImageName,
      onCancel: () => unSetImage(isBack),
      onPressed: () async {
        final imageFile = await getIt<ImagePickerService>().pickImage(context);
        if (imageFile != null) {
          setImage(imageFile, isBack);
        }
      },
    );
  }
}
