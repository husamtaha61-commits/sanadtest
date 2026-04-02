import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/app_page_subtitle.dart';
import '../../../../gen/translations/locale_keys.g.dart';

class NotesTitle extends StatelessWidget {
  final bool isAuthoredByMe;

  const NotesTitle({
    super.key,
    required this.isAuthoredByMe,
  });

  @override
  Widget build(BuildContext context) {
    return isAuthoredByMe
        ? const AppPageSubtitle(title: LocaleKeys.notes_myNotes)
        : AppPageSubtitle(
            title: isStudentRole(context)
                ? LocaleKeys.notes_reciterNotes
                : LocaleKeys.notes_studentNotes,
          );
  }
}
