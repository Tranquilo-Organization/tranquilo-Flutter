import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import '../../../../../core/theming/colors_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/features/auth/sign_up/logic/providers/sign_up_form_provider.dart';

class TermsAndCondition extends ConsumerWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChecked = ref.watch(
      signUpFormProvider.select((state) => state.isTermsAccepted),
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Checkbox(
            activeColor: ColorsManager.oceanBlue,
            checkColor: Colors.white,
            value: isChecked,
            onChanged: (bool? value) {
              ref
                  .read(signUpFormProvider.notifier)
                  .updateTermsAcceptance(value ?? false);
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
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
