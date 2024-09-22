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

  CommentsCubit(this._commentRepo) : super(const CommentsState.initial());

  /// Fetch comments from the repository
  Future<void> fetchComments() async {
    emit(const CommentsState.commentsLoading());

    final result = await _commentRepo.getComments();

    result.when(
      success: (data) {
        emit(CommentsState.commentsSuccess(data.model));
      },
      failure: (error) {
        emit(CommentsState.commentsError(error: error.apiErrorModel));
      },
    );
  }

  /// Create a new comment
  Future<void> createComment(CreateCommentRequestModel requestModel) async {
    emit(const CommentsState.createCommentLoading());

    final result = await _commentRepo.createComment(requestModel);

    result.when(
      success: (data) {
        emit(CommentsState.createCommentSuccess(data));
      },
      failure: (error) {
        emit(CommentsState.createCommentError(error: error.apiErrorModel));
      },
    );
  }
}
