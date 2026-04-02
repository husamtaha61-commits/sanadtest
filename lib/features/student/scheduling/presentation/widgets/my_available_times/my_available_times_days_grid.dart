import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../../core/entities/base_field.dart';
import '../../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../shared/presentation/bloc/lookup/lookup_cubit.dart';
import '../../bloc/reciter_listing/reciter_listing_cubit.dart';

class MyAvailableTimesDaysGrid extends StatelessWidget {
  const MyAvailableTimesDaysGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final lookUpState = BlocProvider.of<LookupCubit>(context).state;

    return Padding(
      padding: EdgeInsets.only(left: 3.w),
      child: AlignedGridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.w,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: lookUpState.days.length,
        itemBuilder: (context, index) => _DayItem(
          day: lookUpState.days[index],
        ),
      ),
    );
  }
}

class _DayItem extends StatelessWidget {
  final BaseField day;
  const _DayItem({required this.day});

  @override
  Widget build(BuildContext context) {
    final reciterListingCubit = BlocProvider.of<ReciterListingCubit>(context);

    return GestureDetector(
      onTap: () => reciterListingCubit.addDay(day.id),
      child: Container(
        constraints: BoxConstraints(minHeight: 30.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color.fromRGBO(
              119,
              116,
              132,
              0.4,
            ),
          ),
          borderRadius: BorderRadius.circular(4.r),
          color: reciterListingCubit.selectedDays.contains(day.id)
              ? const Color.fromRGBO(182, 198, 201, 0.25)
              : Colors.white,
        ),
        child: Text(
          day.name,
          style: AppTextStyles.font15TextW400.copyWith(
            color: const Color(0xff777484),
          ),
        ),
      ),
    );
  }
}
