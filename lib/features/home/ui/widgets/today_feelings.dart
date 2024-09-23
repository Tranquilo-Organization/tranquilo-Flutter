import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'emoji_container.dart';

class TodayFeelings extends StatefulWidget {
  const TodayFeelings({super.key});

  @override
  State<TodayFeelings> createState() => _TodayFeelingsState();
}

class _TodayFeelingsState extends State<TodayFeelings> {
  int? _selectedEmojiIndex;

  void _onEmojiSelected(int index) {
    setState(() {
      _selectedEmojiIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'How are you today?',
          textAlign: TextAlign.start,
          style: TextStyles.font16WhiteSemiBold.copyWith(
            color: ColorsManager.black,
          ),
        ),
        verticalSpace(17),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            EmojiContainer(
              borderColor: const Color(0xffD80101),
              inactiveEmoji: 'assets/svgs/red_angry.svg',
              activeEmoji: 'assets/svgs/white_angry.svg',
              isSelected: _selectedEmojiIndex == 0,
              onTap: () => _onEmojiSelected(0),
            ),
            EmojiContainer(
              borderColor: const Color(0xffFFCD63),
              inactiveEmoji: 'assets/svgs/yellow_happy.svg',
              activeEmoji: 'assets/svgs/white_happy.svg',
              isSelected: _selectedEmojiIndex == 1,
              onTap: () => _onEmojiSelected(1),
            ),
            EmojiContainer(
              borderColor: const Color(0xffF9AEAB),
              inactiveEmoji: 'assets/svgs/pink_love.svg',
              activeEmoji: 'assets/svgs/white_love.svg',
              isSelected: _selectedEmojiIndex == 2,
              onTap: () => _onEmojiSelected(2),
            ),
            EmojiContainer(
              borderColor: const Color(0xffD9D9D9),
              inactiveEmoji: 'assets/svgs/grey_sad.svg',
              activeEmoji: 'assets/svgs/white_sad.svg',
              isSelected: _selectedEmojiIndex == 3,
              onTap: () => _onEmojiSelected(3),
            ),
            EmojiContainer(
              borderColor: const Color(0xffF2A441),
              inactiveEmoji: 'assets/svgs/orange_shock.svg',
              activeEmoji: 'assets/svgs/white_shock.svg',
              isSelected: _selectedEmojiIndex == 4,
              onTap: () => _onEmojiSelected(4),
            ),
          ],
        ),
      ],
    );
  }
}
