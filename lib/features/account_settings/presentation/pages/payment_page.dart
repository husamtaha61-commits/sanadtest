import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../core/widgets/app_custom_scroll_view.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../widgets/paymnet_widget.dart';

@RoutePage()
class PaymentInformationPage extends StatelessWidget {
  const PaymentInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBlocWrapperScreen(
      child: AppCustomScrollView(
        appPageHeader: AppPageHeader.subtitle,
        title: LocaleKeys.reciter_completeProfile_paymentInformation_title,
        children: [
          PaymentInformationWidget(),
        ],
      ),
    );
  }
}
