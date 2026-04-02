import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extenstions/string.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/services/analytics_service.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../core/widgets/app_page_action_subtitle.dart';
import '../../../../core/widgets/app_sliver_sized_box.dart';
import '../../../../core/widgets/pictures/app_circular_avatar_image.dart';
import '../../../../core/widgets/pictures/app_cirular_nework_image.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../bloc/messaging/messaging_cubit.dart';
import '../bloc/messaging_contact/messaging_contact_cubit.dart';

@RoutePage()
class MessagingContactsPage extends StatelessWidget {
  const MessagingContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBlocWrapperScreen(
      child: _MessagingContactsContent(),
    );
  }
}

class _MessagingContactsContent extends StatelessWidget {
  const _MessagingContactsContent();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: AppPageActionSubtitle(
              subTitle: LocaleKeys.messingCenter_selectAContact,
              withPadding: true),
        ),
        SliverPadding(
          padding: AppPadding.customScrollView,
          sliver: SliverMainAxisGroup(
            slivers: [
              const AppSliverSizedBox(height: 10),
              BlocBuilder<MessagingContactCubit, MessagingContactState>(
                builder: (context, state) => state.status.maybeWhen(
                  orElse: () => const SliverToBoxAdapter(child: SizedBox()),
                  success: () {
                    final existingMembersIds =
                        context.read<MessagingCubit>().memebersIds;
                    final filteredContacts = state.contacts
                        .where((contact) =>
                            !existingMembersIds.contains(contact.id))
                        .toList();
                    return SliverList.builder(
                      itemCount: filteredContacts.length,
                      itemBuilder: (context, index) {
                        final contact = filteredContacts[index];

                        return GestureDetector(
                          onTap: () {
                            AnalyticsService.instance
                                .logInAppMessageClicked(contact.id.toString());
                            context.router.popForced();
                            context.router.push(
                              MessageRoute(
                                otherParticipantInfo: contact,
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 8.w, bottom: 5.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                  bottom: BorderSide(
                                      color: AppColors.dividerGrey
                                          .withAlpha(102))),
                            ),
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                contact.profileImageUrl == null
                                    ? const AppCircularAvatarImage(
                                        imageSize: 40)
                                    : AppCirularNeworkImage(
                                        imageId: contact.profileImageUrl!,
                                        imageSize: 40,
                                        memCache: 293,
                                      ),
                                10.horizontalSpace,
                                Text(
                                  "${contact.firstName.toCapitalize()} ${contact.lastName.toCapitalize()}",
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
