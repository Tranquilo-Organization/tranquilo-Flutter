import 'package:flutter/material.dart';
import '../../../../../core/helpers/spacing.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/widgets/app_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/features/auth/sign_up/ui/widgets/sign_up_form.dart';
import 'package:tranquilo_app/features/auth/sign_up/ui/widgets/terms_and_condition.dart';
import 'package:tranquilo_app/features/auth/sign_up/logic/providers/sign_up_api_provider.dart';
import 'package:tranquilo_app/features/auth/sign_up/logic/providers/sign_up_form_provider.dart';


class SignUpFormWithButton extends ConsumerStatefulWidget {
  const SignUpFormWithButton({super.key});

  @override
  ConsumerState<SignUpFormWithButton> createState() => _SignUpFormWithButtonState();
}

class _SignUpFormWithButtonState extends ConsumerState<SignUpFormWithButton> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  
  bool _isTermsValid = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    final isTermsAccepted = ref.read(signUpFormProvider).isTermsAccepted;
    
    setState(() {
      _isTermsValid = isTermsAccepted;
    });

    if (_formKey.currentState!.validate() && isTermsAccepted) {
      ref.read(signUpProvider.notifier).signUp(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SignUpForm(
          formKey: _formKey,
          nameController: _nameController,
          emailController: _emailController,
          passwordController: _passwordController,
          confirmPasswordController: _confirmPasswordController,
        ),
        verticalSpace(6),
        const TermsAndCondition(),
        if (!_isTermsValid)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'You must agree to the Terms & Conditions',
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
          ),
        verticalSpace(16),
        AppTextButton(
          onPressed: _submitForm,
          textButton: 'Sign Up',
        ),
      ],
    );
  }
}