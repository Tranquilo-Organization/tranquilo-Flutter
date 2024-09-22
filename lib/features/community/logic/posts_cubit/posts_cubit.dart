import '../../data/repo/post_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tranquilo_app/core/network/api_error_model.dart';
import 'package:tranquilo_app/features/community/data/model/post_response.dart';
import 'package:tranquilo_app/features/community/data/model/create_post_response_model.dart';

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
        emit(PostsState.postsSuccess(data.result));
      },
      failure: (error) {
        emit(PostsState.postsError(error: error.apiErrorModel));
      },
    );
  }
}
