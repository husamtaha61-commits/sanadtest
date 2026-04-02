import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/enums/app_enums.dart';
import '../../../../core/models/base_status.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/services/app_preferences.dart';
import '../../../../core/skeletons/fake_data/note_fake_data.dart';
import '../../../../core/skeletons/fake_data/session_details_fake_data.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/app_expansion_tile.dart';
import '../../../../core/widgets/app_page_subtitle.dart';
import '../../../../core/widgets/app_page_action_title.dart';
import '../../../../core/widgets/app_sliver_sized_box.dart';
import '../../../../core/widgets/app_web_view.dart';
import '../../../../core/widgets/hint_overlay.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../../home/presentation/bloc/student_progress/student_progress_cubit.dart';
import '../../../shared/presentation/bloc/user/user_cubit.dart';
import '../../../skills_notes/presentation/widgets/notes_list_item.dart';
import '../../../skills_notes/presentation/widgets/notes_title.dart';
import '../../../student/rescheduling/domain/entites/session.dart';
import '../../domain/entites/note.dart';
import '../bloc/session_confirmation/session_confirmation_cubit.dart';
import '../bloc/session_details/session_details_cubit.dart';
import '../widgets/session_details_bloc_wrapper.dart';
import '../widgets/session_details_reciter_confirmation/session_details_reciter_confirmation_step_1.dart';
import '../widgets/session_details_reciter_confirmation/session_details_reciter_confirmation_step_2.dart';
import '../widgets/session_details_status.dart';
import '../widgets/session_details_user_info.dart';

@RoutePage()
class SessionDetailsPage extends StatelessWidget {
  final String sessionId;
  final List<Session>? sessions;
  final int? firstSessionIndex;
  const SessionDetailsPage(
      {super.key,
      required this.sessionId,
      this.sessions,
      this.firstSessionIndex});

  Widget content(String sessionId) {
    return SessionDetailsBlocWrapper(
      sessionId: sessionId,
      child: BlocBuilder<SessionDetailsCubit, SessionDetailsState>(
        builder: (context, state) {
          final isLoading = state.status is Loading;
          final isSuccess = state.status is Success;
          if (isLoading || isSuccess) {
            if (isSuccess) {
              context.read<SessionConfirmationCubit>().initPages(
                    state.sessionDetails!.startPage,
                    state.sessionDetails!.endPage,
                  );
            }
            return CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(
                  child: AppPageActionTitle(
                    title: LocaleKeys.sessionDetails_title,
                    withPadding: true,
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  sliver: SliverMainAxisGroup(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            if (!isStudentRole(context)) ...[
                              42.verticalSpace,
                              BlocBuilder<SessionConfirmationCubit,
                                  SessionConfirmationState>(
                                builder: (context, sessionConfirmationState) =>
                                    (isSuccess &&
                                            state.sessionDetails!.status.id ==
                                                SessionStatus
                                                    .pendingCompletion.intValue)
                                        ? sessionConfirmationState.activeStep ==
                                                1
                                            ? SessionDetailsReciterConfirmationStep1(
                                                sessionId: sessionId,
                                              )
                                            : SessionDetailsReciterConfirmationStep2(
                                                sessionId: sessionId)
                                        : const SizedBox(),
                              ),
                            ],
                            42.verticalSpace,
                            Skeletonizer(
                              enabled: isLoading,
                              child: SessionDetailsUserInfo(
                                userInfo: isLoading
                                    ? reciterInfoFakeData
                                    : isStudentRole(context)
                                        ? state.sessionDetails!.reciterInfo
                                        : state.sessionDetails!.studentInfo,
                              ),
                            ),
                            20.verticalSpace,
                            Skeletonizer(
                              enabled: isLoading,
                              child: SessionDetailsStatus(
                                sessionDetails: isLoading
                                    ? sessionDetailsFakeData
                                    : state.sessionDetails!,
                              ),
                            ),
                            44.verticalSpace,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: _SessionRecord(
                    recordUrl: state.sessionDetails?.recordUrl ?? "",
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(
                    left: 25.w,
                    right: 25.w,
                    bottom: 20.w,
                    top: 5.w,
                  ),
                  sliver: SliverMainAxisGroup(slivers: [
                    Skeletonizer.sliver(
                      enabled: isLoading,
                      child: _NotesList(
                        notes: isLoading ? [noteFakeData] : state.otherNotes,
                        isAuthoredByMe: false,
                      ),
                    ),
                    const AppSliverSizedBox(height: 32),
                    Skeletonizer.sliver(
                      enabled: isLoading,
                      child: _NotesList(
                        notes: isLoading ? [noteFakeData] : state.myNotes,
                        isAuthoredByMe: true,
                      ),
                    ),
                    const AppSliverSizedBox(height: 28),
                    if (getIt<AppPreferences>()
                            .getUserCachedResponse()
                            .programId ==
                        2)
                      SliverToBoxAdapter(
                        child: Center(
                          child: AppElevatedButton(
                            fixedSize: const Size.fromWidth(double.infinity),
                            onPressed: () async => context.pushRoute(
                                SkillsNotesRoute(
                                    sessionId: sessionId,
                                    studentId: isStudentRole(context)
                                        ? context.read<UserCubit>().state.id
                                        : context
                                                    .read<
                                                        StudentProgressCubit>()
                                                    .state
                                                    .studentId >
                                                0
                                            ? context
                                                .read<StudentProgressCubit>()
                                                .state
                                                .studentId
                                            : (await context
                                                        .read<
                                                            SessionDetailsCubit>()
                                                        .getSessionDetails(
                                                            sessionId))
                                                    ?.studentInfo
                                                    .id ??
                                                -1)),
                            child: const Text(
                              LocaleKeys.button_goToSkillsAndNotes,
                            ).tr(),
                          ),
                        ),
                      )
                  ]),
                )
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (sessions != null && firstSessionIndex != null) {
      if (!HintType.swipeLeftRight.isShown) {
        Future.delayed(const Duration(seconds: 1)).then((_) {
          context.router.push(HintOverlayRoute(type: HintType.swipeLeftRight));
        });
      }
      return PageView.builder(
        controller: PageController(initialPage: firstSessionIndex!),
        itemCount: sessions!.length,
        itemBuilder: (BuildContext context, int index) =>
            content(sessions![index].sessionId),
      );
    }
    return content(sessionId);
  }
}

class _NotesList extends StatelessWidget {
  final List<Note> notes;
  final bool isAuthoredByMe;
  const _NotesList({
    required this.notes,
    required this.isAuthoredByMe,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AppExpansionTile(
        initiallyExpanded: true,
        title: NotesTitle(isAuthoredByMe: isAuthoredByMe),
        children: [
          notes.isNotEmpty
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: notes.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(bottom: 10.w),
                    child: NotesListItem(
                      note: notes[index],
                    ),
                  ),
                )
              : Text(
                  context.tr(LocaleKeys.notes_noNotesFound),
                  style: AppTextStyles.font14darkNavyBlueW400,
                ),
        ],
      ),
    );
  }
}

class _SessionRecord extends StatelessWidget {
  final String recordUrl;
  const _SessionRecord({required this.recordUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 25.w),
      decoration: const BoxDecoration(
        color: Color(0xffF8F9FA),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppPageSubtitle(
            title: LocaleKeys.sessionDetails_sessionRecord,
          ),
          12.verticalSpace,
          if (recordUrl == "Processing")
            Text(
              LocaleKeys.sessionDetails_sessionVideoProcessing,
              style: AppTextStyles.font14darkNavyBlueW400,
            ).tr(),
          if (recordUrl.isNotEmpty && recordUrl != "Processing")
            GestureDetector(
              onTap: () => context.router.push(FullRoute(url: recordUrl)),
              child: Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.white,
                ),
                width: 330.w,
                height: 165.w,
                child: AbsorbPointer(
                  absorbing: true,
                  child: AppWebView(url: recordUrl),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
