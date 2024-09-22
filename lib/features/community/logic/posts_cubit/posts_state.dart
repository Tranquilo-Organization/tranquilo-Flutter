part of 'posts_cubit.dart';

@freezed
class PostsState<T> with _$PostsState<T> {
  const factory PostsState.initial() = _Initial;

  const factory PostsState.postsLoading() = PostsLoading;
  const factory PostsState.postsSuccess(List<Post> postsList) = PostsSuccess<T>;
  const factory PostsState.postsError({required ApiErrorModel error}) =
      PostsError;

  const factory PostsState.createPostLoading() = CreatePostLoading;
  const factory PostsState.createPostSuccess(CreatePostResponseModel response) =
      CreatePostSuccess;
  const factory PostsState.createPostError({required ApiErrorModel error}) =
      CreatePostError;
}
