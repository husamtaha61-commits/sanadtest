import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/fonts.gen.dart';
import '../../di/injection.dart';
import '../../services/app_preferences.dart';
import 'app_colors.dart';

/*   
     |   fontSize   |   fontWeigth   |         color            |   opacity   |
     |========================================================================|
     |      46      |      600       |         navyBlue         |      1      |
     |========================================================================|
     |      40      |      600       |         white            |      1      |
     |========================================================================|
     |      36      |      700       |         text             |      1      |
     |========================================================================|
     |      32      |      700       |         text             |      1      |
     |      32      |      700       |         black            |      1      |
     |      32      |      700       |         navyBlue         |      1      |
     |      32      |      700       |         goldenOrange     |      1      |
     |      32      |      600       |         text             |      1      |
     |      32      |      400       |         white            |      1      |
     |========================================================================|       
     |      30      |      700       |         white            |      1      |
     |      30      |      400       |         Text             |      1      |
     |========================================================================|       
     |      28      |      700       |         black            |      1      |
     |      28      |      700       |         navyBlue         |      1      |
     |      28      |      600       |         text             |      1      |
     |      28      |      500       |         slateBlue        |      1      |
     |========================================================================|       
     |      24      |      700       |         navyBlue         |      1      |
     |      24      |      700       |         goldenOrange     |      1      |
     |      24      |      700       |         text             |      1      |
     |      24      |      700       |         black            |      1      |
     |      24      |      600       |         text             |      1      |
     |      24      |      600       |         goldenOrange     |      1      |
     |      24      |      600       |         navyBlue         |      1      |
     |========================================================================| 
     |      20      |      700       |         white            |      1      |         
     |      20      |      700       |         text             |      1      |         
     |      20      |      600       |         goldenOrange     |      1      |         
     |      20      |      600       |         text             |      1      |         
     |      20      |      600       |         white            |      1      |         
     |      20      |      500       |         text             |      1      |         
     |========================================================================|  
     |      18      |      700       |         text             |      1      |
     |      18      |      600       |         goldenOrange     |      1      |
     |      18      |      500       |         text             |      1      |
     |      18      |      400       |         text             |      1      |
     |========================================================================|  
     |      16      |      700       |         text             |      1      |
     |      16      |      700       |         navyBlue         |      1      |
     |      16      |      700       |         white            |      1      |
     |      16      |      600       |         navyBlue         |      1      |
     |      16      |      600       |         white            |      1      |
     |      16      |      600       |         goldenOrange     |      1      |
     |      16      |      600       |         text             |      1      |
     |      16      |      500       |         goldenOrange     |      1      |
     |      16      |      500       |         navyBlue         |      1      |
     |      16      |      500       |         text             |      1      |
     |      16      |      400       |         navyBlue         |      1      |
     |      16      |      400       |         white            |      1      |
     |      16      |      400       |         black            |      1      |
     |      16      |      400       |         text             |      1      |
     |      16      |      400       |         text             |      0.8    |
     |      16      |      400       |         text             |      0.6    |
     |==========================================================|=============|
     |      15      |      800       |         text             |      1      |
     |      15      |      700       |         goldenOrange     |      1      |
     |      15      |      700       |         goldenOrange     |      0.8    |
     |      15      |      700       |         navyBlue         |      1      |
     |      15      |      600       |         text             |      1      |
     |      15      |      500       |         text             |      1      |
     |      15      |      400       |         navyBlue         |      1      |
     |      15      |      400       |         navyBlue         |      0.8    |
     |      15      |      400       |         goldenOrange     |      1      |
     |      15      |      400       |         navyBlue         |      1      |
     |      15      |      400       |         white            |      1      |
     |      15      |      400       |         text             |      1      |
     |      15      |      400       |         text             |     0.8     |
     |      15      |      400       |         text             |     0.6     |
     |      15      |      300       |         text             |      1      |
     |      15      |      300       |         white            |      1      |
     |==========================================================|=============|
     |      14      |      700       |         black            |      1      |
     |      14      |      600       |         text             |      1      |
     |      14      |      600       |         black            |      1      |
     |      14      |      500       |         goldenOrange     |      1      |
     |      14      |      500       |         navyBlue         |      1      |
     |      14      |      500       |         text             |      1      |
     |      14      |      500       |         white            |      1      |
     |      14      |      400       |         white            |      1      |
     |      14      |      400       |        goldenOrange      |      1      |
     |      14      |      400       |         text             |      1      |
     |      14      |      400       |         text             |     0.8     |
     |      14      |      400       |         text             |     0.6     |
     |      14      |      300       |         text             |      1      |
     |      14      |      300       |         text             |     0.73    |
     |      14      |      300       |         text             |     0.6     |
     |==========================================================|=============|
     |      12      |      700       |         goldenOrange     |      1      |
     |      12      |      700       |         white            |      1      |
     |      12      |      700       |         navyBlue         |      1      |
     |      12      |      600       |         navyBlue         |      1      |
     |      12      |      600       |         white            |      1      |
     |      12      |      600       |         text             |      1      |
     |      12      |      500       |         navyBlue         |      1      |
     |      12      |      500       |         text             |      1      |
     |      12      |      500       |         text             |     0.8     |
     |      12      |      400       |         goldenOrange     |      1      |
     |      12      |      400       |         navyBlue         |      1      |
     |      12      |      400       |         white            |      1      |
     |      12      |      400       |         text             |      1      |
     |      12      |      400       |         text             |     0.8     |
     |      12      |      400       |         text             |     0.7     |
     |      12      |      400       |         text             |     0.6     |
     |      12      |      300       |         text             |     1       |
     |========================================================================|
     |      10      |      700       |         white            |      1      |
     |      10      |      500       |         white            |      1      |
     |      10      |      500       |         text             |      1      |
     |      10      |      400       |         white            |      1      |
     |      10      |      400       |         text             |      1      |
     |      10      |      400       |         text             |      0.8    |
     |      10      |      400       |         text             |      0.7    |
     |      10      |      400       |         text             |      0.6    |
     |      10      |      300       |         text             |      0.8    |
     |      10      |      300       |         navyBlue         |       1     |
     |========================================================================|
     |      8      |      300       |         white             |       1     |
     |========================================================================|

     font40WhiteW600OP8 ==> (fontSize : 40, color: Colors.white.withAlpha(200), fontWeight: 600)
*/

TextTheme get appTextTheme {
  final isAr = getIt<AppPreferences>().isAr;
  return Typography.englishLike2021.merge(Typography.blackRedwoodCity).apply(
        decorationColor: AppColors.textColor,
        bodyColor: AppColors.textColor,
        displayColor: AppColors.textColor,
        fontFamily: isAr ? FontFamily.almarai : FontFamily.readexPro,
      );
}

class AppTextStyles {
  static TextStyle font46NavyBlueW600 = TextStyle(
    fontSize: 46.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.navyBlue,
  );

  static TextStyle font40WhiteW600 = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle font36TextW700 = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textColor,
  );

  static TextStyle font32TextW700 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textColor,
  );

  static TextStyle font32NazyBlueW700 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.navyBlue,
  );

  static TextStyle font32GoldenOrangeW700 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.goldenOrange,
  );

  static TextStyle font32WhiteW600 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle font32WhiteW400 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle font32BlackW700 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle font30WhiteW700 = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle font30TextW400 = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
  );

  static TextStyle font28BlackW700 = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle font28NavyBlueW700 = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.navyBlue,
  );

  static TextStyle font28TextW600 = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );

  static TextStyle font28SlateBlueW500 = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.slateBlue,
  );

  static TextStyle font24GoldenOrangeW700 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.goldenOrange,
  );

  static TextStyle font24TextW700 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textColor,
  );

  static TextStyle font24BlackW700 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle font24NavyBlueW700 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.navyBlue,
  );

  static TextStyle font24TextW600 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );

  static TextStyle font24GoldenOrangeW600 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.goldenOrange,
  );

  static TextStyle font24NavyBlueW600 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.navyBlue,
  );
  static TextStyle font24NavyBlueW600P5 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.navyBlue.withValues(alpha: 0.5),
  );

  static TextStyle font24TextW400 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
  );

  static TextStyle font20TextW600 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );

  static TextStyle font20TextW400 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
  );

  static TextStyle font20TextW400OP8 = font20TextW400.copyWith(
    color: AppColors.textColor.withAlpha(200),
  );

  static TextStyle font20TextW700 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textColor,
  );

  static TextStyle font20White700 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle font20White600 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle font20GoldenOrange600 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.goldenOrange,
  );

  static TextStyle font20TextW500 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );

  static TextStyle font18TextW700 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textColor,
  );

  static TextStyle font18TextW600 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.goldenOrange,
  );

  static TextStyle font18TextW500 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );

  static TextStyle font18TextW400 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
  );

  static TextStyle font16TextW700 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textColor,
  );

  static TextStyle font16WhiteW700 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle font16NavyBlueW700 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.navyBlue,
  );

  static TextStyle font16NavyBlueW600 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.navyBlue,
  );

  static TextStyle font16TextW600 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );

  static TextStyle font16GoldenOrangeW600 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.goldenOrange,
  );

  static TextStyle font16WhiteW600 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle font16NavyBlueW500 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.navyBlue,
  );

  static TextStyle font16NavyBlueW500P5 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.navyBlue.withValues(alpha: 0.5),
  );

  static TextStyle font16TextW500 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );

  static TextStyle font16GoldenOrangeW500 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.goldenOrange,
  );

  static TextStyle font16TextW400 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
  );

  static TextStyle font16NavyBlueW400 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.navyBlue,
  );

  static TextStyle font16WhiteW400 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle font16BlackW400 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  //Color(0xFF003D7A),

  static TextStyle font16darkNavyBlueW400 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF003D7A),
  );

  static TextStyle font14darkNavyBlueW400 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF003D7A),
  );

  static TextStyle font16TextW400OP8 =
      font16TextW400.copyWith(color: AppColors.textColor.withAlpha(200));

  static TextStyle font16TextW400OP6 =
      font16TextW400.copyWith(color: AppColors.textColor.withAlpha(150));

  static TextStyle font15TextW800 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.textColor,
  );

  static TextStyle font15GoldenOrangeW700 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.goldenOrange,
  );

  static TextStyle font15NavyBlueW700 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.navyBlue,
  );

  static TextStyle font15NavyBlueW500 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.navyBlue,
  );

  static TextStyle font15GoldenOrangeW700OP8 = font15GoldenOrangeW700.copyWith(
    color: AppColors.goldenOrange.withAlpha(200),
  );

  static TextStyle font15TextW600 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );

  static TextStyle font15TextW500 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );
  
  static TextStyle font15TextW500P5 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor.withValues(alpha: 0.5),
  );

  static TextStyle font15GoldenOrangeW400 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.goldenOrange,
  );

  static TextStyle font15NavyBlueW400 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.navyBlue,
  );

  static TextStyle font15NavyBlueW400OP8 =
      font15NavyBlueW400.copyWith(color: AppColors.navyBlue.withAlpha(200));

  static TextStyle font15WhiteW400 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle font15TextW400 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
  );

  static TextStyle font15TextW400OP8 =
      font15TextW400.copyWith(color: AppColors.textColor.withAlpha(200));

  static TextStyle font15TextW400OP6 =
      font15TextW400.copyWith(color: AppColors.textColor.withAlpha(150));

  static TextStyle font15WhiteW300 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w300,
    color: Colors.white,
  );

  static TextStyle font15TextW300 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.textColor,
  );

  static TextStyle font14BlackW700 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle font14BlackW600 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static TextStyle font14TextW600 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );

  static TextStyle font14navyBlueW500 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.navyBlue,
  );

  static TextStyle font14WhiteW500 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle font14GoldenOrangeW500 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.goldenOrange,
  );

  static TextStyle font14TextW500 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );

  static TextStyle font14GoldenOrangeW400 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.goldenOrange,
  );

  static TextStyle font14navyBlueW400 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.navyBlue,
  );

  static TextStyle font14TextW400 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
  );

  static TextStyle font14BlueDarkW400 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.blueDark,
  );

  static TextStyle font14TextW300 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.textColor,
  );

  static TextStyle font14TextW600OP6 = font14TextW600.copyWith(
    color: AppColors.textColor.withAlpha(150),
  );

  static TextStyle font14TextW300OP6 = font14TextW300.copyWith(
    color: AppColors.textColor.withAlpha(150),
  );

  static TextStyle font14TextW300OP73 = font14TextW300.copyWith(
    color: AppColors.textColor.withAlpha(130),
  );

  static TextStyle font14WhiteW400 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle font14TextW400OP8 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor.withAlpha(200),
  );

  static TextStyle font14TextW400OP6 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor.withAlpha(150),
  );

  static TextStyle font12TextW700 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textColor,
  );

  static TextStyle font12GoldenOrangeW700 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.goldenOrange,
  );

  static TextStyle font12WhiteW700 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle font12NavyBlueW700 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.navyBlue,
  );

  static TextStyle font12WhiteW600 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle font12TextW600 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );

  static TextStyle font12NavyBlueW600 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.navyBlue,
  );

  static TextStyle font12navyBlueW500 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.navyBlue,
  );

  static TextStyle font12TextW500 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );

  static TextStyle font12TextW500OP8 =
      font12TextW500.copyWith(color: AppColors.textColor.withAlpha(200));

  static TextStyle font12navyBlueW400 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.navyBlue,
  );

  static TextStyle font12WhiteW400 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle font12GoldenOrangeW400 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.goldenOrange,
  );

  static TextStyle font12TextW400 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
  );

  static TextStyle font12TextW400OP8 =
      font12TextW400.copyWith(color: AppColors.textColor.withAlpha(200));

  static TextStyle font12TextW400OP7 =
      font12TextW400.copyWith(color: AppColors.textColor.withAlpha(125));

  static TextStyle font12TextW400OP6 =
      font12TextW400.copyWith(color: AppColors.textColor.withAlpha(150));

  static TextStyle font12TextW300 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.textColor,
  );
   static TextStyle font12TextW300P5 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.textColor.withValues(alpha: 0.5),
  );

  static TextStyle font10WhiteW700 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle font10WhiteW500 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle font10TextW500 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );

  static TextStyle font10WhiteW400 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle font10TextW400 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
  );

  static TextStyle font10NavyBlueW400 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.navyBlue,
  );

  static TextStyle font10TextW400OP8 = font10TextW400.copyWith(
    color: AppColors.textColor.withAlpha(200),
  );

  static TextStyle font10TextW400OP7 =
      font10TextW400.copyWith(color: AppColors.textColor.withAlpha(125));

  static TextStyle font10TextW400OP6 =
      font10TextW400.copyWith(color: AppColors.textColor.withAlpha(150));

  static TextStyle font10TextW300OP8 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.textColor.withAlpha(200),
  );

  static TextStyle font10NavyBlueW300 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.navyBlue,
  );

  static TextStyle font8WhiteW300 = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.w300,
    color: Colors.white,
  );
}
