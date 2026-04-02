import 'dart:io';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../../shared/domain/entites/user_info.dart';
import '../../../student/subscription/presentation/bloc/subscription/subscription_cubit.dart';

class DocumentField extends StatefulWidget {
  final String title;
  final List<UserIdentity>? files;
  final bool enabled;
  final Future<XFile?> Function(BuildContext) onReplace;

  const DocumentField({
    super.key,
    required this.title,
    this.files,
    required this.onReplace,
    this.enabled = true,
  });

  @override
  State<DocumentField> createState() => _DocumentFieldState();
}

class _DocumentFieldState extends State<DocumentField> {
  final Map<int, XFile> _replacedFiles = {};

  @override
  Widget build(BuildContext context) {
    final hasFiles = (widget.files?.isNotEmpty ?? false);
    final fileNames = _replacedFiles.isNotEmpty
        ? _replacedFiles.values.map((f) => f.name).toList()
        : (widget.files?.map((f) => f.fileName).toList() ?? ["No File"]);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: AppTextStyles.font15TextW400OP8),
          const SizedBox(height: 8),
          ...fileNames.map((name) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  children: [
                    const Icon(Icons.insert_drive_file, size: 40),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        name ?? "Unnamed",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: name == "No File" ? Colors.grey : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: widget.enabled && hasFiles
                    ? () => _previewFiles(context)
                    : null,
                icon: SvgPicture.asset(
                  Assets.icons.preview.path,
                  width: 20.w,
                  height: 20.w,
                ),
                label: Text(
                  LocaleKeys.button_preview.tr(),
                  style: AppTextStyles.font16TextW400.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: widget.enabled ? _replaceFile : null,
                icon: SvgPicture.asset(
                  Assets.icons.upload.path,
                  width: 20.w,
                  height: 20.w,
                ),
                label: Text(
                  LocaleKeys.button_replace.tr(),
                  style: AppTextStyles.font16TextW400.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _replaceFile() async {
    final result = await widget.onReplace(context);
    if (result == null) return;
    setState(() {
      _replacedFiles
        ..clear()
        ..[0] = result;
    });
  }

  void _previewFiles(BuildContext context) {
    final subCubit = getIt<SubscriptionCubit>();
    final filesToPreview = _replacedFiles.isNotEmpty
        ? _replacedFiles.values
            .map((f) => UserIdentity(fileName: f.name, fileUrl: f.path))
            .toList()
        : (widget.files ?? []);
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        child: PageView.builder(
          itemCount: filesToPreview.length,
          itemBuilder: (context, index) {
            final f = filesToPreview[index];
            final isImage = f.fileName!.endsWith('.png') ||
                f.fileName!.endsWith('.jpg') ||
                f.fileName!.endsWith('.jpeg');

            final isLocal = f.fileUrl != null && File(f.fileUrl!).existsSync();

            if (isLocal) {
              return _buildLocalPreview(f, isImage, context);
            } else {
              return _buildRemotePreview(f, isImage, subCubit, context);
            }
          },
        ),
      ),
    );
  }
}

Widget _buildLocalPreview(UserIdentity f, bool isImage, BuildContext context) {
  return Stack(
    children: [
      Container(
        padding: const EdgeInsets.all(12),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
          maxWidth: MediaQuery.of(context).size.width * 0.9,
        ),
        decoration: BoxDecoration(
          color: AppColors.lighterGrey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: isImage
            ? Image.file(File(f.fileUrl!), fit: BoxFit.contain)
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.insert_drive_file,
                      size: 80, color: Colors.black54),
                  const SizedBox(height: 12),
                  Text(f.fileUrl!, style: const TextStyle(fontSize: 16)),
                ],
              ),
      ),
      Positioned(
        top: 0,
        right: 0,
        child: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    ],
  );
}

Widget _buildRemotePreview(UserIdentity f, bool isImage,
    SubscriptionCubit subCubit, BuildContext context) {
  return FutureBuilder<Uint8List?>(
    future: subCubit.downloadFileFromUrl(f.fileUrl!),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
      if (!snapshot.hasData) {
        return const Center(child: Text("Failed to load file"));
      }
      return FutureBuilder<XFile>(
        future: subCubit.saveBytesToTempFile(snapshot.data!, f.fileName!),
        builder: (context, snapFile) {
          if (!snapFile.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final file = snapFile.data!;
          return _buildLocalPreview(
            UserIdentity(fileName: f.fileName, fileUrl: file.path),
            isImage,
            context,
          );
        },
      );
    },
  );
}
