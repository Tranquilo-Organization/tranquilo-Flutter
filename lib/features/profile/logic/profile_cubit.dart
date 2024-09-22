import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/features/profile/logic/profile_state.dart';
import 'package:tranquilo_app/features/profile/data/repo/profile_repo.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  final UserProfileRepo _userProfileRepo;

  UserProfileCubit(this._userProfileRepo)
      : super(const UserProfileState.initial());

  Future<void> fetchUserProfile() async {
    emit(const UserProfileState.loading());

    final result = await _userProfileRepo.fetchUserProfile();

    result.when(
      success: (profile) {
        emit(UserProfileState.success(profile));
      },
      failure: (error) {
        emit(UserProfileState.failure(error.apiErrorModel));
      },
    );
  }

  Future<void> deleteUserProfile() async {
    emit(const UserProfileState.loading());

    final result = await _userProfileRepo.deleteUserProfile();

    result.when(
      success: (_) {
        emit(const UserProfileState.deleteSuccess());
      },
      failure: (error) {
        emit(UserProfileState.failure(error.apiErrorModel));
      },
    );
  }
}

