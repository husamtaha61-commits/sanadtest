import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/app_page_action_subtitle.dart';
import 'reciter_details_action_icon.dart';

import '../../../../../../core/models/base_status.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../bloc/reciter_favorite/reciter_favorite_cubit.dart';

class ReciterDetailsTitle extends StatelessWidget {
  final BaseStatus status;
  final String? videoId;
  final int? reciterId;
  final bool? isFav;

  const ReciterDetailsTitle(
      {super.key,
      required this.reciterId,
      required this.status,
      required this.isFav,
      this.videoId});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AppPageActionSubtitle(
          subTitle: LocaleKeys.student_scheduling_reciterDetails_title,
        ),
        _ActionButtons(
                reciterId: reciterId ?? 0,
                isFav: isFav ?? false,
              )
      ],
    );
  }
}

class _ActionButtons extends StatelessWidget {
  final int reciterId;
  final bool isFav;

  const _ActionButtons({
    required this.reciterId,
    required this.isFav,
  });

  @override
  Widget build(BuildContext context) {
    final reciterFavoriteCubit = BlocProvider.of<ReciterFavoriteCubit>(context);

    return Row(
      children: [
        ReciterDetailsActionIcon(
          imagePath: Assets.icons.shareVideo.path,
          color: Colors.white,
          onTap: () => shareReciterPage(reciterId),
        ),
        10.horizontalSpace,
        ReciterDetailsActionIcon(
          imagePath: isFav
              ? Assets.icons.favFilledBlue.path
              : Assets.icons.favOutlinedBlue.path,
          color: Colors.white,
          onTap: () {
            isFav
                ? reciterFavoriteCubit.deleteReciterFromFavorite(reciterId)
                : reciterFavoriteCubit.addReciterToFavorite(reciterId);
          },
        ),
      ],
    );
  }
}
