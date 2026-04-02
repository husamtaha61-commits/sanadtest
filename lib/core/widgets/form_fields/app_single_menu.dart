import 'dart:async';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/translations/locale_keys.g.dart';
import '../../di/injection.dart';
import '../../services/app_preferences.dart';
import '../../theme/styles/app_colors.dart';
import '../../theme/styles/app_text_style.dart';
import '../../utils/app_form_validator.dart';

class AppSingleMenu<T> extends StatelessWidget {
  final FutureOr<List<T>> items;
  final String Function(T) itemAsString;
  final String selectedItemName;
  final String fieldName;
  final String? label;
  final bool showClearIcon;
  final bool showSearchBox;
  final T? selectedItem;
  final ValueChanged<T?> onItemSelected;
  final String? Function(T?)? customValidator;
  final GlobalKey<DropdownSearchState<T>>? customKey;
  final bool enabled;
  final Widget Function(BuildContext, T?)? dropdownBuilder;

  const AppSingleMenu({
    super.key,
    required this.items,
    required this.itemAsString,
    required this.fieldName,
    this.label,
    required this.selectedItem,
    required this.onItemSelected,
    this.customKey,
    this.customValidator,
    this.showClearIcon = false,
    this.showSearchBox = false,
    this.enabled = true,
    required this.selectedItemName,
    this.dropdownBuilder
  });

  @override
  Widget build(BuildContext context) {
    final isAr = getIt<AppPreferences>().isAr;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(context.tr(label!), style: AppTextStyles.font15TextW400OP8),
        3.verticalSpace,
        DropdownSearch<T>(
          enabled: enabled,
          onBeforePopupOpening: (selectedItem) async {
            FocusManager.instance.primaryFocus?.unfocus();
            return true;
          },
          compareFn: (p0, p1) => p0 == p1,
          selectedItem: selectedItem,
          dropdownBuilder: dropdownBuilder,
          key: customKey,
          validator: customValidator ??
              (value) {
                if (value == null) {
                  return AppFormValidator.validateRequiredField(selectedItemName, fieldName);
                }
                return null;
              },
          onChanged: (value) {
            onItemSelected(value);
          },
          items: (f, cs) => items,
          itemAsString: itemAsString,
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
            clearButtonProps: showClearIcon
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
                    itemAsString(item),
                    style: AppTextStyles.font15TextW400,
                  ),
                ),
                selected: isSelected,
              );
            },
            textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
            searchDelay: Duration.zero,
            showSearchBox: showSearchBox,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.7,
            ),
            fit: showSearchBox ? FlexFit.tight : FlexFit.loose,
            title: Container(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 32.w,
                bottom: showSearchBox ? 20.w : 0.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (label != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            context.tr(label!),
                            style: AppTextStyles.font20TextW700,
                          ),
                        ),
                      ],
                    ),
                  if (!showSearchBox) const Divider(color: Color(0xffD8D7DC)),
                ],
              ),
            ),
            searchFieldProps: TextFieldProps(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: AppColors.textColor.withValues(alpha: 0.6),
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
