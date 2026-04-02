import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/styles/app_shadows.dart';
import '../../../../gen/assets.gen.dart';
import '../bloc/auth/auth_cubit.dart';

class AuthSocialLinks extends StatelessWidget {
  const AuthSocialLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _AuthSocialItem(
          imagePath: Assets.images.google.path,
          onTap: authCubit.signInByGoogle,
        ),
        if (Platform.isIOS)
          _AuthSocialItem(
            imagePath: Assets.images.apple.path,
            onTap: authCubit.signInByApple,
          ),
        _AuthSocialItem(
          imagePath: Assets.images.facebook.path,
          onTap: authCubit.signInByFacebook,
        ),
      ],
    );
  }
}

class _AuthSocialItem extends StatelessWidget {
  final String imagePath;
  final Function() onTap;

  const _AuthSocialItem({
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsetsDirectional.only(end: 15.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: AppShadows.blur4BlackOP25,
        ),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 27.r,
          child: SvgPicture.asset(
            imagePath,
            width: 24.w,
            height: 24.w,
          ),
        ),
      ),
    );
  }
}
