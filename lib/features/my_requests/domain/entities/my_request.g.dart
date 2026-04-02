// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyRequestImpl _$$MyRequestImplFromJson(Map<String, dynamic> json) =>
    _$MyRequestImpl(
      requestId: (json['requestId'] as num).toInt(),
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      type: BaseFieldResponse.fromJson(json['type'] as Map<String, dynamic>),
      sender:
          UserSenderReciever.fromJson(json['sender'] as Map<String, dynamic>),
      reciever:
          UserSenderReciever.fromJson(json['reciever'] as Map<String, dynamic>),
      note: json['note'] as String?,
      creationDate: DateTime.parse(json['creationDate'] as String),
      oldSessionTime: DateTime.parse(json['oldSessionTime'] as String),
      scheduleTimes: (json['scheduleTimes'] as List<dynamic>)
          .map((e) => TimeData.fromJson(e as Map<String, dynamic>))
          .toList(),
      previousScheduleTimes: (json['previousScheduleTimes'] as List<dynamic>)
          .map((e) => TimeData.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeSuggestions: (json['timeSuggestions'] as List<dynamic>?)
          ?.map((e) =>
              TimeSuggestionsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
