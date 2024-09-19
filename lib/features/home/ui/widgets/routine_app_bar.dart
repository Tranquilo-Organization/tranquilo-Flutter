import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/styles.dart';

class RoutineAppBar extends StatelessWidget {
  final String titleAppBar;
  const RoutineAppBar({super.key, required this.titleAppBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManager.white,
      leading: GestureDetector(
        onTap: (){
          context.pop();
        },
        child: const Icon(
          CupertinoIcons.back,
          size: 32,
          color: ColorsManager.oceanBlue,
        ),
      ),
      title: Text(
        titleAppBar,
        style: TextStyles.font20OceanBlueSemiBold,
      ),
    );
  }
}
