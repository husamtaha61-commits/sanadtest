// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_pagination_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BasePaginationResponseImpl<T> _$$BasePaginationResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$BasePaginationResponseImpl<T>(
      data:
          (json['data'] as List<dynamic>?)?.map(fromJsonT).toList() ?? const [],
      totalRecords: (json['totalRecords'] as num?)?.toInt() ?? 0,
      totalDisplayRecords: (json['totalDisplayRecords'] as num?)?.toInt() ?? 0,
    );
