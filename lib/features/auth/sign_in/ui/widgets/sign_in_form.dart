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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordHidden = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: emailController, // Attach controller to the field
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
            }, onSaved: (value) {  },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: passwordController, // Attach controller to the field
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
            }, onSaved: (value) {  },
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
      // Use the controllers to access the input values
      final String email = emailController.text;
      final String password = passwordController.text;

      print('Email: $email');
      print('Password: $password');
    }
  }
}
