import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/forms_errors.dart';

part 'base_error.freezed.dart';

@freezed
class BaseApiError with _$BaseApiError {
  const factory BaseApiError({
    DioExceptionType? errorType,
    String? errorCode,
    String? errorMessage,
    int? responseStatusCode,
    List<BaseFormError>? baseFormErrors,
  }) = _BaseApiError;
}
