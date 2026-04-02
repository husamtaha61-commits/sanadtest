// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_requests_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyRequestsResponseImpl _$$MyRequestsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MyRequestsResponseImpl(
      requestId: (json['requestId'] as num).toInt(),
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      type: BaseFieldResponse.fromJson(json['type'] as Map<String, dynamic>),
      sender:
          UserSenderReciever.fromJson(json['sender'] as Map<String, dynamic>),
      reciever:
          UserSenderReciever.fromJson(json['reciever'] as Map<String, dynamic>),
      note: json['note'] as String?,
      creationDate:
          const DateTimeConverter().fromJson(json['creationDate'] as String?),
      oldSessionTime:
          const DateTimeConverter().fromJson(json['oldSessionTime'] as String?),
      scheduleTimes: (json['scheduleTimes'] as List<dynamic>)
          .map((e) => TimeDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      previousScheduleTimes: (json['previousScheduleTimes'] as List<dynamic>?)
          ?.map((e) => TimeDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeSuggestions: (json['timeSuggestions'] as List<dynamic>?)
          ?.map((e) =>
              TimeSuggestionsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_$StatusImpl _$$StatusImplFromJson(Map<String, dynamic> json) => _$StatusImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

_$UserSenderRecieverImpl _$$UserSenderRecieverImplFromJson(
        Map<String, dynamic> json) =>
    _$UserSenderRecieverImpl(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      description: json['description'] as String?,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      roles: (json['roles'] as List<dynamic>)
          .map((e) => UserRoleResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_$TimeSuggestionsResponseImpl _$$TimeSuggestionsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TimeSuggestionsResponseImpl(
      suggestionId: (json['suggestionId'] as num?)?.toInt(),
      suggestionDateTime: const DateTimeConverter()
          .fromJson(json['suggestionDateTime'] as String?),
    );
