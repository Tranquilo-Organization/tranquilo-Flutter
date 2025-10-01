import 'package:flutter/foundation.dart';

@immutable
class SignUpFormState {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final bool isTermsAccepted;

  const SignUpFormState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.isTermsAccepted = false,
  });

  SignUpFormState copyWith({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    bool? isTermsAccepted,
  }) {
    return SignUpFormState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isTermsAccepted: isTermsAccepted ?? this.isTermsAccepted,
    );
  }

  /// Computed property for form validation
  bool get isValid =>
      name.isNotEmpty &&
      email.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      isTermsAccepted;
}
