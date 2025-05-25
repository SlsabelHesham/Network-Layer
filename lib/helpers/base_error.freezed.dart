// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BaseApiError {
  DioExceptionType? get errorType => throw _privateConstructorUsedError;
  String? get errorCode => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  int? get responseStatusCode => throw _privateConstructorUsedError;
  List<BaseFormError>? get baseFormErrors => throw _privateConstructorUsedError;

  /// Create a copy of BaseApiError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BaseApiErrorCopyWith<BaseApiError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseApiErrorCopyWith<$Res> {
  factory $BaseApiErrorCopyWith(
          BaseApiError value, $Res Function(BaseApiError) then) =
      _$BaseApiErrorCopyWithImpl<$Res, BaseApiError>;
  @useResult
  $Res call(
      {DioExceptionType? errorType,
      String? errorCode,
      String? errorMessage,
      int? responseStatusCode,
      List<BaseFormError>? baseFormErrors});
}

/// @nodoc
class _$BaseApiErrorCopyWithImpl<$Res, $Val extends BaseApiError>
    implements $BaseApiErrorCopyWith<$Res> {
  _$BaseApiErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BaseApiError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorType = freezed,
    Object? errorCode = freezed,
    Object? errorMessage = freezed,
    Object? responseStatusCode = freezed,
    Object? baseFormErrors = freezed,
  }) {
    return _then(_value.copyWith(
      errorType: freezed == errorType
          ? _value.errorType
          : errorType // ignore: cast_nullable_to_non_nullable
              as DioExceptionType?,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      responseStatusCode: freezed == responseStatusCode
          ? _value.responseStatusCode
          : responseStatusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      baseFormErrors: freezed == baseFormErrors
          ? _value.baseFormErrors
          : baseFormErrors // ignore: cast_nullable_to_non_nullable
              as List<BaseFormError>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseApiErrorImplCopyWith<$Res>
    implements $BaseApiErrorCopyWith<$Res> {
  factory _$$BaseApiErrorImplCopyWith(
          _$BaseApiErrorImpl value, $Res Function(_$BaseApiErrorImpl) then) =
      __$$BaseApiErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DioExceptionType? errorType,
      String? errorCode,
      String? errorMessage,
      int? responseStatusCode,
      List<BaseFormError>? baseFormErrors});
}

/// @nodoc
class __$$BaseApiErrorImplCopyWithImpl<$Res>
    extends _$BaseApiErrorCopyWithImpl<$Res, _$BaseApiErrorImpl>
    implements _$$BaseApiErrorImplCopyWith<$Res> {
  __$$BaseApiErrorImplCopyWithImpl(
      _$BaseApiErrorImpl _value, $Res Function(_$BaseApiErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of BaseApiError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorType = freezed,
    Object? errorCode = freezed,
    Object? errorMessage = freezed,
    Object? responseStatusCode = freezed,
    Object? baseFormErrors = freezed,
  }) {
    return _then(_$BaseApiErrorImpl(
      errorType: freezed == errorType
          ? _value.errorType
          : errorType // ignore: cast_nullable_to_non_nullable
              as DioExceptionType?,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      responseStatusCode: freezed == responseStatusCode
          ? _value.responseStatusCode
          : responseStatusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      baseFormErrors: freezed == baseFormErrors
          ? _value._baseFormErrors
          : baseFormErrors // ignore: cast_nullable_to_non_nullable
              as List<BaseFormError>?,
    ));
  }
}

/// @nodoc

class _$BaseApiErrorImpl implements _BaseApiError {
  const _$BaseApiErrorImpl(
      {this.errorType,
      this.errorCode,
      this.errorMessage,
      this.responseStatusCode,
      final List<BaseFormError>? baseFormErrors})
      : _baseFormErrors = baseFormErrors;

  @override
  final DioExceptionType? errorType;
  @override
  final String? errorCode;
  @override
  final String? errorMessage;
  @override
  final int? responseStatusCode;
  final List<BaseFormError>? _baseFormErrors;
  @override
  List<BaseFormError>? get baseFormErrors {
    final value = _baseFormErrors;
    if (value == null) return null;
    if (_baseFormErrors is EqualUnmodifiableListView) return _baseFormErrors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BaseApiError(errorType: $errorType, errorCode: $errorCode, errorMessage: $errorMessage, responseStatusCode: $responseStatusCode, baseFormErrors: $baseFormErrors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseApiErrorImpl &&
            (identical(other.errorType, errorType) ||
                other.errorType == errorType) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.responseStatusCode, responseStatusCode) ||
                other.responseStatusCode == responseStatusCode) &&
            const DeepCollectionEquality()
                .equals(other._baseFormErrors, _baseFormErrors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      errorType,
      errorCode,
      errorMessage,
      responseStatusCode,
      const DeepCollectionEquality().hash(_baseFormErrors));

  /// Create a copy of BaseApiError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseApiErrorImplCopyWith<_$BaseApiErrorImpl> get copyWith =>
      __$$BaseApiErrorImplCopyWithImpl<_$BaseApiErrorImpl>(this, _$identity);
}

abstract class _BaseApiError implements BaseApiError {
  const factory _BaseApiError(
      {final DioExceptionType? errorType,
      final String? errorCode,
      final String? errorMessage,
      final int? responseStatusCode,
      final List<BaseFormError>? baseFormErrors}) = _$BaseApiErrorImpl;

  @override
  DioExceptionType? get errorType;
  @override
  String? get errorCode;
  @override
  String? get errorMessage;
  @override
  int? get responseStatusCode;
  @override
  List<BaseFormError>? get baseFormErrors;

  /// Create a copy of BaseApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseApiErrorImplCopyWith<_$BaseApiErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
