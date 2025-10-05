import 'package:flutter_riverpod/legacy.dart';
import 'package:tranquilo_app/core/di/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


/// StateNotifier for delete account operation
/// Why separate: Delete is a one-time action, separate from profile data
class DeleteAccountNotifier extends StateNotifier<AsyncValue<bool>> {
  final Ref ref;

  DeleteAccountNotifier(this.ref) : super(const AsyncValue.data(false));

  Future<void> deleteAccount() async {
    state = const AsyncValue.loading();

    final repo = ref.read(userProfileRepoProvider);

    state = await AsyncValue.guard(() async {
      final result = await repo.deleteUserProfile();

      return result.when(
        success: (_) => true,
        failure: (error) {
          throw error.apiErrorModel.message ?? 'Failed to delete account';
        },
      );
    });
  }

  void reset() {
    state = const AsyncValue.data(false);
  }
}

/// Provider for delete account operation
final deleteAccountProvider =
    StateNotifierProvider<DeleteAccountNotifier, AsyncValue<bool>>((ref) {
  return DeleteAccountNotifier(ref);
});
