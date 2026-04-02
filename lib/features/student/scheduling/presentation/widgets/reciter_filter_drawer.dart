import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/drawer/app_filter_drawer.dart';
import '../bloc/reciter_listing/reciter_listing_cubit.dart';
import 'reciter_filter_drawer/reciter_filter_drawer_categories.dart';

class ReciterFilterDrawer extends StatelessWidget {
  const ReciterFilterDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final reciterListingCubit = BlocProvider.of<ReciterListingCubit>(context);

    return AppFilterDrawer(
      onApply: reciterListingCubit.pagingController.refresh,
      onReset: reciterListingCubit.resetDrawerFilterOptions,
      child: const ReciterFilterDrawerCategories(),
    );
  }
}
