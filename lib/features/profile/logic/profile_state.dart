import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tranquilo_app/core/network/api_error_model.dart';
import 'package:tranquilo_app/features/profile/data/model/profile_response_model.dart';

part 'profile_state.freezed.dart';

@freezed
class UserProfileState with _$UserProfileState {
  const factory UserProfileState.initial() = _Initial;
  const factory UserProfileState.loading() = _Loading;
  const factory UserProfileState.success(ProfileResponseModel profile) =
      _Success;
  const factory UserProfileState.deleteSuccess() = DeleteSuccess;
  const factory UserProfileState.failure(ApiErrorModel error) = Failure;
}

