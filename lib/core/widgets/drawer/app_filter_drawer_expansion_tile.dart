import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../../core/widgets/app_custom_checkbox.dart';
import '../../../../../../core/widgets/app_text_field.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../entities/base_field.dart';

class AppFilterDrawerExpansionTile extends StatelessWidget {
  final String categoryTitle;
  final List<BaseField> categoryList;
  final List<int> selectedCategoryList;
  final bool isCheckBox;
  final TextEditingController? searchTextEditingController;
  final Function(int) onTap;
  final void Function()? onSearch;

  const AppFilterDrawerExpansionTile({
    super.key,
    required this.categoryTitle,
    required this.categoryList,
    required this.selectedCategoryList,
    this.isCheckBox = false,
    this.searchTextEditingController,
    required this.onTap,
    this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: false,
      tilePadding: EdgeInsets.zero,
      dense: true,
      expandedAlignment: Alignment.topLeft,
      shape: const RoundedRectangleBorder(),
      childrenPadding: EdgeInsets.only(top: 5.w),
      title: Text(
        context.tr(categoryTitle),
        style: AppTextStyles.font20TextW500,
      ),
      children: [
        if (searchTextEditingController != null)
          _SearchField(
            onSearch: onSearch!,
            searchTextEditingController: searchTextEditingController!,
          ),
        for (var item in categoryList)
          _FilterCategoryItem(
            categoryItem: item,
            categoryList: categoryList,
            isCheckBox: isCheckBox,
            onTap: onTap,
            selectedCategoryList: selectedCategoryList,
          ),
      ],
    );
  }
}

class _SearchField extends StatelessWidget {
  final TextEditingController searchTextEditingController;
  final void Function() onSearch;

  const _SearchField({
    required this.searchTextEditingController,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.w),
      child: AppTextFormField(
        suffixIcon: IconButton(
          onPressed: onSearch,
          icon: SvgPicture.asset(
            Assets.icons.search.path,
            width: 20.w,
            height: 20.w,
          ),
        ),
        hintText:
            context.tr(LocaleKeys.student_scheduling_reciterListing_search),
        textEditingController: searchTextEditingController,
        textInputAction: TextInputAction.search,
        onFieldSubmitted: (val) => onSearch(),
      ),
    );
  }
}

class _FilterCategoryItem extends StatelessWidget {
  final BaseField categoryItem;
  final List<BaseField> categoryList;
  final List<int> selectedCategoryList;
  final bool isCheckBox;
  final Function(int) onTap;

  const _FilterCategoryItem({
    required this.categoryItem,
    required this.categoryList,
    required this.selectedCategoryList,
    required this.isCheckBox,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: categoryItem.id == categoryList.last.id ? 0 : 16.w,
      ),
      child: GestureDetector(
        onTap: () => onTap(categoryItem.id),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 12.w),
          decoration: BoxDecoration(
            color: selectedCategoryList.contains(categoryItem.id)
                ? const Color.fromRGBO(182, 198, 201, 0.25)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: isCheckBox
              ? AppCustomCheckbox(
                  value: selectedCategoryList.contains(categoryItem.id),
                  child: Text(
                    categoryItem.name,
                    style: AppTextStyles.font16TextW400OP8,
                  ),
                )
              : Text(
                  categoryItem.name,
                  style: AppTextStyles.font16TextW400OP8,
                ),
        ),
      ),
    );
  }
}
