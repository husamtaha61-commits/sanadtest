import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/enums/app_enums.dart';
import '../bloc/programs/program_cubit.dart';
import 'our_programs/our_programs_card.dart';

class HomeOurPrograms extends StatelessWidget {
  const HomeOurPrograms({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          BlocBuilder<ProgramCubit, ProgramState>(
            builder: (context, state) {
              return state.status.maybeWhen(
                  success: () {
                    return Column(
                      children: state.programs
                          .where(
                            (program) =>
                                program.id != Programs.sanadMinhaj.intValue,
                          )
                          .map((program) => Padding(
                                padding: EdgeInsets.only(bottom: 20.w),
                                child: OurProgramsCard(
                                  program: program,
                                ),
                              ))
                          .toList(),
                    );
                  },
                  orElse: () => const SizedBox());
            },
          )
        ],
      ),
    );
  }
}
