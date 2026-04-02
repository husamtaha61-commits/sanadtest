import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/enums/app_enums.dart';
import '../../../shared/presentation/bloc/admin/admin_cubit.dart';
import '../../../shared/presentation/bloc/user/user_cubit.dart';
import '../widgets/auth_become_a_reciter_action_text.dart';
import '../widgets/auth_divider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/services/app_preferences.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/form_fields/email_text_field.dart';
import '../../../../core/widgets/form_fields/password_text_field.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../data/models/requests/user_signin_request.dart';
import '../bloc/auth/auth_cubit.dart';
import '../widgets/auth_bloc_wrapper.dart';
import '../widgets/auth_container.dart';
import '../widgets/auth_form.dart';
import '../widgets/auth_form_footer.dart';
import '../widgets/auth_form_text.dart';
import '../widgets/auth_social_links.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  final VoidCallback? showSnackbarFn;
  const LoginPage({
    super.key,
    this.showSnackbarFn,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    if (widget.showSnackbarFn != null) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => widget.showSnackbarFn?.call(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthBlocWrapper(
      success: () async {
        final authState = context.read<AuthCubit>().state;
        final userCubit = context.read<UserCubit>();
        if (getIt<AppPreferences>().isLoggedIn() && context.mounted) {
          await userCubit.getUserInfo();
          context.read<AdminCubit>().getAdminConfig();
        }
        final userState = userCubit.state;

        if (context.mounted) {
          if (userState.role?.comparisonName == UserRoles.Reciter.name) {
            if (userState.isVerified && !authState.isLoginCompleted) {
              context.router.push(const ReciterCompleteProfileRoute());
            } else {
              navigateToHomePage(context, handleCustomRouting: true);
              FacebookAppEvents().logViewContent();
            }
          } else {
            // For Student only "login by email"
            if (!authState.isVerified) {
              context.router.push(const VerificationRoute());
            } else {
              userCubit.updateUserSettings();
              // For Student only "login by social"
              if (!authState.isLoginCompleted) {
                context.router.push(const CompleteProfileRoute());
              } else {
                navigateToHomePage(context, handleCustomRouting: true);
                FacebookAppEvents().logViewContent();
              }
            }
          }
        }
      },
      child: const AuthContainer(
        needLangMenu: true,
        child: _LoginForm(),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final password = TextEditingController();

  void signIn() {
    if (formKey.currentState!.validate()) {
      context.read<AuthCubit>().signInByEmail(
            UserSignInRequest(
                email: emailController.text, password: password.text),
          );
      TextInput.finishAutofillContext();
    }
  }

  @override
  void initState() {
    super.initState();
    final email = getIt<AppPreferences>().email;
    emailController.text = email;
  }

  @override
  void dispose() {
    emailController.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthForm(
      title: LocaleKeys.login_form_title,
      titleStyle: AppTextStyles.font32TextW700,
      formKey: formKey,
      children: [
        16.verticalSpace,
        const AuthSocialLinks(),
        14.verticalSpace,
        const AuthFormText(
          text: LocaleKeys.login_form_st1,
          isSubTitle: true,
        ),
        48.verticalSpace,
        AutofillGroup(
          child: Column(
            children: [
              EmailTextField(textEditingController: emailController),
              18.verticalSpace,
              PasswordTextField(
                label: AppFormFields.password,
                textEditingController: password,
                textInputAction: TextInputAction.done,
                validator: (value) => null,
              ),
            ],
          ),
        ),
        10.verticalSpace,
        const _ForgotPasswordActionText(),
        60.verticalSpace,
        AppElevatedButton(
          onPressed: signIn,
          backgroundColor: AppColors.goldenOrange,
          child: Text(
            context.tr(LocaleKeys.button_login),
            style: AppTextStyles.font14WhiteW500,
          ),
        ),
        24.verticalSpace,
        AuthFormFooter(
          text: LocaleKeys.login_form_st2p1,
          actionText: LocaleKeys.login_form_st2p2,
          onTap: () => context.router.push(const RegistrationRoute()),
        ),
        16.verticalSpace,
        const AuthDivider(),
        16.verticalSpace,
        const AuthBecomeAReciterActionText(),
      ],
    );
  }
}

class _ForgotPasswordActionText extends StatelessWidget {
  const _ForgotPasswordActionText();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: GestureDetector(
        onTap: () => context.router.push(const ForgotPasswordRoute()),
        child: Text(
          context.tr(LocaleKeys.login_form_forgot),
          style: AppTextStyles.font15GoldenOrangeW700OP8,
        ),
      ),
    );
  }
}

class TestPath extends StatelessWidget {
  const TestPath({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient:
              RadialGradient(colors: [Color(0xFFA4C2B8), Color(0xFF76A291)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 2000,
                child: CustomPaint(
                  painter: CustomPainterTest(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomPainterTest extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15
      ..color = Colors.yellow;

    var path = Path();

    final midWidth = size.width / 2;
    final widthEnd = size.width * 0.95;
    final widthStart = size.width * 0.05;
    const heightMargin = 120;

    final points = [
      Offset(midWidth, heightMargin * 1),
      Offset(widthEnd, heightMargin * 2),
      Offset(midWidth, heightMargin * 3),
      Offset(widthStart, heightMargin * 4),
      Offset(midWidth, heightMargin * 5),
      Offset(widthEnd, heightMargin * 6),
      Offset(midWidth, heightMargin * 7),
      Offset(widthStart, heightMargin * 8),
    ];

    path.moveTo(points[0].dx, points[0].dy);

    for (var i = 1; i < points.length - 2; i++) {
      final xc = (points[i].dx + points[i + 1].dx) / 2;
      final yc = (points[i].dy + points[i + 1].dy) / 2;

      path.quadraticBezierTo(points[i].dx, points[i].dy, xc, yc);
    }

    canvas.drawPath(path, paint);
    for (var p in points) {
      canvas.drawCircle(p, 10, paint..color = Colors.black);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
