import 'package:flutter/material.dart';

import '../theming/colors_manger.dart';

class SwitchWidget extends StatelessWidget {
  final bool value;
  final void Function(bool) onChanged;
  const SwitchWidget({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeColor: ColorsManager.white,
      activeTrackColor: ColorsManager.oceanBlue,
      inactiveThumbColor: ColorsManager.white,
      inactiveTrackColor: ColorsManager.inActiveSwitch,
      trackOutlineColor:
          const WidgetStatePropertyAll<Color>(ColorsManager.inActiveSwitch),
    );
  }
}
