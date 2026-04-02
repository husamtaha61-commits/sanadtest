import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_announcements.dart';
import 'home_reciter/home_reciter_dashboard.dart';
import 'home_slider.dart';
import 'week_sessions.dart';

class HomeReciter extends StatelessWidget {
  const HomeReciter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeSlider(),
        55.verticalSpace,
        const HomeReciterDashboard(),
        80.verticalSpace,
        Container(
          color: const Color(0xFFF8F9FA),
          child: const WeekSessions(),
        ),
        const HomeAnnouncements(),
        20.verticalSpace,
      ],
    );
  }
}
