import 'package:freezed_annotation/freezed_annotation.dart';

part 'forms_errors.freezed.dart';
part 'forms_errors.g.dart';

@freezed
class BaseFormError with _$BaseFormError {
  const factory BaseFormError({
    @JsonKey(name: "key") required String? field,
    required String? message,
  }) = _BaseFormError;

  factory BaseFormError.fromJson(Map<String, dynamic> json) =>
      _$BaseFormErrorFromJson(json);
}
