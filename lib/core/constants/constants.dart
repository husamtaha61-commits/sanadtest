import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_form_field/phone_form_field.dart';
export 'time_periods_values.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

abstract class AppRegex {
  static final name = RegExp(
    r"^[a-zA-ZÀ-ÖØ-öø-ÿ\u0600-\u06FF'’.-]+(?: [a-zA-ZÀ-ÖØ-öø-ÿ\u0600-\u06FF'’.-]+)*$",
  );

  static final password = RegExp(
      r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\W)(?!.* ).{8,}$'); // (at least [8 chrs, 1 uppercase, 1 lowercase, 1 number, 1 special chr])
  static final email = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');
}

abstract class AppFormFields {
  static const firstName = 'firstName';
  static const middleName = 'middleName';
  static const lastName = 'lastName';
  static const dateOfBirth = 'dateOfBirth';
  static const startDate = 'startDate';
  static const email = 'email';
  static const password = 'password';
  static const oldPassword = 'oldPassword';
  static const newPassword = 'newPassword';
  static const confirmPassword = 'confirmPassword';
  static const gender = "gender";
  static const mainLanguage = "mainLanguage";
  static const motherTongue = "motherTongue";
  static const learningLanguages = "learningLanguages";
  static const teachingLanguages = "teachingLanguages";
  static const nationality = "nationality";
  static const phoneNumber = "phoneNumber";
  static const placeOfResidence = "placeOfResidence";
  static const recitation = "recitation";
  static const recitationType = "recitationType";
  static const document = "document";
  static const iban = "iban";
  static const swiftCode = "swiftCode";
  static const bankName = "bankName";
  static const paypal = "paypal";
  static const westrenUnion = "westrenUnion";
}

final List<IsoCode> customCountries =
    IsoCode.values.where((country) => country != IsoCode.IL).toList();

abstract class AppPadding {
  static final customScrollView = EdgeInsets.only(right: 25.w, left: 25.w);
  static final pageTitlteBackBtn =
      EdgeInsets.only(top: 20.w, right: 10.w, left: 10.w);
}
