import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import '../../../../../core/theming/colors_manger.dart';

class TermsAndCondition extends StatefulWidget {
  final Function(bool) onChanged;

  const TermsAndCondition({super.key, required this.onChanged});

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Checkbox(
            activeColor: ColorsManager.oceanBlue,
            checkColor: Colors.white,
            value: _isChecked,
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value ?? false;
              });
              widget.onChanged(_isChecked);
            },
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'I agree to ',
                  style: TextStyles.font14JetBlackRegular,
                ),
                TextSpan(
                  text: 'Terms & Conditions',
                  style: TextStyles.font14OceanBlueMedium,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
