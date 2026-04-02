import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/assets.gen.dart';
import '../theme/styles/app_text_style.dart';

class AppDocumentNamePreview extends StatelessWidget {
  final String documentName;
  final VoidCallback removeDocument;

  const AppDocumentNamePreview({
    super.key,
    required this.documentName,
    required this.removeDocument,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Expanded(
              child: Text(
                documentName,
                style: AppTextStyles.font15TextW400,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          5.horizontalSpace,
          GestureDetector(
            onTap: removeDocument,
            child: SvgPicture.asset(
              Assets.icons.clearOp8.path,
              width: 16.w,
              height: 16.w,
            ),
          )
        ],
      ),
    );
  }
}
