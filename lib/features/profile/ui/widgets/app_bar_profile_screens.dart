import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';

import '../../../../core/theming/colors_manger.dart';
import '../../../../core/theming/styles.dart';

class AppBarProfileScreens extends StatelessWidget {
  final String titleAppBar;
  const AppBarProfileScreens({super.key, required this.titleAppBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: ColorsManager.white,
      leading: GestureDetector(
        onTap: (){
          context.pop();
        },
        child: const Icon(
          CupertinoIcons.back,
          size: 32,
          color: ColorsManager.jetBlack,
        ),
      ),
      title: Text(
        titleAppBar,
        style: TextStyles.font20JetBlackSemiBold,
      ),
    );
  }
}
