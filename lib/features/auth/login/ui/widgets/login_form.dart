import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/helpers/app_regex.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import '../../../../../core/theming/colors_manger.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class LoginForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            AppTextFormField(
              controller: widget.emailController,
              hintText: 'Email',
              prefixIcon: SvgPicture.asset(
                'assets/svgs/email_icon.svg',
                height: 22,
                width: 22,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!AppRegex.isEmailValid(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            verticalSpace(24),
            AppTextFormField(
              controller: widget.passwordController,
              hintText: 'Password',
              isObscureText: _isPasswordHidden,
              prefixIcon: SvgPicture.asset(
                'assets/svgs/lock.svg',
                height: 22,
                width: 22,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordHidden
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
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
                  return 'Password must be at least 8 characters long, include:\nan upper case letter, a number, and a special character';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            verticalSpace(10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  context.pushNamed(Routes.forgetPasswordScreen);
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyles.font12JetBlackMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

