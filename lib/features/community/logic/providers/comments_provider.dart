import 'package:flutter_riverpod/legacy.dart';
import 'package:tranquilo_app/core/di/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tranquilo_app/features/community/data/models/post_models/post_response.dart';
import 'package:tranquilo_app/features/community/data/models/comment_models/get_comment_response_model.dart';
import 'package:tranquilo_app/features/community/data/models/comment_models/create_comment_request_model.dart';
import 'package:tranquilo_app/features/community/data/models/comment_models/create_comment_response_model.dart';


/// Family provider to manage comments for specific posts
/// Why Family: Each post needs its own comments state
class CommentsNotifier extends AsyncNotifier<List<CommentModel>> {
  late Post post;

  @override
  Future<List<CommentModel>> build() async {
    return [];
  }

  void setPost(Post p) {
    post = p;
  }

  Future<void> fetchComments() async {
    state = const AsyncValue.loading();
    
    final repo = ref.read(commentRepoProvider);
    
    state = await AsyncValue.guard(() async {
      final result = await repo.getComments();

      return result.when(
        success: (data) => data.model.reversed.toList(),
        failure: (error) {
          throw error.apiErrorModel.message ?? 'Failed to fetch comments';
        },
      );
    });
  }
}

/// Provider for comments of a specific post
final commentsProvider = AsyncNotifierProvider<CommentsNotifier, List<CommentModel>>(() {
  return CommentsNotifier();
});

/// StateNotifier for create comment operation
class CreateCommentNotifier extends StateNotifier<AsyncValue<CreateCommentResponseModel?>> {
  final Ref ref;

  CreateCommentNotifier(this.ref) : super(const AsyncValue.data(null));

  Future<void> createComment(CreateCommentRequestModel requestModel) async {
    state = const AsyncValue.loading();

    final repo = ref.read(commentRepoProvider);
    
    state = await AsyncValue.guard(() async {
      final result = await repo.createComment(requestModel);

      return result.when(
        success: (data) {
          // Refresh comments after creation
          ref.read(commentsProvider.notifier).fetchComments();
          return data;
        },
        failure: (error) {
          throw error.apiErrorModel.message ?? 'Failed to create comment';
        },
      );
    });
  }

  void reset() {
    state = const AsyncValue.data(null);
  }
}

/// Provider for create comment operation
final createCommentProvider = StateNotifierProvider<CreateCommentNotifier, 
    AsyncValue<CreateCommentResponseModel?>>((ref) {
  return CreateCommentNotifier(ref);
});