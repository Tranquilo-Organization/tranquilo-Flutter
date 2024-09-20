class ApiConstants {
  static const String apiBaseUrl =
      "http://tranquiloapplication.runasp.net/api/";
  static const String chatbotApiUrl =
      "https://tranquilo-chatbot-production.up.railway.app/";

  static const String login = "account/login";
  static const String signUp = "account/register";
  static const String forgetPassword = "account/forgot-password";
  static const String verifyOtp = "account/verify-otp";
  static const String resetPassword = "account/reset-password";
  static const String chatbot = "chatbot";
  static const String communityPosts = "Post";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
