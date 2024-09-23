import 'app_regex.dart';

String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Name is required';
  } else if (value.length < 2) {
    return 'Name must be at least 2 characters';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  } else if (!AppRegex.isEmailValid(value)) {
    return 'Enter a valid email';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  } else if (!AppRegex.isPasswordValid(value)) {
    return 'Password must contain at least 8 characters, '
        'including\n an uppercase letter, number, and special character';
  }
  return null;
}

String? validateConfirmPassword(String? value, String password) {
  if (value == null || value.isEmpty) {
    return 'Confirm your password';
  } else if (value != password) {
    return 'Passwords do not match';
  }
  return null;
}