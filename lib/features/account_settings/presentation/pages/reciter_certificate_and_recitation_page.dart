import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../core/widgets/app_custom_scroll_view.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../../reciter/registration/presentation/bloc/reciter_submit_job/reciter_submit_job_cubit.dart';
import '../../../shared/presentation/bloc/lookup/lookup_cubit.dart';
import '../widgets/reciter_certificate_and_recitation_widget.dart';

@RoutePage()
class ReciterCertificatesPage extends StatelessWidget {
  const ReciterCertificatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: context.read<LookupCubit>()..getLookUpsData(),
        ),
        BlocProvider(
          create: (context) => getIt<ReciterSubmitJobCubit>(),
        ),
      ],
      child: const AppBlocWrapperScreen(
        child: AppCustomScrollView(
          appPageHeader: AppPageHeader.subtitle,
          title: LocaleKeys
              .reciter_submitJob_certificates_certificatesAndRecitations,
          children: [
            ReciterSubmitJobCertificates(),
          ],
        ),
      ),
    );
  }
}
