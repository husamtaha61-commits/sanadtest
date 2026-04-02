import 'package:flutter/material.dart';

enum DeviceCategory { phone, tablet, web }

class DeviceManager {
  static const double webBreakPoint = 875;
  static const double tabletBreakPoint = 600;

  static DeviceCategory getDeviceCategory(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.shortestSide;

    if (deviceWidth >= webBreakPoint) {
      return DeviceCategory.web;
    } else if (deviceWidth >= tabletBreakPoint) {
      return DeviceCategory.tablet;
    } else {
      return DeviceCategory.phone;
    }
  }

  static bool isTablet(BuildContext context) {
    return getDeviceCategory(context) == DeviceCategory.tablet;
  }

  static bool isPhone(BuildContext context) {
    return getDeviceCategory(context) == DeviceCategory.phone;
  }

  static bool isWeb(BuildContext context) {
    return getDeviceCategory(context) == DeviceCategory.web;
  }

  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }
}
