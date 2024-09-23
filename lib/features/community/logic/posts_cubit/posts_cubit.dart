import '../../data/repos/post_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tranquilo_app/core/network/api_error_model.dart';
import 'package:tranquilo_app/features/community/data/models/post_models/post_response.dart';
import 'package:tranquilo_app/features/community/data/models/post_models/create_post_request_model.dart';
import 'package:tranquilo_app/features/community/data/models/post_models/create_post_response_model.dart';

part 'posts_state.dart';
part 'posts_cubit.freezed.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostRepo _postRepo;

  PostsCubit(this._postRepo) : super(const PostsState.initial());

  Future<void> fetchPosts() async {
    emit(const PostsState.postsLoading());

    final result = await _postRepo.getPost();

    result.when(
      success: (data) {
        final List<Post> result = data.result.reversed.toList();
        emit(PostsState.postsSuccess(result));
      },
      failure: (error) {
        emit(PostsState.postsError(error: error.apiErrorModel));
      },
    );
  }

  Future<void> createPost(CreatePostRequestModel createPostRequestModel) async {
    emit(const PostsState.createPostLoading());

    final result = await _postRepo.createCommunityPost(createPostRequestModel);

    result.when(
      success: (response) {
        emit(PostsState.createPostSuccess(response));
      },
      failure: (error) {
        print('Create post error: ${error.apiErrorModel}');
        emit(PostsState.createPostError(error: error.apiErrorModel));
      },
    );
  }
}
