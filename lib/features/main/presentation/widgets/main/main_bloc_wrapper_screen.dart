import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/app_bloc_wrapper_screen.dart';
import 'main_bottom_navbar.dart';

import '../../bloc/navbar/navbar_cubit.dart';

class MainBlocWrapperScreen extends StatelessWidget {
  final Widget child;
  final int initialPageIndex;
  const MainBlocWrapperScreen({
    super.key,
    required this.child,
    required this.initialPageIndex
  });

  @override
  Widget build(BuildContext context) {
    context.read<NavbarCubit>().updateIndex(initialPageIndex);
    return AppBlocWrapperScreen(
      bottomNavigationBar: const MainBottomNavbar(),
      child: child,
    );
  }
}
