import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/extenstions/string.dart';
import '../../../../../core/models/base_status.dart';
import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/theme/styles/app_shadows.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/widgets/app_shadow_container.dart';
import '../../../../../core/widgets/pictures/app_circular_avatar_image.dart';
import '../../../../../core/widgets/pictures/app_cirular_nework_image.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../home/presentation/bloc/reciter_student/reciter_student_cubit.dart';
import '../../../../home/presentation/bloc/student_progress/student_progress_cubit.dart';

class ReciterKhitmaProgressStudentsList extends StatefulWidget {
  const ReciterKhitmaProgressStudentsList({super.key});

  @override
  State<ReciterKhitmaProgressStudentsList> createState() => _ReciterKhitmaProgressStudentsListState();
}

class _ReciterKhitmaProgressStudentsListState extends State<ReciterKhitmaProgressStudentsList> {
  @override
  Widget build(BuildContext context) {
    final reciterStudentCubit = context.read<ReciterStudentCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr(LocaleKeys.reciter_khitmaProgress_students),
          style: AppTextStyles.font16TextW600,
        ),
        12.verticalSpace,
        BlocBuilder<ReciterStudentCubit, ReciterStudentState>(
          builder: (context, state) => state.status.maybeWhen(
            failure: (error) => const SizedBox(),
            orElse: () => Skeletonizer(
              enabled: state.status is Loading,
              child: state.students.isEmpty
                  ? Text(
                      context.tr(
                          LocaleKeys.reciter_khitmaProgress_noStudentAvailable),
                      style: AppTextStyles.font12TextW400,
                    )
                  : Container(
                      height: 70.w,
                      constraints: BoxConstraints(minHeight: 70.w),
                      child: ListView.builder(
                        padding: EdgeInsets.only(left: 4.w, right: 4.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.students.length,
                        itemBuilder: (context, index) {
                          final student = state.students[index];
                          return Padding(
                            padding:
                                EdgeInsets.only(right: index == 4 ? 0 : 10.w),
                            child: GestureDetector(
                              onTap: () {
                                reciterStudentCubit.setActiveStudent(student.id);
                                context.read<StudentProgressCubit>().getStudentProgress(student.id);
                              },
                              child: AppShadowContainer(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                decoration: state.activeStudentId == student.id
                                    ? BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.goldenOrange),
                                        boxShadow:
                                            AppShadows.blur12GoldenOrangeOP25,
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      )
                                    : null,
                                infinityWidth: false,
                                child: Row(
                                  children: [
                                    student.profileImageUrl == null
                                        ? const AppCircularAvatarImage(
                                            imageSize: 44)
                                        : AppCirularNeworkImage(
                                            imageSize: 44,
                                            imageId: student.profileImageUrl!,
                                            memCache: 293,
                                          ),
                                    6.horizontalSpace,
                                    Text(
                                        "${student.firstName.toCapitalize()} ${student.lastName.toCapitalize()}",
                                        style: AppTextStyles.font12TextW500),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ),
        )
      ],
    );
  }
}
