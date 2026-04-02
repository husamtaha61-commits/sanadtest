import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/constants/request_status_manager.dart';
import '../../../../core/enums/app_enums.dart';
import '../../../../core/extenstions/date_time.dart';
import '../../../../core/extenstions/string.dart';
import '../../../../core/responses/base_field_response.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_shadows.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/utils/app_date.dart';
import '../../../../core/utils/app_form_validator.dart';
import '../../../../core/widgets/form_fields/date_text_field.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../../shared/presentation/bloc/user/user_cubit.dart';
import '../../data/models/requests/approve_request_request.dart';
import '../../domain/entities/my_request.dart';
import '../bloc/my_requests_actions/my_requests_actions_cubit.dart';

class MyRequestsRequestsListItem extends StatelessWidget {
  final MyRequest myRequest;
  const MyRequestsRequestsListItem({super.key, required this.myRequest});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showMyRequestSheetActions(context, myRequest),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          boxShadow: AppShadows.blur4BlackOP25,
          color: Colors.white,
        ),
        width: double.infinity,
        child: _CardContent(
          myRequest: myRequest,
        ),
      ),
    );
  }
}

void showMyRequestSheetActions(BuildContext context, MyRequest myRequest) {
  showModalBottomSheet(
    isScrollControlled: true,
    useSafeArea: true,
    context: context,
    builder: (ctx) {
      context.read<MyRequestsActionsCubit>().chooseSelectedSession(null);
      return BlocProvider.value(
        value: context.read<MyRequestsActionsCubit>(),
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.w),
            child: _CardContent(
              myRequest: myRequest,
              isBottomSheet: true,
            ),
          ),
        ),
      );
    },
  );
}

class _CardContent extends StatelessWidget {
  final bool? isBottomSheet;
  final MyRequest myRequest;

  const _CardContent({
    required this.myRequest,
    this.isBottomSheet = false,
  });

  @override
  Widget build(BuildContext context) {
    final userState = context.read<UserCubit>().state;
    final isPending = myRequest.status.id == 1;
    final isRequester = myRequest.sender.id == userState.id;
    final isReciter = userState.role?.comparisonName == UserRoles.Reciter.name;
    final studentRescheduleSessionsCubit =
        context.read<MyRequestsActionsCubit>();
    final previousTimesAvailable = myRequest.previousScheduleTimes.isNotEmpty &&
        SessionTypes.fromId(myRequest.type.id) == SessionTypes.reschedule;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CardContentHeader(
          myRequest: myRequest,
          isBottomSheet: isBottomSheet!,
        ),
        25.verticalSpace,
        Text(
          '${context.tr(LocaleKeys.myRequests_filters_requestId)} - ${myRequest.requestId}',
          style: AppTextStyles.font14TextW300OP6,
        ),
        8.verticalSpace,
        Text(
          isRequester
              ? '${myRequest.reciever.firstName.toCapitalize()} ${isReciter ? myRequest.reciever.lastName.toCapitalize() : myRequest.reciever.middleName?.toCapitalize()}'
              : '${myRequest.sender.firstName.toCapitalize()} ${isReciter ? myRequest.sender.lastName.toCapitalize() : myRequest.sender.middleName?.toCapitalize()}',
          style: myRequest.status.name == "Pending"
              ? AppTextStyles.font24NavyBlueW600
              : AppTextStyles.font24NavyBlueW600P5,
        ),
        12.verticalSpace,
        Row(
          children: [
            Text(
              myRequest.creationDate.toStr(AppDate.MMMMddyyyy, localized: true),
              style: myRequest.status.name == "Pending"
                  ? AppTextStyles.font12TextW300
                  : AppTextStyles.font12TextW300P5,
            ),
            24.horizontalSpace,
            Text(
              myRequest.creationDate.toStr(AppDate.hhmma, localized: true),
              style: myRequest.status.name == "Pending"
                  ? AppTextStyles.font12TextW300
                  : AppTextStyles.font12TextW300P5,
            )
          ],
        ),
        if (isBottomSheet!) ...[
          30.verticalSpace,
          Text(
            context.tr(LocaleKeys.myRequests_filters_note),
            style: AppTextStyles.font15TextW500,
          ),
          6.verticalSpace,
          Text(
            myRequest.note ?? '',
            style: AppTextStyles.font14TextW400OP8,
          ),
        ],
        25.verticalSpace,
        if (previousTimesAvailable) ...[
          Text(LocaleKeys.myRequests_previousTime.tr(),
              style: myRequest.status.name == "Pending"
                  ? AppTextStyles.font15TextW500
                  : AppTextStyles.font15TextW500P5),
          ...getPreviousTimes(previousTimesAvailable),
        ],
        Text(LocaleKeys.myRequests_newTime.tr(),
            style: myRequest.status.name == "Pending"
                ? AppTextStyles.font15TextW500
                : AppTextStyles.font15TextW500P5),
        10.verticalSpace,
        BlocBuilder<MyRequestsActionsCubit, MyRequestsActionsState>(
          builder: (context, state) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: myRequest.scheduleTimes.length,
              itemBuilder: (context, index) {
                final DateTime sessionTime;
                final String sessionDay;
                if ([SessionTypes.reschedule.id, SessionTypes.schedule.id]
                    .contains(myRequest.type.id)) {
                  final sessionTimeString =
                      myRequest.scheduleTimes[index].userTimeValue;
                  sessionTime = sessionTimeString.toDate(AppDate.HHmm)!;
                  sessionDay = myRequest.scheduleTimes[index].userDayName;
                } else {
                  sessionTime =
                      myRequest.timeSuggestions![index].suggestionDateTime!;
                  sessionDay = sessionTime.toStr('EEEE', localized: true);
                }
                final sessionTimeFormatted =
                    sessionTime.toStr(AppDate.hhmma, localized: true);

                final suggestionId =
                    myRequest.timeSuggestions?[index].suggestionId;

                if (isPending &&
                    isBottomSheet! &&
                    !isRequester &&
                    ![SessionTypes.schedule.id, SessionTypes.reschedule.id]
                        .contains(myRequest.type.id)) {
                  return RadioListTile(
                    dense: true,
                    visualDensity: const VisualDensity(horizontal: -4.0),
                    contentPadding: EdgeInsets.zero,
                    value: suggestionId!,
                    groupValue: state.approvedSuggestionId,
                    title: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints(minWidth: 70.w),
                          child: Text(
                            sessionDay,
                            style: myRequest.status.name == "Pending"
                                ? AppTextStyles.font14TextW600OP6
                                : AppTextStyles.font14TextW600OP6.copyWith(
                                    color: AppColors.textColor
                                        .withValues(alpha: 0.5)),
                          ),
                        ),
                        2.horizontalSpace,
                        Container(
                          constraints: BoxConstraints(minWidth: 120.w),
                          child: Text(
                            "$sessionTimeFormatted - ${AppDate.getSessionEndTime(sessionTime)}",
                            style: AppTextStyles.font14TextW300,
                          ),
                        ),
                      ],
                    ),
                    onChanged: (val) {
                      studentRescheduleSessionsCubit
                          .chooseSelectedSession(suggestionId);
                    },
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 8.w),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints(minWidth: 70.w),
                          child: Text(
                            sessionDay,
                            style: myRequest.status.name == "Pending"
                                ? AppTextStyles.font14TextW600OP6
                                : AppTextStyles.font14TextW600OP6.copyWith(
                                    color: AppColors.textColor
                                        .withValues(alpha: 0.5)),
                          ),
                        ),
                        8.horizontalSpace,
                        Container(
                          constraints: BoxConstraints(minWidth: 120.w),
                          child: Text(
                            "$sessionTimeFormatted - ${AppDate.getSessionEndTime(sessionTime)}",
                            style: AppTextStyles.font14TextW300OP6,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            );
          },
        ),
        if (!isRequester &&
            (!isBottomSheet! || isBottomSheet! && !isPending)) ...[
          28.verticalSpace,
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: context.tr(
                        LocaleKeys.myRequests_filters_receivedBy,
                      ),
                      style: myRequest.status.name == "Pending"
                          ? AppTextStyles.font16NavyBlueW500
                          : AppTextStyles.font16NavyBlueW500P5),
                  TextSpan(
                    text: ' ${myRequest.sender.roles[0].name}',
                    style: AppTextStyles.font14TextW300.copyWith(
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
        if (isBottomSheet! && isPending) ...[
          24.verticalSpace,
          BottomSheetActions(
            isRequester: isRequester,
            requestId: myRequest.requestId,
            requestType: myRequest.type,
          ),
          12.verticalSpace,
        ],
      ],
    );
  }

  List<Widget> getPreviousTimes(bool previousTimesAvailable) {
    if (previousTimesAvailable) {
      return myRequest.previousScheduleTimes.map<Widget>((e) {
            final sessionTimeString = e.userTimeValue;
            final sessionTime = sessionTimeString.toDate(AppDate.HHmm)!;
            final sessionDay = e.userDayName;
            final sessionTimeFormatted =
                sessionTime.toStr(AppDate.hhmma, localized: true);

            return Padding(
              padding: EdgeInsets.only(top: 8.w),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Container(
                    constraints: BoxConstraints(minWidth: 70.w),
                    child: Text(
                      sessionDay,
                      style: AppTextStyles.font14TextW600OP6,
                    ),
                  ),
                  8.horizontalSpace,
                  Container(
                    constraints: BoxConstraints(minWidth: 120.w),
                    child: Text(
                      "$sessionTimeFormatted - ${AppDate.getSessionEndTime(sessionTime)}",
                      style: AppTextStyles.font14TextW300OP6,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          }).toList() +
          [30.verticalSpace];
    }

    final sessionTime =
        myRequest.oldSessionTime.toStr(AppDate.hhmma, localized: true);
    final sessionDay = myRequest.oldSessionTime.toStr("EEEE", localized: true);

    return [
      Text(LocaleKeys.myRequests_previousTime.tr(),
          style: myRequest.status.name == "Pending"
              ? AppTextStyles.font15TextW500
              : AppTextStyles.font15TextW500P5),
      Padding(
        padding: EdgeInsets.only(top: 8.w),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(minWidth: 70.w),
              child: Text(
                sessionDay,
                style: myRequest.status.name == "Pending"
                    ? AppTextStyles.font14TextW600OP6
                    : AppTextStyles.font14TextW600OP6.copyWith(
                        color: AppColors.textColor.withValues(alpha: 0.5)),
              ),
            ),
            8.horizontalSpace,
            Container(
              constraints: BoxConstraints(minWidth: 120.w),
              child: Text(
                "$sessionTime - ${AppDate.getSessionEndTime(myRequest.oldSessionTime)}",
                style: AppTextStyles.font14TextW300OP6,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      30.verticalSpace
    ];
  }
}

class _CardContentHeader extends StatelessWidget {
  final MyRequest myRequest;
  final bool isBottomSheet;

  const _CardContentHeader({
    required this.myRequest,
    required this.isBottomSheet,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Skeleton.replace(
              replacement: Bone.circle(
                size: 24.w,
              ),
              child: Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.w),
                  color: myRequest.status.name == "Pending"
                      ? SessionTypes.fromId(myRequest.type.id)?.color ??
                          SessionTypes.schedule.color
                      : SessionTypes.fromId(myRequest.type.id)
                              ?.color
                              .withValues(alpha: 0.5) ??
                          SessionTypes.schedule.color.withValues(alpha: 0.5),
                ),
              ),
            ),
            8.horizontalSpace,
            Text(
              myRequest.type.name!,
              style: myRequest.status.name == "Pending"
                  ? AppTextStyles.font14TextW400OP8
                  : AppTextStyles.font14TextW400OP8.copyWith(
                      color: AppColors.textColor.withValues(alpha: 0.5)),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 8.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                color: myRequest.status.name == "Pending"
                    ? RequestStatusManager.getRequestBgColor(
                        myRequest.status.id,
                      )
                    : RequestStatusManager.getRequestBgColor(
                        myRequest.status.id,
                      ).withValues(alpha: 0.2),
              ),
              child: Text(
                myRequest.status.name,
                style: AppTextStyles.font14TextW500.copyWith(
                  color: myRequest.status.name == "Pending"
                      ? RequestStatusManager.getRequestTextColor(
                          myRequest.status.id,
                        )
                      : RequestStatusManager.getRequestTextColor(
                          myRequest.status.id,
                        ).withValues(alpha: 0.5),
                ),
              ),
            ),
            if (isBottomSheet) ...[
              8.horizontalSpace,
              InkWell(
                onTap: context.router.popForced,
                child: SvgPicture.asset(
                  Assets.icons.cancel.path,
                  colorFilter: const ColorFilter.mode(
                    AppColors.azureBlue,
                    BlendMode.srcIn,
                  ),
                ),
              )
            ]
          ],
        )
      ],
    );
  }
}

class BottomSheetActions extends StatelessWidget {
  final int requestId;
  final bool isRequester;
  final BaseFieldResponse requestType;
  const BottomSheetActions(
      {super.key,
      required this.requestId,
      required this.isRequester,
      required this.requestType});

  @override
  Widget build(BuildContext context) {
    final dateController = TextEditingController();
    final myRequestsActionsCubit = context.read<MyRequestsActionsCubit>();
    final formKey = GlobalKey<FormState>();

    void approveSchedule() {
      if (formKey.currentState!.validate()) {
        context.router.maybePop();
        myRequestsActionsCubit.approveRequest(
          ApproveRequestRequest(
              scheduleRequestId: requestId,
              startDate: AppDate.appToBEDate(dateController.text)),
        );
      }
    }

    bool canApproveRequest(int requestId, int? approvedSuggestionId) {
      final scheduleAndRescheduleIds = [
        SessionTypes.schedule.id,
        SessionTypes.reschedule.id,
      ];

      return scheduleAndRescheduleIds.contains(requestId) ||
          (!scheduleAndRescheduleIds.contains(requestId) &&
              approvedSuggestionId != null);
    }

    return BlocBuilder<MyRequestsActionsCubit, MyRequestsActionsState>(
      builder: (context, state) {
        return Column(
          children: [
            if (!isRequester) ...[
              if (requestType.id == 1) ...[
                Text(
                  context.tr(LocaleKeys.myRequests_scheduleNote),
                  style: AppTextStyles.font15TextW500,
                ),
                32.verticalSpace,
                Form(
                  key: formKey,
                  child: DateTextField(
                    textEditingController: dateController,
                    hintText: LocaleKeys.form_field_startDate,
                    initialDate: DateTime.now().add(const Duration(days: 1)),
                    firstDate: DateTime.now().add(const Duration(days: 1)),
                    lastDate: DateTime.now().add(const Duration(days: 730)),
                    customValidator: (value) => AppFormValidator.validateField(
                        AppFormFields.startDate, value),
                  ),
                ),
                44.verticalSpace,
                ElevatedButton(
                  onPressed: approveSchedule,
                  child: Text(
                    context.tr(LocaleKeys.button_approveSchedule),
                  ),
                ),
              ] else ...[
                ElevatedButton(
                  onPressed: canApproveRequest(requestType.id!,
                          myRequestsActionsCubit.state.approvedSuggestionId)
                      ? () {
                          context.router.maybePop();
                          myRequestsActionsCubit.approveRequest(
                            ApproveRequestRequest(
                              scheduleRequestId: requestId,
                              approvedSuggestionId: state.approvedSuggestionId,
                            ),
                          );
                        }
                      : null,
                  child: Text(
                    context.tr(LocaleKeys.button_approveRequest),
                  ),
                ),
              ],
            ],
            if (requestType.id != 1)
              Center(
                child: InkWell(
                  onTap: () {
                    context.router.maybePop();
                    isRequester
                        ? myRequestsActionsCubit.cancelRequest(requestId)
                        : myRequestsActionsCubit.rejectRequest(requestId);
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 6.w, horizontal: 10.w),
                    child: Text(
                      context.tr(isRequester
                          ? LocaleKeys.button_cancelRequest
                          : LocaleKeys.button_rejectRequest),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.font14TextW500.copyWith(
                        color: const Color(
                          0xFFF22D2D,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
