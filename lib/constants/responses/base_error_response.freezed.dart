// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_error_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BaseErrorResponse _$BaseErrorResponseFromJson(Map<String, dynamic> json) {
  return _BaseErrorResponse.fromJson(json);
}

/// @nodoc
mixin _$BaseErrorResponse {
  @JsonKey(name: "code")
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String get error => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  BaseErrorResponseData? get data => throw _privateConstructorUsedError;

  /// Serializes this BaseErrorResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BaseErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BaseErrorResponseCopyWith<BaseErrorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseErrorResponseCopyWith<$Res> {
  factory $BaseErrorResponseCopyWith(
          BaseErrorResponse value, $Res Function(BaseErrorResponse) then) =
      _$BaseErrorResponseCopyWithImpl<$Res, BaseErrorResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "code") String code,
      @JsonKey(name: "message") String error,
      @JsonKey(name: "data") BaseErrorResponseData? data});

  $BaseErrorResponseDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$BaseErrorResponseCopyWithImpl<$Res, $Val extends BaseErrorResponse>
    implements $BaseErrorResponseCopyWith<$Res> {
  _$BaseErrorResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BaseErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? error = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as BaseErrorResponseData?,
    ) as $Val);
  }

  /// Create a copy of BaseErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BaseErrorResponseDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $BaseErrorResponseDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BaseErrorResponseImplCopyWith<$Res>
    implements $BaseErrorResponseCopyWith<$Res> {
  factory _$$BaseErrorResponseImplCopyWith(_$BaseErrorResponseImpl value,
          $Res Function(_$BaseErrorResponseImpl) then) =
      __$$BaseErrorResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "code") String code,
      @JsonKey(name: "message") String error,
      @JsonKey(name: "data") BaseErrorResponseData? data});

  @override
  $BaseErrorResponseDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$BaseErrorResponseImplCopyWithImpl<$Res>
    extends _$BaseErrorResponseCopyWithImpl<$Res, _$BaseErrorResponseImpl>
    implements _$$BaseErrorResponseImplCopyWith<$Res> {
  __$$BaseErrorResponseImplCopyWithImpl(_$BaseErrorResponseImpl _value,
      $Res Function(_$BaseErrorResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of BaseErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? error = null,
    Object? data = freezed,
  }) {
    return _then(_$BaseErrorResponseImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as BaseErrorResponseData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BaseErrorResponseImpl implements _BaseErrorResponse {
  const _$BaseErrorResponseImpl(
      {@JsonKey(name: "code") required this.code,
      @JsonKey(name: "message") required this.error,
      @JsonKey(name: "data") required this.data});

  factory _$BaseErrorResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BaseErrorResponseImplFromJson(json);

  @override
  @JsonKey(name: "code")
  final String code;
  @override
  @JsonKey(name: "message")
  final String error;
  @override
  @JsonKey(name: "data")
  final BaseErrorResponseData? data;

  @override
  String toString() {
    return 'BaseErrorResponse(code: $code, error: $error, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseErrorResponseImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, error, data);

  /// Create a copy of BaseErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseErrorResponseImplCopyWith<_$BaseErrorResponseImpl> get copyWith =>
      __$$BaseErrorResponseImplCopyWithImpl<_$BaseErrorResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BaseErrorResponseImplToJson(
      this,
    );
  }
}

abstract class _BaseErrorResponse implements BaseErrorResponse {
  const factory _BaseErrorResponse(
          {@JsonKey(name: "code") required final String code,
          @JsonKey(name: "message") required final String error,
          @JsonKey(name: "data") required final BaseErrorResponseData? data}) =
      _$BaseErrorResponseImpl;

  factory _BaseErrorResponse.fromJson(Map<String, dynamic> json) =
      _$BaseErrorResponseImpl.fromJson;

  @override
  @JsonKey(name: "code")
  String get code;
  @override
  @JsonKey(name: "message")
  String get error;
  @override
  @JsonKey(name: "data")
  BaseErrorResponseData? get data;

  /// Create a copy of BaseErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseErrorResponseImplCopyWith<_$BaseErrorResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BaseErrorResponseData _$BaseErrorResponseDataFromJson(
    Map<String, dynamic> json) {
  return _BaseErrorResponseData.fromJson(json);
}

/// @nodoc
mixin _$BaseErrorResponseData {
  @JsonKey(name: "errors")
  List<BaseFormError>? get errors => throw _privateConstructorUsedError;

  /// Serializes this BaseErrorResponseData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BaseErrorResponseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BaseErrorResponseDataCopyWith<BaseErrorResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseErrorResponseDataCopyWith<$Res> {
  factory $BaseErrorResponseDataCopyWith(BaseErrorResponseData value,
          $Res Function(BaseErrorResponseData) then) =
      _$BaseErrorResponseDataCopyWithImpl<$Res, BaseErrorResponseData>;
  @useResult
  $Res call({@JsonKey(name: "errors") List<BaseFormError>? errors});
}

/// @nodoc
class _$BaseErrorResponseDataCopyWithImpl<$Res,
        $Val extends BaseErrorResponseData>
    implements $BaseErrorResponseDataCopyWith<$Res> {
  _$BaseErrorResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BaseErrorResponseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = freezed,
  }) {
    return _then(_value.copyWith(
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<BaseFormError>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseErrorResponseDataImplCopyWith<$Res>
    implements $BaseErrorResponseDataCopyWith<$Res> {
  factory _$$BaseErrorResponseDataImplCopyWith(
          _$BaseErrorResponseDataImpl value,
          $Res Function(_$BaseErrorResponseDataImpl) then) =
      __$$BaseErrorResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "errors") List<BaseFormError>? errors});
}

/// @nodoc
class __$$BaseErrorResponseDataImplCopyWithImpl<$Res>
    extends _$BaseErrorResponseDataCopyWithImpl<$Res,
        _$BaseErrorResponseDataImpl>
    implements _$$BaseErrorResponseDataImplCopyWith<$Res> {
  __$$BaseErrorResponseDataImplCopyWithImpl(_$BaseErrorResponseDataImpl _value,
      $Res Function(_$BaseErrorResponseDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of BaseErrorResponseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = freezed,
  }) {
    return _then(_$BaseErrorResponseDataImpl(
      errors: freezed == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<BaseFormError>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BaseErrorResponseDataImpl implements _BaseErrorResponseData {
  const _$BaseErrorResponseDataImpl(
      {@JsonKey(name: "errors") required final List<BaseFormError>? errors})
      : _errors = errors;

  factory _$BaseErrorResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BaseErrorResponseDataImplFromJson(json);

  final List<BaseFormError>? _errors;
  @override
  @JsonKey(name: "errors")
  List<BaseFormError>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BaseErrorResponseData(errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseErrorResponseDataImpl &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_errors));

  /// Create a copy of BaseErrorResponseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseErrorResponseDataImplCopyWith<_$BaseErrorResponseDataImpl>
      get copyWith => __$$BaseErrorResponseDataImplCopyWithImpl<
          _$BaseErrorResponseDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BaseErrorResponseDataImplToJson(
      this,
    );
  }
}

abstract class _BaseErrorResponseData implements BaseErrorResponseData {
  const factory _BaseErrorResponseData(
          {@JsonKey(name: "errors")
          required final List<BaseFormError>? errors}) =
      _$BaseErrorResponseDataImpl;

  factory _BaseErrorResponseData.fromJson(Map<String, dynamic> json) =
      _$BaseErrorResponseDataImpl.fromJson;

  @override
  @JsonKey(name: "errors")
  List<BaseFormError>? get errors;

  /// Create a copy of BaseErrorResponseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseErrorResponseDataImplCopyWith<_$BaseErrorResponseDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
