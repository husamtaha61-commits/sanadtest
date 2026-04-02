import 'package:flutter/material.dart';
import '../entities/request_status.dart';
import '../theme/styles/app_colors.dart';

class RequestStatusManager {
  static const requestStatues = [
    RequestStatus(
      id: 1,
      name: 'Pending',
      textColor: AppColors.goldenOrange,
      bgColor: Color.fromRGBO(255, 185, 7, 0.1),
    ),
    RequestStatus(
      id: 2,
      name: 'Approved',
      textColor: Color(0xff319F43),
      bgColor: Color.fromRGBO(49, 159, 67, 0.1),
    ),
    RequestStatus(
      id: 3,
      name: 'Rejected',
      textColor: Color(0xffF22D2D),
      bgColor: Color.fromRGBO(242, 45, 45, 0.1),
    ),
    RequestStatus(
      id: 4,
      name: 'Expired',
      textColor: Color(0xff494949),
      bgColor: Color.fromRGBO(73, 73, 73, 0.1),
    ),
    RequestStatus(
      id: 5,
      name: 'Canceled',
      textColor: Color(0xffA8CDDA),
      bgColor: Color.fromRGBO(168, 205, 218, 0.1),
    ),
    RequestStatus(
      id: 6,
      name: 'Cancelled',
      textColor: Colors.grey,
      bgColor: Color.fromRGBO(200, 200, 200, 0.2),
    ),
    RequestStatus(
      id: 7,
      name: 'Suspended',
      textColor: Colors.deepOrange,
      bgColor: Color.fromRGBO(255, 140, 0, 0.1),
    ),
  ];

  static Color getRequestTextColor(int id) => requestStatues
      .firstWhere(
        (element) => element.id == id,
        orElse: () => const RequestStatus(
          id: 0,
          name: 'Unknown',
          textColor: Colors.red,
          bgColor: Color.fromRGBO(255, 0, 0, 0.1),
        ),
      )
      .textColor;

  static Color getRequestBgColor(int id) => requestStatues
      .firstWhere(
        (element) => element.id == id,
        orElse: () => const RequestStatus(
          id: 0,
          name: 'Unknown',
          textColor: Colors.red,
          bgColor: Color.fromRGBO(255, 0, 0, 0.1),
        ),
      )
      .bgColor;
}
