import 'package:tranquilo_app/core/network/api_result.dart';
import 'package:tranquilo_app/core/network/api_service.dart';
import 'package:tranquilo_app/core/network/api_error_handler.dart';
import 'package:tranquilo_app/features/community/data/models/post_models/post_response.dart';
import 'package:tranquilo_app/features/community/data/models/post_models/create_post_request_model.dart';
import 'package:tranquilo_app/features/community/data/models/post_models/create_post_response_model.dart';

class PostRepo {
  final ApiService _apiService;

  PostRepo(this._apiService);

  Future<ApiResult<GetPostsResponseBody>> getPost() async {
    try {
      final response = await _apiService.communityPosts();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CreatePostResponseModel>> createCommunityPost(
      CreatePostRequestModel createPostRequestModel) async {
    try {
      final response =
          await _apiService.createCommunityPost(createPostRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
