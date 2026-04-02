import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/drawer/app_filter_drawer.dart';
import '../bloc/my_requests/my_requests_cubit.dart';
import 'my_requests_filter_drawer_categories.dart';

class MyRequestsFilterDrawer extends StatelessWidget {
  const MyRequestsFilterDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final reciterListingCubit = BlocProvider.of<MyRequestsCubit>(context);

    return AppFilterDrawer(
      onApply: reciterListingCubit.getMyRequests,
      onReset: reciterListingCubit.resetDrawerFilterOptions,
      child: const MyRequestsFilterDrawerCategories(),
    );
  }
}
