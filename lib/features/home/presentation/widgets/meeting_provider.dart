import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/utils/snackbar.dart';
import '../../../../core/utils/utils.dart';
import '../../../shared/presentation/bloc/meeting/meeting_cubit.dart';

class MeetingProvider extends StatelessWidget {
  final Widget child;
  const MeetingProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MeetingCubit>(),
      child: BlocListener<MeetingCubit, MeetingState>(
          listener: (context, state) {
            state.status.whenOrNull(
              loading: () => showAppLoadingDialog(context),
              failure: (error) => context.router.popForced(),
              success: () {
                context.router.popForced();
                if(!state.sessionStarted) {
                  return;
                }
                try {
                  Uri uri = Uri.parse(state.url);
                  String guid = uri.queryParameters['tokenGuid']!;
                  context.router.push(
                    SessionWebViewRoute(
                      url: state.url,
                      guid: guid,
                    ),
                  );
                } catch (err) {
                  showGeneralSnackBarError();
                }
              },
            );
          },
          child: child),
    );
  }
}
