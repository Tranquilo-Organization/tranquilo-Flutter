import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/spacing.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/notifications/notification_helper.dart';


class CongratsDialog extends StatelessWidget {
  final String routineType;

  const CongratsDialog({
    super.key,
    required this.routineType,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          verticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svgs/congrats.svg'),
              horizontalSpace(6),
              Text(
                'Congratulations',
                textAlign: TextAlign.center,
                style: TextStyles.font16WhiteSemiBold.copyWith(
                  color: ColorsManager.oceanBlue,
                ),
              ),
            ],
          ),
          verticalSpace(16),
          Text(
            '"Well done! You\'ve completed your\nroutine and made progress today!"',
            style: TextStyles.font14JetBlackMedium,
            textAlign: TextAlign.center,
          ),
          verticalSpace(13),
          const Divider(),
          TextButton(
            onPressed: () async {
              await NotificationHelper.notifyRoutineCompletion(routineType);
              if (Navigator.of(context).canPop()) {
                context.pop();
              }
            },
            child: Text(
              'Ok',
              style: TextStyles.font16WhiteSemiBold.copyWith(
                color: ColorsManager.oceanBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showCongratsDialog(BuildContext context, String routineType) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CongratsDialog(routineType: routineType);
    },
  );
}
