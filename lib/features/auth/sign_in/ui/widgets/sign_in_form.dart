import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/helpers/app_regex.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/widgets/app_form_field.dart';


class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isPasswordHidden = true;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset('assets/images/email_icon.png', height: 24, width: 24),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              } else if (!AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
            onSaved: (value) => email = value,
          ),
          verticalSpace(16),
          AppTextFormField(
            hintText: 'Password',
            isObscureText: _isPasswordHidden,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset('assets/images/lock.png', height: 24, width: 24),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordHidden ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                color: ColorsManager.lightSilver,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordHidden = !_isPasswordHidden;
                });
              },
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              } else if (!AppRegex.isPasswordValid(value)) {
                return 'Password must be at least 8 characters long, include an upper case letter, a number, and a special character';
              }
              return null;
            },
            onSaved: (value) => password = value,
          ),
          verticalSpace(8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // Handle forgot password
              },
              child: const Text(
                "Forgot Password?",
                style: TextStyle(
                  color: ColorsManager.oceanBlue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      print('Email: $email');
      print('Password: $password');
    }
  }
}
