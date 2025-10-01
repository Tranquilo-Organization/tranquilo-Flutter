import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tranquilo_app/features/auth/sign_up/logic/models/sign_up_form_state.dart';

class SignUpFormNotifier extends StateNotifier<SignUpFormState> {
  SignUpFormNotifier() : super(const SignUpFormState());

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  void updateConfirmPassword(String confirmPassword) {
    state = state.copyWith(confirmPassword: confirmPassword);
  }

  void updateTermsAcceptance(bool isAccepted) {
    state = state.copyWith(isTermsAccepted: isAccepted);
  }

  void reset() {
    state = const SignUpFormState();
  }
}

/// Provider for sign-up form state management
final signUpFormProvider =
    StateNotifierProvider<SignUpFormNotifier, SignUpFormState>((ref) {
  return SignUpFormNotifier();
});

/// Computed provider for form validation
/// Separation: Derived state, read-only
final isFormValidProvider = Provider<bool>((ref) {
  final formState = ref.watch(signUpFormProvider);
  return formState.isValid;
});
