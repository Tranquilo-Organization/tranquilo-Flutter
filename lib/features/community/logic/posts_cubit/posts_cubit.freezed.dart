// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PostsState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() postsLoading,
    required TResult Function(List<Post> postsList) postsSuccess,
    required TResult Function(ApiErrorModel error) postsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? postsLoading,
    TResult? Function(List<Post> postsList)? postsSuccess,
    TResult? Function(ApiErrorModel error)? postsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? postsLoading,
    TResult Function(List<Post> postsList)? postsSuccess,
    TResult Function(ApiErrorModel error)? postsError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(PostsLoading<T> value) postsLoading,
    required TResult Function(PostsSuccess<T> value) postsSuccess,
    required TResult Function(SignUpError<T> value) postsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(PostsLoading<T> value)? postsLoading,
    TResult? Function(PostsSuccess<T> value)? postsSuccess,
    TResult? Function(SignUpError<T> value)? postsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(PostsLoading<T> value)? postsLoading,
    TResult Function(PostsSuccess<T> value)? postsSuccess,
    TResult Function(SignUpError<T> value)? postsError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsStateCopyWith<T, $Res> {
  factory $PostsStateCopyWith(
          PostsState<T> value, $Res Function(PostsState<T>) then) =
      _$PostsStateCopyWithImpl<T, $Res, PostsState<T>>;
}

/// @nodoc
class _$PostsStateCopyWithImpl<T, $Res, $Val extends PostsState<T>>
    implements $PostsStateCopyWith<T, $Res> {
  _$PostsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$PostsStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PostsState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() postsLoading,
    required TResult Function(List<Post> postsList) postsSuccess,
    required TResult Function(ApiErrorModel error) postsError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? postsLoading,
    TResult? Function(List<Post> postsList)? postsSuccess,
    TResult? Function(ApiErrorModel error)? postsError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? postsLoading,
    TResult Function(List<Post> postsList)? postsSuccess,
    TResult Function(ApiErrorModel error)? postsError,
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
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(PostsLoading<T> value) postsLoading,
    required TResult Function(PostsSuccess<T> value) postsSuccess,
    required TResult Function(SignUpError<T> value) postsError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(PostsLoading<T> value)? postsLoading,
    TResult? Function(PostsSuccess<T> value)? postsSuccess,
    TResult? Function(SignUpError<T> value)? postsError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(PostsLoading<T> value)? postsLoading,
    TResult Function(PostsSuccess<T> value)? postsSuccess,
    TResult Function(SignUpError<T> value)? postsError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements PostsState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$PostsLoadingImplCopyWith<T, $Res> {
  factory _$$PostsLoadingImplCopyWith(_$PostsLoadingImpl<T> value,
          $Res Function(_$PostsLoadingImpl<T>) then) =
      __$$PostsLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$PostsLoadingImplCopyWithImpl<T, $Res>
    extends _$PostsStateCopyWithImpl<T, $Res, _$PostsLoadingImpl<T>>
    implements _$$PostsLoadingImplCopyWith<T, $Res> {
  __$$PostsLoadingImplCopyWithImpl(
      _$PostsLoadingImpl<T> _value, $Res Function(_$PostsLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PostsLoadingImpl<T> implements PostsLoading<T> {
  const _$PostsLoadingImpl();

  @override
  String toString() {
    return 'PostsState<$T>.postsLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PostsLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() postsLoading,
    required TResult Function(List<Post> postsList) postsSuccess,
    required TResult Function(ApiErrorModel error) postsError,
  }) {
    return postsLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? postsLoading,
    TResult? Function(List<Post> postsList)? postsSuccess,
    TResult? Function(ApiErrorModel error)? postsError,
  }) {
    return postsLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? postsLoading,
    TResult Function(List<Post> postsList)? postsSuccess,
    TResult Function(ApiErrorModel error)? postsError,
    required TResult orElse(),
  }) {
    if (postsLoading != null) {
      return postsLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(PostsLoading<T> value) postsLoading,
    required TResult Function(PostsSuccess<T> value) postsSuccess,
    required TResult Function(SignUpError<T> value) postsError,
  }) {
    return postsLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(PostsLoading<T> value)? postsLoading,
    TResult? Function(PostsSuccess<T> value)? postsSuccess,
    TResult? Function(SignUpError<T> value)? postsError,
  }) {
    return postsLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(PostsLoading<T> value)? postsLoading,
    TResult Function(PostsSuccess<T> value)? postsSuccess,
    TResult Function(SignUpError<T> value)? postsError,
    required TResult orElse(),
  }) {
    if (postsLoading != null) {
      return postsLoading(this);
    }
    return orElse();
  }
}

abstract class PostsLoading<T> implements PostsState<T> {
  const factory PostsLoading() = _$PostsLoadingImpl<T>;
}

/// @nodoc
abstract class _$$PostsSuccessImplCopyWith<T, $Res> {
  factory _$$PostsSuccessImplCopyWith(_$PostsSuccessImpl<T> value,
          $Res Function(_$PostsSuccessImpl<T>) then) =
      __$$PostsSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<Post> postsList});
}

/// @nodoc
class __$$PostsSuccessImplCopyWithImpl<T, $Res>
    extends _$PostsStateCopyWithImpl<T, $Res, _$PostsSuccessImpl<T>>
    implements _$$PostsSuccessImplCopyWith<T, $Res> {
  __$$PostsSuccessImplCopyWithImpl(
      _$PostsSuccessImpl<T> _value, $Res Function(_$PostsSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postsList = null,
  }) {
    return _then(_$PostsSuccessImpl<T>(
      null == postsList
          ? _value._postsList
          : postsList // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc

class _$PostsSuccessImpl<T> implements PostsSuccess<T> {
  const _$PostsSuccessImpl(final List<Post> postsList) : _postsList = postsList;

  final List<Post> _postsList;
  @override
  List<Post> get postsList {
    if (_postsList is EqualUnmodifiableListView) return _postsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_postsList);
  }

  @override
  String toString() {
    return 'PostsState<$T>.postsSuccess(postsList: $postsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostsSuccessImpl<T> &&
            const DeepCollectionEquality()
                .equals(other._postsList, _postsList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_postsList));

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostsSuccessImplCopyWith<T, _$PostsSuccessImpl<T>> get copyWith =>
      __$$PostsSuccessImplCopyWithImpl<T, _$PostsSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() postsLoading,
    required TResult Function(List<Post> postsList) postsSuccess,
    required TResult Function(ApiErrorModel error) postsError,
  }) {
    return postsSuccess(postsList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? postsLoading,
    TResult? Function(List<Post> postsList)? postsSuccess,
    TResult? Function(ApiErrorModel error)? postsError,
  }) {
    return postsSuccess?.call(postsList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? postsLoading,
    TResult Function(List<Post> postsList)? postsSuccess,
    TResult Function(ApiErrorModel error)? postsError,
    required TResult orElse(),
  }) {
    if (postsSuccess != null) {
      return postsSuccess(postsList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(PostsLoading<T> value) postsLoading,
    required TResult Function(PostsSuccess<T> value) postsSuccess,
    required TResult Function(SignUpError<T> value) postsError,
  }) {
    return postsSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(PostsLoading<T> value)? postsLoading,
    TResult? Function(PostsSuccess<T> value)? postsSuccess,
    TResult? Function(SignUpError<T> value)? postsError,
  }) {
    return postsSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(PostsLoading<T> value)? postsLoading,
    TResult Function(PostsSuccess<T> value)? postsSuccess,
    TResult Function(SignUpError<T> value)? postsError,
    required TResult orElse(),
  }) {
    if (postsSuccess != null) {
      return postsSuccess(this);
    }
    return orElse();
  }
}

abstract class PostsSuccess<T> implements PostsState<T> {
  const factory PostsSuccess(final List<Post> postsList) =
      _$PostsSuccessImpl<T>;

  List<Post> get postsList;

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostsSuccessImplCopyWith<T, _$PostsSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignUpErrorImplCopyWith<T, $Res> {
  factory _$$SignUpErrorImplCopyWith(_$SignUpErrorImpl<T> value,
          $Res Function(_$SignUpErrorImpl<T>) then) =
      __$$SignUpErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({ApiErrorModel error});
}

/// @nodoc
class __$$SignUpErrorImplCopyWithImpl<T, $Res>
    extends _$PostsStateCopyWithImpl<T, $Res, _$SignUpErrorImpl<T>>
    implements _$$SignUpErrorImplCopyWith<T, $Res> {
  __$$SignUpErrorImplCopyWithImpl(
      _$SignUpErrorImpl<T> _value, $Res Function(_$SignUpErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$SignUpErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc

class _$SignUpErrorImpl<T> implements SignUpError<T> {
  const _$SignUpErrorImpl({required this.error});

  @override
  final ApiErrorModel error;

  @override
  String toString() {
    return 'PostsState<$T>.postsError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpErrorImplCopyWith<T, _$SignUpErrorImpl<T>> get copyWith =>
      __$$SignUpErrorImplCopyWithImpl<T, _$SignUpErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() postsLoading,
    required TResult Function(List<Post> postsList) postsSuccess,
    required TResult Function(ApiErrorModel error) postsError,
  }) {
    return postsError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? postsLoading,
    TResult? Function(List<Post> postsList)? postsSuccess,
    TResult? Function(ApiErrorModel error)? postsError,
  }) {
    return postsError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? postsLoading,
    TResult Function(List<Post> postsList)? postsSuccess,
    TResult Function(ApiErrorModel error)? postsError,
    required TResult orElse(),
  }) {
    if (postsError != null) {
      return postsError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(PostsLoading<T> value) postsLoading,
    required TResult Function(PostsSuccess<T> value) postsSuccess,
    required TResult Function(SignUpError<T> value) postsError,
  }) {
    return postsError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(PostsLoading<T> value)? postsLoading,
    TResult? Function(PostsSuccess<T> value)? postsSuccess,
    TResult? Function(SignUpError<T> value)? postsError,
  }) {
    return postsError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(PostsLoading<T> value)? postsLoading,
    TResult Function(PostsSuccess<T> value)? postsSuccess,
    TResult Function(SignUpError<T> value)? postsError,
    required TResult orElse(),
  }) {
    if (postsError != null) {
      return postsError(this);
    }
    return orElse();
  }
}

abstract class SignUpError<T> implements PostsState<T> {
  const factory SignUpError({required final ApiErrorModel error}) =
      _$SignUpErrorImpl<T>;

  ApiErrorModel get error;

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpErrorImplCopyWith<T, _$SignUpErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
