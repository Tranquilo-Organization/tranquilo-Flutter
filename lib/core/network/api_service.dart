import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tranquilo_app/core/network/api_constants.dart';
import 'package:tranquilo_app/features/home/data/model/routine_response_model.dart';
import 'package:tranquilo_app/features/auth/login/data/model/login_request_body.dart';
import 'package:tranquilo_app/features/auth/sign_up/data/model/sign_up_response.dart';
import 'package:tranquilo_app/features/chatbot/data/model/chatbot_request_model.dart';
import 'package:tranquilo_app/features/auth/login/data/model/login_response_body.dart';
import 'package:tranquilo_app/features/profile/data/model/profile_response_model.dart';
import 'package:tranquilo_app/features/auth/sign_up/data/model/sign_up_request_body.dart';
import 'package:tranquilo_app/features/auth/otp/data/models/verify_otp_request_model.dart';
import 'package:tranquilo_app/features/auth/otp/data/models/verify_otp_response_model.dart';
import 'package:tranquilo_app/features/community/data/models/post_models/post_response.dart';
import 'package:tranquilo_app/features/community/data/models/post_models/create_post_request_model.dart';
import 'package:tranquilo_app/features/community/data/models/post_models/create_post_response_model.dart';
import 'package:tranquilo_app/features/auth/reset_password/data/models/reset_password_request_model.dart';
import 'package:tranquilo_app/features/auth/forget_password/data/model/forget_password_request_model.dart';
import 'package:tranquilo_app/features/auth/reset_password/data/models/reset_password_response_model.dart';
import 'package:tranquilo_app/features/auth/forget_password/data/model/forget_password_response_model.dart';
import 'package:tranquilo_app/features/community/data/models/comment_models/get_comment_response_model.dart';
import 'package:tranquilo_app/features/community/data/models/comment_models/create_comment_request_model.dart';
import 'package:tranquilo_app/features/community/data/models/comment_models/create_comment_response_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // Authentication APIs
  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.signUp)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody signupRequestBody,
  );

  @POST(ApiConstants.forgetPassword)
  Future<ForgetPasswordResponseModel> forgetPassword(
    @Body() ForgetPasswordRequestModel forgetPasswordRequestModel,
  );

  @POST(ApiConstants.verifyOtp)
  Future<VerifyOtpResponseModel> verifyOtp(
    @Body() VerifyOtpRequestModel verifyOtpRequestModel,
  );

  @POST(ApiConstants.resetPassword)
  Future<ResetPasswordResponseModel> resetPassword(
    @Body() ResetPasswordRequestModel resetPasswordRequestModel,
  );

  @GET(ApiConstants.communityPosts)
  Future<GetPostsResponseBody> communityPosts();
  // Fetch routines by anxiety level id
  @GET("${ApiConstants.routine}/{id}")
  Future<RoutineResponseModel> fetchRoutinesByLevelId(@Path("id") int levelId);

  @POST(ApiConstants.communityPosts)
  Future<CreatePostResponseModel> createCommunityPost(
    @Body() CreatePostRequestModel createPostRequestModel,
  );

  @GET(ApiConstants.communityComments)
  Future<GetCommentResponseModel> communityCpmments();

  @POST(ApiConstants.communityComments)
  Future<CreateCommentResponseModel> createComment(
    @Body() CreateCommentRequestModel createCommentRequestModel,
  );

  @GET("${ApiConstants.profile}{email}")
  Future<ProfileResponseModel> fetchUserProfile(@Path("email") String email);

  @DELETE("${ApiConstants.profile}{email}")
  Future<void> deleteUserProfile(@Path("email") String email);
}
