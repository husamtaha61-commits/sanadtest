import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/di/injection.dart';
import '../../../../../../core/utils/snackbar.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../scheduling/presentation/bloc/reciter_favorite/reciter_favorite_cubit.dart';
import '../../bloc/student_my_schedule_cubit/student_my_schedule_cubit.dart';

class StudentMyScheduleBlocWrapper extends StatelessWidget {
  final Widget child;
  const StudentMyScheduleBlocWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ReciterFavoriteCubit>(),
          lazy: false,
        )
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<ReciterFavoriteCubit, ReciterFavoriteState>(
            listener: (context, state) {
              state.status.whenOrNull(
                loading: () => showAppLoadingDialog(context),
                failure: (error) => context.router.popForced(),
                success: () {
                  context.router.popForced();
                  showSnackBar(
                    context,
                    context.tr(state.msg),
                    SnackBarStatus.success,
                  );
                  BlocProvider.of<StudentMyScheduleCubit>(context)
                      .updateReciterIsFavorite(state.isFav);
                },
              );
            },
          ),
        ],
        child: child,
      ),
    );
  }
}
