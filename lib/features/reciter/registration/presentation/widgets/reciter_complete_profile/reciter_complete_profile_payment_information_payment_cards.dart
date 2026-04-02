import 'package:flutter/material.dart';

class ReciterCompleteProfilePaymentInformationPaymentCards
    extends StatelessWidget {
  final List<Widget> children;

  const ReciterCompleteProfilePaymentInformationPaymentCards(
      {super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}
