import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../bloc/global_reciters_section/global_reciters_section_cubit.dart';
import 'home_connecting_reciters.dart';
import 'home_statistics.dart';

class HomeGlobalRecitersSection extends StatelessWidget {
  const HomeGlobalRecitersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<GlobalRecitersSectionCubit>()..getRecitersGlobalSection(),
      lazy: false,
      child: const Column(
        children: [
          HomeStatistics(),
          HomeConnectingReciters(),
        ],
      ),
    );
  }
}
