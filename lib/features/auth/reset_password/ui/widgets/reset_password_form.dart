import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/core/helpers/show_dialog.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/helpers/app_validation.dart';
import 'package:tranquilo_app/core/widgets/app_text_button.dart';
import 'package:tranquilo_app/core/widgets/app_text_form_field.dart';
import 'package:tranquilo_app/features/auth/reset_password/logic/reset_password_cubit.dart';
import 'package:tranquilo_app/features/auth/reset_password/logic/reset_password_state.dart';
import 'package:tranquilo_app/features/auth/reset_password/data/models/reset_password_request_model.dart';

class ResetPasswordForm extends StatefulWidget {
  final String email;
  final String otp;

  const ResetPasswordForm({super.key, required this.email, required this.otp});

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
      final String email = widget.email;
      final String otp = widget.otp;

      final requestModel = ResetPasswordRequestModel(
        email: email,
        otp: otp,
        password: newPassword,
        confirmPassword: confirmPassword,
      );
      context.read<ResetPasswordCubit>().resetPassword(requestModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          showSuccessDialog(context);
        } else if (state is ResetPasswordError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to reset password: ${state.error}')),
          );
        }
      },
      builder: (context, state) {
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
                  'Confirm Password',
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
                  validator: (value) => validateConfirmPassword(
                      value, _newPasswordController.text),
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
      },
    );
  }
}
