import 'package:tranquilo_app/core/di/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tranquilo_app/features/profile/data/model/profile_response_model.dart';


/// AsyncNotifier for user profile data
/// Why AsyncNotifierProvider: Handles async profile fetching with loading/error states
class UserProfileNotifier extends AsyncNotifier<ProfileResponseModel?> {
  @override
  Future<ProfileResponseModel?> build() async {
    // Don't auto-fetch on build, let screens trigger it
    return null;
  }

  Future<void> fetchUserProfile() async {
    state = const AsyncValue.loading();

    final repo = ref.read(userProfileRepoProvider);

    state = await AsyncValue.guard(() async {
      final result = await repo.fetchUserProfile();

      return result.when(
        success: (profile) => profile,
        failure: (error) {
          throw error.apiErrorModel.message ?? 'Failed to fetch profile';
        },
      );
    });
  }

  void reset() {
    state = const AsyncValue.data(null);
  }
}

/// Provider for user profile
final userProfileProvider =
    AsyncNotifierProvider<UserProfileNotifier, ProfileResponseModel?>(() {
  return UserProfileNotifier();
});
