import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tranquilo_app/core/helpers/app_validation.dart';
import 'package:tranquilo_app/core/helpers/show_dialog.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors_manger.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final String newPassword = _newPasswordController.text;
      final String confirmPassword = _confirmPasswordController.text;
      showSuccessDialog(context);

    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              'New Password',
              style: TextStyles.font16JetBlackMedium,
            ),
          ),
          verticalSpace(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: AppTextFormField(
              controller: _newPasswordController,
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
          ),
          verticalSpace(25),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              'New Password',
              style: TextStyles.font16JetBlackMedium,
            ),
          ),
          verticalSpace(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: AppTextFormField(
              controller: _confirmPasswordController,
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
                  validateConfirmPassword(value,_newPasswordController.text),
              onSaved: (value) {},
            ),
          ),
          verticalSpace(68),
          AppTextButton(
            onPressed: _submitForm,
            textButton: 'Confirm',
          ),
        ],
      ),
    );
  }
}
