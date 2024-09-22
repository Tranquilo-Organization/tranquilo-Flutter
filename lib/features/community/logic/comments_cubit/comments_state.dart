part of 'comments_cubit.dart';

@freezed
class CommentsState<T> with _$CommentsState<T> {
  const factory CommentsState.initial() = _Initial;

  const factory CommentsState.commentsLoading() = CommentsLoading;
  const factory CommentsState.commentsSuccess(List<CommentModel> commentsList) =
      CommentsSuccess<T>;
  const factory CommentsState.commentsError({required ApiErrorModel error}) =
      CommentsError;
}
