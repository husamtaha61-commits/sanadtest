import 'dart:async';

import 'package:flutter/cupertino.dart';

mixin AfterFirstLayoutMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          afterFirstLayout(context);
        }
    );
  }

  FutureOr<void> afterFirstLayout(BuildContext context);
}