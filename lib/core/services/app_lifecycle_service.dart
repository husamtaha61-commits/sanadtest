import 'package:flutter/widgets.dart';

class AppLifecycleService with WidgetsBindingObserver {
  AppLifecycleState _state = AppLifecycleState.resumed;

  AppLifecycleService._privateConstructor() {
    WidgetsBinding.instance.addObserver(this);
  }

  static final AppLifecycleService instance =
      AppLifecycleService._privateConstructor();

  bool get isAppActive => _state == AppLifecycleState.resumed;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _state = state;
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }
}
