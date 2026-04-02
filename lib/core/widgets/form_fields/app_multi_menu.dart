import 'dart:async';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/translations/locale_keys.g.dart';
import '../../di/injection.dart';
import '../../services/app_preferences.dart';
import '../../theme/styles/app_colors.dart';
import '../../theme/styles/app_text_style.dart';
import '../../utils/app_form_validator.dart';

class AppMultiMenu<T> extends StatefulWidget {
  final FutureOr<List<T>> items;
  final String Function(T) itemAsString;
  final String selectedItemName;
  final String fieldName;
  final String label;
  final bool showClearIcon;
  final bool showSearchBox;
  final List<T> selectedItems;
  final Function(List<T>) onItemSelected;
  final bool enabled;
  final bool Function(T, T)? compareFn;
  const AppMultiMenu({
    super.key,
    required this.items,
    required this.itemAsString,
    required this.label,
    required this.selectedItems,
    required this.onItemSelected,
    required this.selectedItemName,
    required this.fieldName,
    this.compareFn,
    this.showClearIcon = false,
    this.showSearchBox = false,
    this.enabled = true,
  });

  @override
  State<AppMultiMenu<T>> createState() => _AppMultiMenuState<T>();
}

class _AppMultiMenuState<T> extends State<AppMultiMenu<T>> {
  final dropDownSearchKey = GlobalKey<DropdownSearchState<T>>();

  @override
  Widget build(BuildContext context) {
    final isAr = getIt<AppPreferences>().isAr;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.tr(widget.label), style: AppTextStyles.font15TextW400OP8),
        3.verticalSpace,
        DropdownSearch<T>.multiSelection(
          enabled: widget.enabled,
          onBeforePopupOpening: (selectedItem) async {
            FocusManager.instance.primaryFocus?.unfocus();
            return true;
          },
          dropdownBuilder: (context, selectedItems) {
            if (selectedItems.isNotEmpty) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: IntrinsicHeight(
                  child: Row(
                    children: selectedItems
                        .map(
                          (item) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 4.w,
                                horizontal: 8.w,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.lighterGrey3,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  dropDownSearchKey.currentState
                                      ?.removeItem(item);
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      widget.itemAsString(item),
                                      style: AppTextStyles.font14TextW400OP8,
                                    ),
                                    8.horizontalSpace,
                                    SvgPicture.asset(Assets.icons.clear.path),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              );
            }
            return const SizedBox();
          },
          compareFn: widget.compareFn ?? (p0, p1) => p0 == p1,
          selectedItems: widget.selectedItems,
          key: dropDownSearchKey,
          validator: (values) {
            if (values == null || values.isEmpty) {
              return AppFormValidator.validateRequiredField(widget.selectedItemName, widget.fieldName);
            }
            return null;
          },
          onChanged: (values) {
            widget.onItemSelected(values);
          },
          items: (f, cs) => widget.items,
          itemAsString: widget.itemAsString,
          //##############################################################
          decoratorProps: DropDownDecoratorProps(
            baseStyle: AppTextStyles.font15TextW400,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
              hintText: context.tr(LocaleKeys.form_values_select),
              helperStyle: AppTextStyles.font14TextW400OP8,
            ),
          ),
          //##############################################################
          suffixProps: DropdownSuffixProps(
            dropdownButtonProps: const DropdownButtonProps(
              iconOpened: Icon(
                color: Color(0xff636173),
                Icons.keyboard_arrow_up_sharp,
              ),
              iconClosed: Icon(
                color: Color(0xff636173),
                Icons.keyboard_arrow_down_sharp,
              ),
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity(
                horizontal: -2,
                vertical: -4,
              ),
            ),
            clearButtonProps: widget.showClearIcon
                ? const ClearButtonProps(
                    padding: EdgeInsets.zero,
                    isVisible: true,
                    alignment: Alignment.centerRight,
                    iconSize: 14,
                    visualDensity: VisualDensity(
                      horizontal: -4,
                      vertical: -4,
                    ),
                  )
                : const ClearButtonProps(),
          ),
          //##############################################################

          popupProps: PopupPropsMultiSelection.modalBottomSheet(
            itemBuilder: (context, item, isDisabled, isSelected) {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    widget.itemAsString(item),
                    style: AppTextStyles.font15TextW400,
                  ),
                ),
                selected: isSelected,
              );
            },
            textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
            searchDelay: Duration.zero,
            showSearchBox: widget.showSearchBox,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
            ),
            fit: FlexFit.loose,
            title: Container(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 32.w,
                bottom: widget.showSearchBox ? 20.w : 0.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          context.tr(widget.label),
                          style: AppTextStyles.font20TextW700,
                        ),
                      ),
                    ],
                  ),
                  if (!widget.showSearchBox)
                    const Divider(color: Color(0xffD8D7DC)),
                ],
              ),
            ),
            searchFieldProps: TextFieldProps(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: AppColors.textColor.withValues(alpha: .6),
                  ),
                ),
                hintText: context.tr(LocaleKeys.button_search),
                hintStyle: AppTextStyles.font15TextW400OP6,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 12.w,
                ),
              ),
            ),
            modalBottomSheetProps: ModalBottomSheetProps(
              shape: OutlineInputBorder(
                borderSide: const BorderSide(width: 0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.w),
                  topRight: Radius.circular(30.w),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
