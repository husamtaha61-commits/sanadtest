import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fgbg/flutter_fgbg.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/home/presentation/bloc/SanadMinhaj/sanad_minhaj_progress_cubit.dart';
import '../features/home/presentation/bloc/programs/program_cubit.dart';
import '../features/home/presentation/bloc/reciter_student/reciter_student_cubit.dart';
import '../features/home/presentation/bloc/student_progress/student_progress_cubit.dart';

import '../features/main/presentation/bloc/navbar/navbar_cubit.dart';
import '../features/messaging/presentation/bloc/messaging/messaging_cubit.dart';
import '../features/messaging/presentation/bloc/messaging_contact/messaging_contact_cubit.dart';
import '../features/my_requests/presentation/bloc/my_requests/my_requests_cubit.dart';
import '../features/my_requests/presentation/bloc/my_requests_actions/my_requests_actions_cubit.dart';
import '../features/notification/presentation/bloc/action_center/action_center_cubit.dart';
import '../features/notification/presentation/bloc/notification/notification_cubit.dart';
import '../features/shared/presentation/bloc/admin/admin_cubit.dart';
import '../features/shared/presentation/bloc/user/user_cubit.dart';
import '../features/student/rescheduling/presentation/bloc/student_my_schedule_cubit/student_my_schedule_cubit.dart';
import 'constants/constants.dart';
import 'enums/app_enums.dart';
import 'services/app_preferences.dart';

import '../features/shared/presentation/bloc/lookup/lookup_cubit.dart';

import 'bloc/app/app_cubit.dart';
import 'bloc/data/data_cubit.dart';
import 'di/injection.dart';
import 'routes/app_router.dart';
import 'theme/app_theme.dart';
import '../features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'utils/notification_manager.dart';
import 'utils/utils.dart';

class SanadApp extends StatelessWidget {
  SanadApp({super.key});

  final AppRouter appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return Phoenix(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<NavbarCubit>(),
          ),
          BlocProvider(create: (context) => getIt<AppCubit>()),
          BlocProvider(create: (context) {
            getIt.resetLazySingleton<DataCubit>();
            return getIt<DataCubit>();
          }),
          BlocProvider(create: (context) => getIt<AuthCubit>()),
          BlocProvider(create: (context) => getIt<UserCubit>()),
          BlocProvider(create: (ctx) => getIt<StudentMyScheduleCubit>()),
          BlocProvider(create: (context) => getIt<MessagingCubit>()),
          BlocProvider(
            create: (context) => getIt<LookupCubit>()..getLookUpsData(),
            lazy: false,
          ),
          BlocProvider(
            create: (context) => getIt<AdminCubit>(),
            lazy: true,
          ),
          BlocProvider(
            create: (context) => getIt<ProgramCubit>()..getAllPrograms(),
          ),
          BlocProvider(create: (context) => getIt<StudentProgressCubit>()),
          BlocProvider(
            create: (context) =>
                getIt<NotificationCubit>()..getNotificationByPage(),
          ),
          BlocProvider(
              create: (context) =>
                  getIt<ActionCenterCubit>()..getActionsCenterByPage()),
          BlocProvider(create: (context) {
            final bloc = getIt<ReciterStudentCubit>();
            if (!isStudentRole(context)) {
              bloc.getAllReciterStudents();
            }
            return bloc;
          }),
          BlocProvider(create: (context) => getIt<MessagingContactCubit>()),
          BlocProvider(
            create: (context) => getIt<MyRequestsCubit>(),
            lazy: false,
          ),
          BlocProvider(
            create: (context) => getIt<MyRequestsActionsCubit>(),
            lazy: false,
          ),
          BlocProvider(
            create: (create) => getIt<SanadMinhajProgressCubit>(),
          ),
        ],
        child: Builder(
          builder: (ctx) {
            if (ctx.read<DataCubit>().isClosed) {
              getIt.resetLazySingleton<DataCubit>();
            }
            return FGBGNotifier(
              onEvent: (event) async {
                if (event == FGBGType.foreground) {
                  final pref = SharedPreferencesAsync();
                  final key = PreferencesKey.notifications.name;

                  final List<String> notifications =
                      await pref.getStringList(key) ?? [];
                  if (notifications.isNotEmpty) {
                    for (var notification in notifications) {
                      if (ctx.mounted) {
                        NotificationManager.handleLogic(
                            jsonDecode(notification), ctx);
                      }
                    }
                  }
                  pref.remove(key);
                }
              },
              child: MaterialApp.router(
                scaffoldMessengerKey: scaffoldMessengerKey,
                debugShowCheckedModeBanner: false,
                routerConfig: appRouter.config(
                  includePrefixMatches: true,
                  deepLinkBuilder: (deepLink) {
                    final mainPath = DeepLink([MainRoute()]);

                    final bool isLoggedIn =
                        getIt<AppPreferences>().isLoggedIn();
                    if (isLoggedIn &&
                        deepLink.path.startsWith('/api/reciters')) {
                      if (!getIt<AppPreferences>()
                          .getUserCachedResponse()
                          .roles
                          .map((e) => e.comparisonName)
                          .contains(UserRoles.Student.name)) {
                        return mainPath;
                      }
                      final reciterId = int.tryParse(
                          deepLink.configuration.uri.pathSegments.last);
                      final List<PageRouteInfo> reciterDetailsRoute =
                          reciterId != null
                              ? [ReciterDetailsRoute(reciterId: reciterId)]
                              : [];
                      FacebookAppEvents().logViewContent();
                      return DeepLink(
                        <PageRouteInfo>[
                              MainRoute(),
                              const ReciterListingRoute(),
                            ] +
                            reciterDetailsRoute,
                      );
                    } else {
                      return DeepLink.defaultPath;
                    }
                  },
                ),
                theme: appThemeData,
                localizationsDelegates: [
                  ...context.localizationDelegates,
                  ...PhoneFieldLocalization.delegates,
                ],
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                builder: DevicePreview.appBuilder,
              ),
            );
          },
        ),
      ),
    );
  }
}
