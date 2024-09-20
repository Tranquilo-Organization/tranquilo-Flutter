import 'package:tranquilo_app/core/network/api_error_handler.dart';
import 'package:tranquilo_app/core/network/api_result.dart';
import 'package:tranquilo_app/core/network/api_service.dart';
import 'package:tranquilo_app/features/community/data/model/post_response.dart';

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
}
