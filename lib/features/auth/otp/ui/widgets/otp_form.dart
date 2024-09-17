import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_button.dart';
import 'otp_text_field.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _nextField({required String value, required int index}) {
    if (value.length == 1 && index < 5) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }
  }

  void _verifyOtp() {
    bool isValid = true;
    for (var controller in _controllers) {
      if (controller.text.length != 1) {
        isValid = false;
        break;
      }
    }
    if (isValid) {
      context.pushNamed(Routes.resetPasswordScreen);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorsManager.oceanBlue,
          content: Text(
            textAlign: TextAlign.center,
            'Please enter OTP Code',
            style: TextStyles.font16WhiteSemiBold.copyWith(fontSize: 14),
          ),
        ),
      );
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
              'OTP Code',
              style: TextStyles.font16JetBlackMedium,
            ),
          ),
          verticalSpace(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return OtpTextField(
                  index: index,
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  onChanged: (value) => _nextField(value: value, index: index),
                );
              }),
            ),
          ),
          verticalSpace(167),
          AppTextButton(
            onPressed: _verifyOtp,
            textButton: 'Verify',
          ),
        ],
      ),
    );
  }
}
