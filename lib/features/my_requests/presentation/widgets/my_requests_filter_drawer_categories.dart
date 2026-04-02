import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/drawer/app_filter_drawer_body.dart';
import '../../../../../../core/widgets/drawer/app_filter_drawer_expansion_tile.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../../shared/presentation/bloc/lookup/lookup_cubit.dart';
import '../bloc/my_requests/my_requests_cubit.dart';

class MyRequestsFilterDrawerCategories extends StatelessWidget {
  const MyRequestsFilterDrawerCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final lookUpState = BlocProvider.of<LookupCubit>(context).state;
    final myRequestsCubit = BlocProvider.of<MyRequestsCubit>(context);

    return BlocBuilder<MyRequestsCubit, MyRequestsState>(
      builder: (context, state) {
        return AppFilterDrawerBody(
          children: [
            AppFilterDrawerExpansionTile(
              categoryTitle: LocaleKeys.myRequests_filters_status,
              categoryList: lookUpState.requestStatuses,
              selectedCategoryList: state.requestStatuses,
              onTap: myRequestsCubit.addRequestStatus,
            ),
            AppFilterDrawerExpansionTile(
              categoryTitle: LocaleKeys.myRequests_filters_requestType,
              categoryList: lookUpState.requestTypes,
              selectedCategoryList: state.requestTypes,
              onTap: myRequestsCubit.addRequestType,
            ),
            AppFilterDrawerExpansionTile(
              categoryTitle: LocaleKeys.myRequests_filters_requester,
              categoryList: lookUpState.requesterSides,
              selectedCategoryList: state.requesterSides,
              onTap: myRequestsCubit.addRequestSide,
            ),
          ],
        );
      },
    );
  }
}
