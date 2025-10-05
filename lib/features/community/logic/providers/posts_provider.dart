import 'package:flutter_riverpod/legacy.dart';
import 'package:tranquilo_app/core/di/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tranquilo_app/features/community/data/models/post_models/post_response.dart';
import 'package:tranquilo_app/features/community/data/models/post_models/create_post_request_model.dart';
import 'package:tranquilo_app/features/community/data/models/post_models/create_post_response_model.dart';

/// AsyncNotifier for fetching posts
/// Why AsyncNotifierProvider: Handles async data with loading/error states
class PostsNotifier extends AsyncNotifier<List<Post>> {
  @override
  Future<List<Post>> build() async {
    return await _fetchPosts();
  }

  Future<List<Post>> _fetchPosts() async {
    final repo = ref.read(postRepoProvider);
    final result = await repo.getPost();

    return result.when(
      success: (data) => data.result.reversed.toList(),
      failure: (error) =>
          throw error.apiErrorModel.message ?? 'Failed to fetch posts',
    );
  }

  /// Refresh posts manually
  Future<void> refreshPosts() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchPosts());
  }
}

/// Provider for posts list
final postsProvider = AsyncNotifierProvider<PostsNotifier, List<Post>>(() {
  return PostsNotifier();
});

/// StateNotifier for create post operation
/// Why separate: Create operation is independent of fetching posts
class CreatePostNotifier
    extends StateNotifier<AsyncValue<CreatePostResponseModel?>> {
  final Ref ref;

  CreatePostNotifier(this.ref) : super(const AsyncValue.data(null));

  Future<void> createPost(CreatePostRequestModel requestModel) async {
    state = const AsyncValue.loading();

    final repo = ref.read(postRepoProvider);

    state = await AsyncValue.guard(() async {
      final result = await repo.createCommunityPost(requestModel);

      return result.when(
        success: (response) {
          // Refresh posts list after creation
          ref.read(postsProvider.notifier).refreshPosts();
          return response;
        },
        failure: (error) {
          throw error.apiErrorModel.message ?? 'Failed to create post';
        },
      );
    });
  }

  void reset() {
    state = const AsyncValue.data(null);
  }
}

/// Provider for create post operation
final createPostProvider = StateNotifierProvider<CreatePostNotifier,
    AsyncValue<CreatePostResponseModel?>>((ref) {
  return CreatePostNotifier(ref);
});
