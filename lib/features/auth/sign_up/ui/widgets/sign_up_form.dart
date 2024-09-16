import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/widgets/app_text_form_field.dart';

import '../../../../../core/helpers/app_validation.dart';
import '../../../../../core/theming/colors_manger.dart';

class SignUpForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const SignUpForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;

  void togglePasswordVisibility() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  void toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordHidden = !_isConfirmPasswordHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Full Name',
              style: TextStyles.font16JetBlackMedium,
            ),
            verticalSpace(10),
            AppTextFormField(
              controller: widget.nameController,
              hintText: 'Name',
              prefixIcon: SvgPicture.asset(
                'assets/svgs/person.svg',
                height: 22,
                width: 22,
              ),
              validator: validateName,
              onSaved: (value) {},
            ),
            verticalSpace(12),
            Text(
              'Email',
              style: TextStyles.font16JetBlackMedium,
            ),
            verticalSpace(10),
            AppTextFormField(
              controller: widget.emailController,
              hintText: 'Email',
              prefixIcon: SvgPicture.asset(
                'assets/svgs/email_icon.svg',
                height: 22,
                width: 22,
              ),
              validator: validateEmail,
              onSaved: (value) {},
            ),
            verticalSpace(12),
            Text(
              'Password',
              style: TextStyles.font16JetBlackMedium,
            ),
            verticalSpace(10),
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
                onPressed: togglePasswordVisibility,
              ),
              validator: validatePassword,
              onSaved: (value) {},
            ),
            verticalSpace(12),
            Text(
              'Confirm Password',
              style: TextStyles.font16JetBlackMedium,
            ),
            verticalSpace(10),
            AppTextFormField(
              controller: widget.confirmPasswordController,
              hintText: 'Confirm Password',
              isObscureText: _isConfirmPasswordHidden,
              prefixIcon: SvgPicture.asset(
                'assets/svgs/lock.svg',
                height: 22,
                width: 22,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _isConfirmPasswordHidden
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: ColorsManager.lightSilver,
                ),
                onPressed: toggleConfirmPasswordVisibility,
              ),
              validator: (value) =>
                  validateConfirmPassword(value, widget.passwordController.text),
              onSaved: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
