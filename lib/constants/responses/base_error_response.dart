import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/forms_errors.dart';


part 'base_error_response.freezed.dart';
part 'base_error_response.g.dart';

@freezed
class BaseErrorResponse with _$BaseErrorResponse{
  const factory BaseErrorResponse({
    @JsonKey(name: "code") required String code,
    @JsonKey(name: "message") required String error,
    @JsonKey(name: "data") required BaseErrorResponseData? data,
  }) = _BaseErrorResponse;

  factory BaseErrorResponse.fromJson(Map<String, dynamic> json) => _$BaseErrorResponseFromJson(json);

}

@freezed
class BaseErrorResponseData with _$BaseErrorResponseData {
  const factory BaseErrorResponseData({
    @JsonKey(name: "errors") required List<BaseFormError>? errors,
  }) = _BaseErrorResponseData;

  factory BaseErrorResponseData.fromJson(Map<String, dynamic> json) => _$BaseErrorResponseDataFromJson(json);
}
