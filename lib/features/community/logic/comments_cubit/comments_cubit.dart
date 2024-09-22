import '../../data/repos/comment_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tranquilo_app/core/network/api_error_model.dart';
import 'package:tranquilo_app/features/community/data/models/get_comment_response_model.dart';

part 'comments_state.dart';
part 'comments_cubit.freezed.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final CommentRepo _commentRepo;

  CommentsCubit(this._commentRepo) : super(const CommentsState.initial());

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
}