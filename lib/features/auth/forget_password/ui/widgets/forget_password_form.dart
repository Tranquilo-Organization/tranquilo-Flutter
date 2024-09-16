import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tranquilo_app/core/widgets/app_text_button.dart';
import '../../../../../core/helpers/app_validation.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final String email = _emailController.text;
      print('Email: $email');
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
              'Email',
              style: TextStyles.font16JetBlackMedium,
            ),
          ),
          verticalSpace(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: AppTextFormField(
              controller: _emailController,
              hintText: 'Email',
              prefixIcon: SvgPicture.asset(
                'assets/svgs/email_icon.svg',
                height: 22,
                width: 22,
              ),
              validator: validateEmail,
              onSaved: (value) {},
            ),
          ),
          verticalSpace(167),
          AppTextButton(
            onPressed: _submitForm,
            textButton: 'Continue',
          ),
        ],
      ),
    );
  }
}
