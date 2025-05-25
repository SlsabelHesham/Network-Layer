// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forms_errors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BaseFormError _$BaseFormErrorFromJson(Map<String, dynamic> json) {
  return _BaseFormError.fromJson(json);
}

/// @nodoc
mixin _$BaseFormError {
  @JsonKey(name: "key")
  String? get field => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this BaseFormError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BaseFormError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BaseFormErrorCopyWith<BaseFormError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseFormErrorCopyWith<$Res> {
  factory $BaseFormErrorCopyWith(
          BaseFormError value, $Res Function(BaseFormError) then) =
      _$BaseFormErrorCopyWithImpl<$Res, BaseFormError>;
  @useResult
  $Res call({@JsonKey(name: "key") String? field, String? message});
}

/// @nodoc
class _$BaseFormErrorCopyWithImpl<$Res, $Val extends BaseFormError>
    implements $BaseFormErrorCopyWith<$Res> {
  _$BaseFormErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BaseFormError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      field: freezed == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseFormErrorImplCopyWith<$Res>
    implements $BaseFormErrorCopyWith<$Res> {
  factory _$$BaseFormErrorImplCopyWith(
          _$BaseFormErrorImpl value, $Res Function(_$BaseFormErrorImpl) then) =
      __$$BaseFormErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "key") String? field, String? message});
}

/// @nodoc
class __$$BaseFormErrorImplCopyWithImpl<$Res>
    extends _$BaseFormErrorCopyWithImpl<$Res, _$BaseFormErrorImpl>
    implements _$$BaseFormErrorImplCopyWith<$Res> {
  __$$BaseFormErrorImplCopyWithImpl(
      _$BaseFormErrorImpl _value, $Res Function(_$BaseFormErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of BaseFormError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = freezed,
    Object? message = freezed,
  }) {
    return _then(_$BaseFormErrorImpl(
      field: freezed == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BaseFormErrorImpl implements _BaseFormError {
  const _$BaseFormErrorImpl(
      {@JsonKey(name: "key") required this.field, required this.message});

  factory _$BaseFormErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$BaseFormErrorImplFromJson(json);

  @override
  @JsonKey(name: "key")
  final String? field;
  @override
  final String? message;

  @override
  String toString() {
    return 'BaseFormError(field: $field, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseFormErrorImpl &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, field, message);

  /// Create a copy of BaseFormError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseFormErrorImplCopyWith<_$BaseFormErrorImpl> get copyWith =>
      __$$BaseFormErrorImplCopyWithImpl<_$BaseFormErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BaseFormErrorImplToJson(
      this,
    );
  }
}

abstract class _BaseFormError implements BaseFormError {
  const factory _BaseFormError(
      {@JsonKey(name: "key") required final String? field,
      required final String? message}) = _$BaseFormErrorImpl;

  factory _BaseFormError.fromJson(Map<String, dynamic> json) =
      _$BaseFormErrorImpl.fromJson;

  @override
  @JsonKey(name: "key")
  String? get field;
  @override
  String? get message;

  /// Create a copy of BaseFormError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseFormErrorImplCopyWith<_$BaseFormErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
