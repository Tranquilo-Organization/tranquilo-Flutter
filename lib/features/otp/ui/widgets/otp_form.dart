import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/features/otp/ui/widgets/otp_text_field.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_button.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());

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
            onPressed: () {
              if (_formKey.currentState!.validate()) {

              }
            },
            textButton: 'Verify',
          ),
        ],
      ),
    );
  }
}
