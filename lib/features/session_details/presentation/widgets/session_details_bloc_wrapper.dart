import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/di/injection.dart';
import '../../../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../bloc/session_confirmation/session_confirmation_cubit.dart';
import '../bloc/session_details/session_details_cubit.dart';

class SessionDetailsBlocWrapper extends StatelessWidget {
  final String sessionId;
  final Widget child;
  const SessionDetailsBlocWrapper({
    super.key,
    required this.sessionId,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AppBlocWrapperScreen(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                getIt<SessionDetailsCubit>()..getSessionDetails(sessionId),
            lazy: false,
          ),
          BlocProvider(
            create: (context) => getIt<SessionConfirmationCubit>(),
          ),
        ],
        child: child,
      ),
    );
  }
}
