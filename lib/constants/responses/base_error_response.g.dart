// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseErrorResponseImpl _$$BaseErrorResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BaseErrorResponseImpl(
      code: json['code'] as String,
      error: json['message'] as String,
      data: json['data'] == null
          ? null
          : BaseErrorResponseData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BaseErrorResponseImplToJson(
        _$BaseErrorResponseImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.error,
      'data': instance.data,
    };

_$BaseErrorResponseDataImpl _$$BaseErrorResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$BaseErrorResponseDataImpl(
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => BaseFormError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BaseErrorResponseDataImplToJson(
        _$BaseErrorResponseDataImpl instance) =>
    <String, dynamic>{
      'errors': instance.errors,
    };
