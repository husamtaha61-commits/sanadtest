import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/base_field.dart';
import '../../../../core/utils/snackbar.dart';
import '../../../../core/utils/utils.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../../shared/presentation/bloc/lookup/lookup_cubit.dart';
import '../bloc/my_requests/my_requests_cubit.dart';
import '../bloc/my_requests_actions/my_requests_actions_cubit.dart';

final snackbarMessages = {
  2: LocaleKeys.snackbar_requestApproved,
  3: LocaleKeys.snackbar_requestRejected,
  5: LocaleKeys.snackbar_requestCanceled,
};

class MyRequestsBlocWrapper extends StatelessWidget {
  final Widget child;
  const MyRequestsBlocWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MyRequestsActionsCubit, MyRequestsActionsState>(
      listener: (context, state) {
        state.status.whenOrNull(
          loading: () => showAppLoadingDialog(context),
          success: () {
            final BaseField requestStatus =
                BlocProvider.of<LookupCubit>(context)
                    .state
                    .requestStatuses
                    .firstWhere((ele) => ele.id == state.requestStatusId);
            context.router.maybePop();
            showGlobalSnackBar(
              snackbarMessages[requestStatus.id]!,
              SnackBarStatus.success,
            );
            BlocProvider.of<MyRequestsCubit>(context).getMyRequests();
          },
          failure: (error) => context.router.maybePop(),
        );
      },
      child: child,
    );
  }
}
