// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommentsState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() commentsLoading,
    required TResult Function(List<CommentModel> commentsList) commentsSuccess,
    required TResult Function(ApiErrorModel error) commentsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? commentsLoading,
    TResult? Function(List<CommentModel> commentsList)? commentsSuccess,
    TResult? Function(ApiErrorModel error)? commentsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? commentsLoading,
    TResult Function(List<CommentModel> commentsList)? commentsSuccess,
    TResult Function(ApiErrorModel error)? commentsError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(CommentsLoading<T> value) commentsLoading,
    required TResult Function(CommentsSuccess<T> value) commentsSuccess,
    required TResult Function(CommentsError<T> value) commentsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(CommentsLoading<T> value)? commentsLoading,
    TResult? Function(CommentsSuccess<T> value)? commentsSuccess,
    TResult? Function(CommentsError<T> value)? commentsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(CommentsLoading<T> value)? commentsLoading,
    TResult Function(CommentsSuccess<T> value)? commentsSuccess,
    TResult Function(CommentsError<T> value)? commentsError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsStateCopyWith<T, $Res> {
  factory $CommentsStateCopyWith(
          CommentsState<T> value, $Res Function(CommentsState<T>) then) =
      _$CommentsStateCopyWithImpl<T, $Res, CommentsState<T>>;
}

/// @nodoc
class _$CommentsStateCopyWithImpl<T, $Res, $Val extends CommentsState<T>>
    implements $CommentsStateCopyWith<T, $Res> {
  _$CommentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentsState
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
    extends _$CommentsStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'CommentsState<$T>.initial()';
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
    required TResult Function() commentsLoading,
    required TResult Function(List<CommentModel> commentsList) commentsSuccess,
    required TResult Function(ApiErrorModel error) commentsError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? commentsLoading,
    TResult? Function(List<CommentModel> commentsList)? commentsSuccess,
    TResult? Function(ApiErrorModel error)? commentsError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? commentsLoading,
    TResult Function(List<CommentModel> commentsList)? commentsSuccess,
    TResult Function(ApiErrorModel error)? commentsError,
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
    required TResult Function(CommentsLoading<T> value) commentsLoading,
    required TResult Function(CommentsSuccess<T> value) commentsSuccess,
    required TResult Function(CommentsError<T> value) commentsError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(CommentsLoading<T> value)? commentsLoading,
    TResult? Function(CommentsSuccess<T> value)? commentsSuccess,
    TResult? Function(CommentsError<T> value)? commentsError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(CommentsLoading<T> value)? commentsLoading,
    TResult Function(CommentsSuccess<T> value)? commentsSuccess,
    TResult Function(CommentsError<T> value)? commentsError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements CommentsState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$CommentsLoadingImplCopyWith<T, $Res> {
  factory _$$CommentsLoadingImplCopyWith(_$CommentsLoadingImpl<T> value,
          $Res Function(_$CommentsLoadingImpl<T>) then) =
      __$$CommentsLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$CommentsLoadingImplCopyWithImpl<T, $Res>
    extends _$CommentsStateCopyWithImpl<T, $Res, _$CommentsLoadingImpl<T>>
    implements _$$CommentsLoadingImplCopyWith<T, $Res> {
  __$$CommentsLoadingImplCopyWithImpl(_$CommentsLoadingImpl<T> _value,
      $Res Function(_$CommentsLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CommentsLoadingImpl<T> implements CommentsLoading<T> {
  const _$CommentsLoadingImpl();

  @override
  String toString() {
    return 'CommentsState<$T>.commentsLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CommentsLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() commentsLoading,
    required TResult Function(List<CommentModel> commentsList) commentsSuccess,
    required TResult Function(ApiErrorModel error) commentsError,
  }) {
    return commentsLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? commentsLoading,
    TResult? Function(List<CommentModel> commentsList)? commentsSuccess,
    TResult? Function(ApiErrorModel error)? commentsError,
  }) {
    return commentsLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? commentsLoading,
    TResult Function(List<CommentModel> commentsList)? commentsSuccess,
    TResult Function(ApiErrorModel error)? commentsError,
    required TResult orElse(),
  }) {
    if (commentsLoading != null) {
      return commentsLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(CommentsLoading<T> value) commentsLoading,
    required TResult Function(CommentsSuccess<T> value) commentsSuccess,
    required TResult Function(CommentsError<T> value) commentsError,
  }) {
    return commentsLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(CommentsLoading<T> value)? commentsLoading,
    TResult? Function(CommentsSuccess<T> value)? commentsSuccess,
    TResult? Function(CommentsError<T> value)? commentsError,
  }) {
    return commentsLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(CommentsLoading<T> value)? commentsLoading,
    TResult Function(CommentsSuccess<T> value)? commentsSuccess,
    TResult Function(CommentsError<T> value)? commentsError,
    required TResult orElse(),
  }) {
    if (commentsLoading != null) {
      return commentsLoading(this);
    }
    return orElse();
  }
}

abstract class CommentsLoading<T> implements CommentsState<T> {
  const factory CommentsLoading() = _$CommentsLoadingImpl<T>;
}

/// @nodoc
abstract class _$$CommentsSuccessImplCopyWith<T, $Res> {
  factory _$$CommentsSuccessImplCopyWith(_$CommentsSuccessImpl<T> value,
          $Res Function(_$CommentsSuccessImpl<T>) then) =
      __$$CommentsSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<CommentModel> commentsList});
}

/// @nodoc
class __$$CommentsSuccessImplCopyWithImpl<T, $Res>
    extends _$CommentsStateCopyWithImpl<T, $Res, _$CommentsSuccessImpl<T>>
    implements _$$CommentsSuccessImplCopyWith<T, $Res> {
  __$$CommentsSuccessImplCopyWithImpl(_$CommentsSuccessImpl<T> _value,
      $Res Function(_$CommentsSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentsList = null,
  }) {
    return _then(_$CommentsSuccessImpl<T>(
      null == commentsList
          ? _value._commentsList
          : commentsList // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>,
    ));
  }
}

/// @nodoc

class _$CommentsSuccessImpl<T> implements CommentsSuccess<T> {
  const _$CommentsSuccessImpl(final List<CommentModel> commentsList)
      : _commentsList = commentsList;

  final List<CommentModel> _commentsList;
  @override
  List<CommentModel> get commentsList {
    if (_commentsList is EqualUnmodifiableListView) return _commentsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commentsList);
  }

  @override
  String toString() {
    return 'CommentsState<$T>.commentsSuccess(commentsList: $commentsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentsSuccessImpl<T> &&
            const DeepCollectionEquality()
                .equals(other._commentsList, _commentsList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_commentsList));

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentsSuccessImplCopyWith<T, _$CommentsSuccessImpl<T>> get copyWith =>
      __$$CommentsSuccessImplCopyWithImpl<T, _$CommentsSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() commentsLoading,
    required TResult Function(List<CommentModel> commentsList) commentsSuccess,
    required TResult Function(ApiErrorModel error) commentsError,
  }) {
    return commentsSuccess(commentsList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? commentsLoading,
    TResult? Function(List<CommentModel> commentsList)? commentsSuccess,
    TResult? Function(ApiErrorModel error)? commentsError,
  }) {
    return commentsSuccess?.call(commentsList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? commentsLoading,
    TResult Function(List<CommentModel> commentsList)? commentsSuccess,
    TResult Function(ApiErrorModel error)? commentsError,
    required TResult orElse(),
  }) {
    if (commentsSuccess != null) {
      return commentsSuccess(commentsList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(CommentsLoading<T> value) commentsLoading,
    required TResult Function(CommentsSuccess<T> value) commentsSuccess,
    required TResult Function(CommentsError<T> value) commentsError,
  }) {
    return commentsSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(CommentsLoading<T> value)? commentsLoading,
    TResult? Function(CommentsSuccess<T> value)? commentsSuccess,
    TResult? Function(CommentsError<T> value)? commentsError,
  }) {
    return commentsSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(CommentsLoading<T> value)? commentsLoading,
    TResult Function(CommentsSuccess<T> value)? commentsSuccess,
    TResult Function(CommentsError<T> value)? commentsError,
    required TResult orElse(),
  }) {
    if (commentsSuccess != null) {
      return commentsSuccess(this);
    }
    return orElse();
  }
}

abstract class CommentsSuccess<T> implements CommentsState<T> {
  const factory CommentsSuccess(final List<CommentModel> commentsList) =
      _$CommentsSuccessImpl<T>;

  List<CommentModel> get commentsList;

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentsSuccessImplCopyWith<T, _$CommentsSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CommentsErrorImplCopyWith<T, $Res> {
  factory _$$CommentsErrorImplCopyWith(_$CommentsErrorImpl<T> value,
          $Res Function(_$CommentsErrorImpl<T>) then) =
      __$$CommentsErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({ApiErrorModel error});
}

/// @nodoc
class __$$CommentsErrorImplCopyWithImpl<T, $Res>
    extends _$CommentsStateCopyWithImpl<T, $Res, _$CommentsErrorImpl<T>>
    implements _$$CommentsErrorImplCopyWith<T, $Res> {
  __$$CommentsErrorImplCopyWithImpl(_$CommentsErrorImpl<T> _value,
      $Res Function(_$CommentsErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$CommentsErrorImpl<T>(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc

class _$CommentsErrorImpl<T> implements CommentsError<T> {
  const _$CommentsErrorImpl({required this.error});

  @override
  final ApiErrorModel error;

  @override
  String toString() {
    return 'CommentsState<$T>.commentsError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentsErrorImpl<T> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentsErrorImplCopyWith<T, _$CommentsErrorImpl<T>> get copyWith =>
      __$$CommentsErrorImplCopyWithImpl<T, _$CommentsErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() commentsLoading,
    required TResult Function(List<CommentModel> commentsList) commentsSuccess,
    required TResult Function(ApiErrorModel error) commentsError,
  }) {
    return commentsError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? commentsLoading,
    TResult? Function(List<CommentModel> commentsList)? commentsSuccess,
    TResult? Function(ApiErrorModel error)? commentsError,
  }) {
    return commentsError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? commentsLoading,
    TResult Function(List<CommentModel> commentsList)? commentsSuccess,
    TResult Function(ApiErrorModel error)? commentsError,
    required TResult orElse(),
  }) {
    if (commentsError != null) {
      return commentsError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(CommentsLoading<T> value) commentsLoading,
    required TResult Function(CommentsSuccess<T> value) commentsSuccess,
    required TResult Function(CommentsError<T> value) commentsError,
  }) {
    return commentsError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(CommentsLoading<T> value)? commentsLoading,
    TResult? Function(CommentsSuccess<T> value)? commentsSuccess,
    TResult? Function(CommentsError<T> value)? commentsError,
  }) {
    return commentsError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(CommentsLoading<T> value)? commentsLoading,
    TResult Function(CommentsSuccess<T> value)? commentsSuccess,
    TResult Function(CommentsError<T> value)? commentsError,
    required TResult orElse(),
  }) {
    if (commentsError != null) {
      return commentsError(this);
    }
    return orElse();
  }
}

abstract class CommentsError<T> implements CommentsState<T> {
  const factory CommentsError({required final ApiErrorModel error}) =
      _$CommentsErrorImpl<T>;

  ApiErrorModel get error;

  /// Create a copy of CommentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentsErrorImplCopyWith<T, _$CommentsErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
