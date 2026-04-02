import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/auth/presentation/bloc/auth/auth_cubit.dart';
import '../bloc/data/data_cubit.dart';
import '../di/injection.dart';
import '../services/firebase_messaging_listener.dart';
import '../theme/styles/app_colors.dart';
import '../utils/snackbar.dart';

class AppBlocWrapperScreen<TBloc extends Cubit<TState>, TState>
    extends StatefulWidget {
  final TBloc? bloc;
  final BlocListener? blocListener;
  final PreferredSizeWidget? appBar;
  final Widget child;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? bottomAppBar;
  final Widget? floatingActionButton;

  const AppBlocWrapperScreen({
    super.key,
    required this.child,
    this.bloc,
    this.blocListener,
    this.appBar,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomAppBar,
    this.floatingActionButton,
  });

  @override
  State<AppBlocWrapperScreen<TBloc, TState>> createState() =>
      _AppBlocWrapperScreenState<TBloc, TState>();
}

class _AppBlocWrapperScreenState<TBloc extends Cubit<TState>, TState>
    extends State<AppBlocWrapperScreen<TBloc, TState>> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initFirebaseMessaging();
    });
  }

  Future<void> _initFirebaseMessaging() async {
    final firebaseMessagingListener = getIt<FirebaseMessagingListener>();
    await firebaseMessagingListener.setupMessageListeners(context);
  }

  Widget _buildBody() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: widget.bloc != null
          ? BlocProvider<TBloc>(
              create: (context) => widget.bloc!,
              child: _buildBlocListeners(widget.blocListener, widget.child),
            )
          : _buildBlocListeners(widget.blocListener, widget.child),
    );
  }

  MultiBlocListener _buildBlocListeners(
      BlocListener? blocListener, Widget child) {
    return MultiBlocListener(
      listeners: [
        BlocListener<DataCubit, DataState>(
          listener: (context, state) {
            state.whenOrNull(
              error: (message, statusCode) {
                if (statusCode == 401) {
                  _logout(context, message);
                } else {
                  showSnackBar(context, message, SnackBarStatus.error);
                }
              },
              success: (message) =>
                  showSnackBar(context, message, SnackBarStatus.success),
            );
          },
        ),
        if (blocListener != null) blocListener,
      ],
      child: child,
    );
  }

  Future<void> _logout(BuildContext context, String message) async {
    await context.read<AuthCubit>().signout(
          context: context,
          isRebuild: true,
          showSnackbarFn: () =>
              showGlobalSnackBar(message, SnackBarStatus.error),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar ??
          AppBar(
            toolbarHeight: 0.w,
            scrolledUnderElevation: 0,
            backgroundColor: AppColors.navyBlue,
            bottom: widget.bottomAppBar,
          ),
      body: _buildBody(),
      drawer: widget.drawer,
      endDrawer: widget.endDrawer,
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButton: widget.floatingActionButton,
    );
  }
}
