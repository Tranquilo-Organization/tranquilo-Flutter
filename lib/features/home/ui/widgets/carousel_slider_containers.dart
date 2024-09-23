import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tranquilo_app/features/home/ui/widgets/support_container.dart';
import '../../../../../core/theming/styles.dart';

class CarouselSliderContainers extends StatelessWidget {
  const CarouselSliderContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        SupportContainer(
          containerContent: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  'You are not your anxiety.\nYou are capable, resilient,\nand in control of your\njourney.',
                  style: TextStyles.font14JetBlackRegular,
                ),
              ),
              SvgPicture.asset('assets/svgs/home_container_character.svg'),
            ],
          ),
        ),
        SupportContainer(
          containerContent: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/svgs/flowers.svg',
                fit: BoxFit.contain,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '"No need to hurry. No need to sparkle.\nNo need to be anybody but oneself."',
                    style: TextStyles.font14JetBlackMedium,
                  ),
                  Text(
                    'Virginia Woolf',
                    style: TextStyles.font12JetBlackMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
        SupportContainer(
          containerContent: Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 26.w),
                  child: SvgPicture.asset(
                    'assets/svgs/second_container_character.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 33.w),
                  child: Text(
                    "Every breath you take is\na step toward peace.\nYou've got this",
                    style: TextStyles.font14JetBlackMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      options: CarouselOptions(
        autoPlay: true,
        height: 135.h,
        enableInfiniteScroll: true,
        viewportFraction: 1,
      ),
    );
  }
}
