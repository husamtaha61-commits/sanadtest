// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve_request_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ApproveRequestRequestToJson(
        ApproveRequestRequest instance) =>
    <String, dynamic>{
      'scheduleRequestId': instance.scheduleRequestId,
      if (instance.startDate case final value?) 'startDate': value,
      if (instance.approvedSuggestionId case final value?)
        'approvedSuggestionId': value,
    };
