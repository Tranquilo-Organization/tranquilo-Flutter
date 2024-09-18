// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResetPasswordState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(ApiErrorModel error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(ApiErrorModel error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(ApiErrorModel error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResetPasswordInitial<T> value) initial,
    required TResult Function(ResetPasswordLoading<T> value) loading,
    required TResult Function(ResetPasswordSuccess<T> value) success,
    required TResult Function(ResetPasswordError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResetPasswordInitial<T> value)? initial,
    TResult? Function(ResetPasswordLoading<T> value)? loading,
    TResult? Function(ResetPasswordSuccess<T> value)? success,
    TResult? Function(ResetPasswordError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResetPasswordInitial<T> value)? initial,
    TResult Function(ResetPasswordLoading<T> value)? loading,
    TResult Function(ResetPasswordSuccess<T> value)? success,
    TResult Function(ResetPasswordError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordStateCopyWith<T, $Res> {
  factory $ResetPasswordStateCopyWith(ResetPasswordState<T> value,
          $Res Function(ResetPasswordState<T>) then) =
      _$ResetPasswordStateCopyWithImpl<T, $Res, ResetPasswordState<T>>;
}

/// @nodoc
class _$ResetPasswordStateCopyWithImpl<T, $Res,
        $Val extends ResetPasswordState<T>>
    implements $ResetPasswordStateCopyWith<T, $Res> {
  _$ResetPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResetPasswordState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ResetPasswordInitialImplCopyWith<T, $Res> {
  factory _$$ResetPasswordInitialImplCopyWith(
          _$ResetPasswordInitialImpl<T> value,
          $Res Function(_$ResetPasswordInitialImpl<T>) then) =
      __$$ResetPasswordInitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ResetPasswordInitialImplCopyWithImpl<T, $Res>
    extends _$ResetPasswordStateCopyWithImpl<T, $Res,
        _$ResetPasswordInitialImpl<T>>
    implements _$$ResetPasswordInitialImplCopyWith<T, $Res> {
  __$$ResetPasswordInitialImplCopyWithImpl(_$ResetPasswordInitialImpl<T> _value,
      $Res Function(_$ResetPasswordInitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ResetPasswordState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetPasswordInitialImpl<T> implements ResetPasswordInitial<T> {
  const _$ResetPasswordInitialImpl();

  @override
  String toString() {
    return 'ResetPasswordState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordInitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(ApiErrorModel error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(ApiErrorModel error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(ApiErrorModel error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResetPasswordInitial<T> value) initial,
    required TResult Function(ResetPasswordLoading<T> value) loading,
    required TResult Function(ResetPasswordSuccess<T> value) success,
    required TResult Function(ResetPasswordError<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResetPasswordInitial<T> value)? initial,
    TResult? Function(ResetPasswordLoading<T> value)? loading,
    TResult? Function(ResetPasswordSuccess<T> value)? success,
    TResult? Function(ResetPasswordError<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResetPasswordInitial<T> value)? initial,
    TResult Function(ResetPasswordLoading<T> value)? loading,
    TResult Function(ResetPasswordSuccess<T> value)? success,
    TResult Function(ResetPasswordError<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ResetPasswordInitial<T> implements ResetPasswordState<T> {
  const factory ResetPasswordInitial() = _$ResetPasswordInitialImpl<T>;
}

/// @nodoc
abstract class _$$ResetPasswordLoadingImplCopyWith<T, $Res> {
  factory _$$ResetPasswordLoadingImplCopyWith(
          _$ResetPasswordLoadingImpl<T> value,
          $Res Function(_$ResetPasswordLoadingImpl<T>) then) =
      __$$ResetPasswordLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ResetPasswordLoadingImplCopyWithImpl<T, $Res>
    extends _$ResetPasswordStateCopyWithImpl<T, $Res,
        _$ResetPasswordLoadingImpl<T>>
    implements _$$ResetPasswordLoadingImplCopyWith<T, $Res> {
  __$$ResetPasswordLoadingImplCopyWithImpl(_$ResetPasswordLoadingImpl<T> _value,
      $Res Function(_$ResetPasswordLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ResetPasswordState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetPasswordLoadingImpl<T> implements ResetPasswordLoading<T> {
  const _$ResetPasswordLoadingImpl();

  @override
  String toString() {
    return 'ResetPasswordState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(ApiErrorModel error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(ApiErrorModel error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(ApiErrorModel error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResetPasswordInitial<T> value) initial,
    required TResult Function(ResetPasswordLoading<T> value) loading,
    required TResult Function(ResetPasswordSuccess<T> value) success,
    required TResult Function(ResetPasswordError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResetPasswordInitial<T> value)? initial,
    TResult? Function(ResetPasswordLoading<T> value)? loading,
    TResult? Function(ResetPasswordSuccess<T> value)? success,
    TResult? Function(ResetPasswordError<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResetPasswordInitial<T> value)? initial,
    TResult Function(ResetPasswordLoading<T> value)? loading,
    TResult Function(ResetPasswordSuccess<T> value)? success,
    TResult Function(ResetPasswordError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ResetPasswordLoading<T> implements ResetPasswordState<T> {
  const factory ResetPasswordLoading() = _$ResetPasswordLoadingImpl<T>;
}

/// @nodoc
abstract class _$$ResetPasswordSuccessImplCopyWith<T, $Res> {
  factory _$$ResetPasswordSuccessImplCopyWith(
          _$ResetPasswordSuccessImpl<T> value,
          $Res Function(_$ResetPasswordSuccessImpl<T>) then) =
      __$$ResetPasswordSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$ResetPasswordSuccessImplCopyWithImpl<T, $Res>
    extends _$ResetPasswordStateCopyWithImpl<T, $Res,
        _$ResetPasswordSuccessImpl<T>>
    implements _$$ResetPasswordSuccessImplCopyWith<T, $Res> {
  __$$ResetPasswordSuccessImplCopyWithImpl(_$ResetPasswordSuccessImpl<T> _value,
      $Res Function(_$ResetPasswordSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ResetPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ResetPasswordSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ResetPasswordSuccessImpl<T> implements ResetPasswordSuccess<T> {
  const _$ResetPasswordSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'ResetPasswordState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of ResetPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordSuccessImplCopyWith<T, _$ResetPasswordSuccessImpl<T>>
      get copyWith => __$$ResetPasswordSuccessImplCopyWithImpl<T,
          _$ResetPasswordSuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(ApiErrorModel error) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(ApiErrorModel error)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(ApiErrorModel error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResetPasswordInitial<T> value) initial,
    required TResult Function(ResetPasswordLoading<T> value) loading,
    required TResult Function(ResetPasswordSuccess<T> value) success,
    required TResult Function(ResetPasswordError<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResetPasswordInitial<T> value)? initial,
    TResult? Function(ResetPasswordLoading<T> value)? loading,
    TResult? Function(ResetPasswordSuccess<T> value)? success,
    TResult? Function(ResetPasswordError<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResetPasswordInitial<T> value)? initial,
    TResult Function(ResetPasswordLoading<T> value)? loading,
    TResult Function(ResetPasswordSuccess<T> value)? success,
    TResult Function(ResetPasswordError<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ResetPasswordSuccess<T> implements ResetPasswordState<T> {
  const factory ResetPasswordSuccess(final T data) =
      _$ResetPasswordSuccessImpl<T>;

  T get data;

  /// Create a copy of ResetPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPasswordSuccessImplCopyWith<T, _$ResetPasswordSuccessImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetPasswordErrorImplCopyWith<T, $Res> {
  factory _$$ResetPasswordErrorImplCopyWith(_$ResetPasswordErrorImpl<T> value,
          $Res Function(_$ResetPasswordErrorImpl<T>) then) =
      __$$ResetPasswordErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({ApiErrorModel error});
}

/// @nodoc
class __$$ResetPasswordErrorImplCopyWithImpl<T, $Res>
    extends _$ResetPasswordStateCopyWithImpl<T, $Res,
        _$ResetPasswordErrorImpl<T>>
    implements _$$ResetPasswordErrorImplCopyWith<T, $Res> {
  __$$ResetPasswordErrorImplCopyWithImpl(_$ResetPasswordErrorImpl<T> _value,
      $Res Function(_$ResetPasswordErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ResetPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ResetPasswordErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc

class _$ResetPasswordErrorImpl<T> implements ResetPasswordError<T> {
  const _$ResetPasswordErrorImpl({required this.error});

  @override
  final ApiErrorModel error;

  @override
  String toString() {
    return 'ResetPasswordState<$T>.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ResetPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordErrorImplCopyWith<T, _$ResetPasswordErrorImpl<T>>
      get copyWith => __$$ResetPasswordErrorImplCopyWithImpl<T,
          _$ResetPasswordErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(ApiErrorModel error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(ApiErrorModel error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(ApiErrorModel error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResetPasswordInitial<T> value) initial,
    required TResult Function(ResetPasswordLoading<T> value) loading,
    required TResult Function(ResetPasswordSuccess<T> value) success,
    required TResult Function(ResetPasswordError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResetPasswordInitial<T> value)? initial,
    TResult? Function(ResetPasswordLoading<T> value)? loading,
    TResult? Function(ResetPasswordSuccess<T> value)? success,
    TResult? Function(ResetPasswordError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResetPasswordInitial<T> value)? initial,
    TResult Function(ResetPasswordLoading<T> value)? loading,
    TResult Function(ResetPasswordSuccess<T> value)? success,
    TResult Function(ResetPasswordError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ResetPasswordError<T> implements ResetPasswordState<T> {
  const factory ResetPasswordError({required final ApiErrorModel error}) =
      _$ResetPasswordErrorImpl<T>;

  ApiErrorModel get error;

  /// Create a copy of ResetPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPasswordErrorImplCopyWith<T, _$ResetPasswordErrorImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
