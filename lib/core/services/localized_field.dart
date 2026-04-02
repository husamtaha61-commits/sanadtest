import 'package:easy_localization/easy_localization.dart';

import '../../gen/translations/locale_keys.g.dart';

enum LocalizedField {
  email,
  password,
  newPassword,
  confirmPassword,
  firstName,
  middleName,
  lastName,
  gender,
  dateOfBirth,
  startDate,
  phoneNumber,
  nationality,
  placeOfResidence,
  motherLanguage,
  mainLanguage,
  learningLanguages,
  teachingLanguages,
  recitation,
  recitationType,
  document,
  iban,
  paypal,
  swift,
  bankName,
  westernUnion,
  age,
  reciterLanguage,
  writeANote,
  day,
  time,
  unsupported
}

extension LocalizedFieldExtension on LocalizedField {
  String get key => switch (this) {
      LocalizedField.email => LocaleKeys.form_field_email,
      LocalizedField.password => LocaleKeys.form_field_password,
      LocalizedField.newPassword => LocaleKeys.form_field_newPassword,
      LocalizedField.confirmPassword => LocaleKeys.form_field_confirmPassword,
      LocalizedField.firstName => LocaleKeys.form_field_firstName,
      LocalizedField.middleName => LocaleKeys.form_field_middleName,
      LocalizedField.lastName => LocaleKeys.form_field_lastName,
      LocalizedField.gender => LocaleKeys.form_field_gender,
      LocalizedField.dateOfBirth => LocaleKeys.form_field_dateOfBirth,
      LocalizedField.startDate  => LocaleKeys.form_field_startDate,
      LocalizedField.phoneNumber => LocaleKeys.form_field_phoneNumber,
      LocalizedField.nationality => LocaleKeys.form_field_nationality,
      LocalizedField.placeOfResidence => LocaleKeys.form_field_placeOfResidence,
      LocalizedField.motherLanguage => LocaleKeys.form_field_motherTongue,
      LocalizedField.mainLanguage => LocaleKeys.form_field_mainLanguage,
      LocalizedField.learningLanguages => LocaleKeys.form_field_learningLanguages,
      LocalizedField.teachingLanguages => LocaleKeys.form_field_teachingLanguages,
      LocalizedField.recitation => LocaleKeys.form_field_recitation,
      LocalizedField.recitationType => LocaleKeys.form_field_recitationType,
      LocalizedField.document => LocaleKeys.form_field_document,
      LocalizedField.iban => LocaleKeys.form_field_iban,
      LocalizedField.paypal => LocaleKeys.form_field_paypal,
      LocalizedField.swift => LocaleKeys.form_field_swift,
      LocalizedField.bankName => LocaleKeys.form_field_bankName,
      LocalizedField.westernUnion => LocaleKeys.form_field_westernUnion,
      LocalizedField.age => LocaleKeys.form_field_age,
      LocalizedField.reciterLanguage => LocaleKeys.form_field_reciterLanguage,
      LocalizedField.writeANote => LocaleKeys.form_field_writeANote,
      LocalizedField.day => LocaleKeys.form_field_day,
      LocalizedField.time => LocaleKeys.form_field_time,
      LocalizedField.unsupported => LocaleKeys.form_error_unsupported,
    };

  String get translated {
    final value = key.tr();
    if (value == key) {
      return LocaleKeys.form_error_unsupported;
    }
    return value;
  }

  static LocalizedField fromKey(String key) => switch (key) {
      'email' => LocalizedField.email,
      'password' => LocalizedField.password,
      'newPassword' => LocalizedField.newPassword,
      'confirmPassword' => LocalizedField.confirmPassword,
      'firstName' => LocalizedField.firstName,
      'middleName' => LocalizedField.middleName,
      'lastName' => LocalizedField.lastName,
      'gender' => LocalizedField.gender,
      'dateOfBirth' => LocalizedField.dateOfBirth,
      'startDate' => LocalizedField.startDate,
      'phoneNumber' => LocalizedField.phoneNumber,
      'nationality' => LocalizedField.nationality,
      'placeOfResidence' => LocalizedField.placeOfResidence,
      'mainLanguage' => LocalizedField.mainLanguage,
      'motherTongue' => LocalizedField.motherLanguage,
      'teachingLanguages' => LocalizedField.teachingLanguages,
      'learningLanguages' => LocalizedField.learningLanguages,
      'recitation' => LocalizedField.recitation,
      'recitationType' => LocalizedField.recitationType,
      'document' => LocalizedField.document,
      'iban' => LocalizedField.iban,
      'paypal' => LocalizedField.paypal,
      'swift' => LocalizedField.swift,
      'bankName' => LocalizedField.bankName,
      'westernUnion' => LocalizedField.westernUnion,
      'age' => LocalizedField.age,
      'reciterLanguage' => LocalizedField.reciterLanguage,
      'writeANote' => LocalizedField.writeANote,
      'day' => LocalizedField.day,
      'time' => LocalizedField.time,
      String() => LocalizedField.unsupported,
  };
}