import 'package:tranquilo_app/features/community/data/models/post_models/post_response.dart';

import '../../data/repos/comment_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tranquilo_app/core/network/api_error_model.dart';
import 'package:tranquilo_app/features/community/data/models/comment_models/get_comment_response_model.dart';
import 'package:tranquilo_app/features/community/data/models/comment_models/create_comment_request_model.dart';
import 'package:tranquilo_app/features/community/data/models/comment_models/create_comment_response_model.dart';

part 'comments_state.dart';
part 'comments_cubit.freezed.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final CommentRepo _commentRepo;
  late Post post;
  CommentsCubit(this._commentRepo) : super(const CommentsState.initial());

  Future<void> fetchComments() async {
    emit(const CommentsState.commentsLoading());

    final result = await _commentRepo.getComments();

    result.when(
      success: (data) {
        List<CommentModel> comments = data.model.reversed.toList();
        emit(CommentsState.commentsSuccess(comments));
      },
      failure: (error) {
        emit(CommentsState.commentsError(error: error.apiErrorModel));
      },
    );
  }

  Future<void> createComment(CreateCommentRequestModel requestModel) async {
    emit(const CommentsState.createCommentLoading());

    final result = await _commentRepo.createComment(requestModel);

    result.when(
      success: (data) {
        fetchComments();
        emit(CommentsState.createCommentSuccess(data));
      },
      failure: (error) {
        emit(CommentsState.createCommentError(error: error.apiErrorModel));
      },
    );
  }
}
