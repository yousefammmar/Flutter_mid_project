import '../regex/validation_regex.dart';

bool isValidEmail(String email) {
  return ValidationRegex.email.hasMatch(email);
}

bool isValidPassword(String password) {
  return ValidationRegex.password.hasMatch(password);
}

String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your email';
  }

  if (!isValidEmail(value.trim())) {
    return 'Please enter a valid email';
  }

  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your password';
  }

  if (!isValidPassword(value)) {
    return 'Password must be at least 8 characters';
  }

  return null;
}