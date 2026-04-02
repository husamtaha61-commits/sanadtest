import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/enums/app_enums.dart';
import '../../../../../../core/widgets/drawer/app_filter_drawer_body.dart';
import '../../../../../../core/widgets/drawer/app_filter_drawer_expansion_tile.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../../../../shared/presentation/bloc/lookup/lookup_cubit.dart';
import '../../../../../shared/presentation/bloc/user/user_cubit.dart';
import '../../bloc/reciter_listing/reciter_listing_cubit.dart';

class ReciterFilterDrawerCategories extends StatelessWidget {
  const ReciterFilterDrawerCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final lookUpState = context.read<LookupCubit>().state;
    final reciterListingCubit = context.read<ReciterListingCubit>();
    final isSubscribed = context.read<UserCubit>().state.subscriptionStatus == SubscriptionStatus.approved;

    return BlocBuilder<ReciterListingCubit, ReciterListingState>(
      builder: (context, state) {
        return AppFilterDrawerBody(
          children: [
            AppFilterDrawerExpansionTile(
              categoryTitle: LocaleKeys.form_field_age,
              categoryList: lookUpState.ageRanges,
              selectedCategoryList: reciterListingCubit.ages,
              onTap: reciterListingCubit.addAge,
              isCheckBox: true,
            ),
            if (!isSubscribed) ...[
              AppFilterDrawerExpansionTile(
                categoryTitle: LocaleKeys.form_field_gender,
                categoryList: lookUpState.genders,
                selectedCategoryList: reciterListingCubit.genders,
                onTap: reciterListingCubit.addGender,
              ),
              AppFilterDrawerExpansionTile(
                categoryTitle: LocaleKeys.form_field_recitation,
                categoryList: lookUpState.recitations,
                selectedCategoryList: reciterListingCubit.recitations,
                onTap: reciterListingCubit.addRecitation,
              ),
              AppFilterDrawerExpansionTile(
                categoryTitle: LocaleKeys.form_field_teachingLanguages,
                categoryList: lookUpState.languages,
                selectedCategoryList: reciterListingCubit.teachingLanguages,
                onTap: reciterListingCubit.addTeachingLanguage,
                isCheckBox: true,
              ),
            ],
            AppFilterDrawerExpansionTile(
              categoryTitle: LocaleKeys.form_field_reciterLanguage,
              categoryList: lookUpState.languages
                  .where(
                    (element) => element.name.toLowerCase().startsWith(
                          reciterListingCubit.searchReciterLanguage.text
                              .toLowerCase(),
                        ),
                  )
                  .toList(),
              selectedCategoryList: reciterListingCubit.reciterLanguages,
              onTap: reciterListingCubit.addReciterLanguage,
              onSearch: () => reciterListingCubit.withStateEmission(() {}),
              searchTextEditingController:
                  reciterListingCubit.searchReciterLanguage,
            ),
            AppFilterDrawerExpansionTile(
              categoryTitle: LocaleKeys.form_field_nationality,
              categoryList: lookUpState.nationalities
                  .where(
                    (element) => element.name.toLowerCase().startsWith(
                          reciterListingCubit.searchNationality.text
                              .toLowerCase(),
                        ),
                  )
                  .toList(),
              selectedCategoryList: reciterListingCubit.nationalities,
              onTap: reciterListingCubit.addNationality,
              onSearch: () {
                reciterListingCubit.withStateEmission(() {});
              },
              searchTextEditingController:
                  reciterListingCubit.searchNationality,
            ),
          ],
        );
      },
    );
  }
}
