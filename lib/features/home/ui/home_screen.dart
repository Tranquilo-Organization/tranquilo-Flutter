import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/di/dependency_injection.dart';
import 'package:tranquilo_app/features/home/logic/routine_cubit.dart';
import 'package:tranquilo_app/features/home/logic/routine_state.dart';
import 'package:tranquilo_app/features/home/ui/widgets/today_feelings.dart';
import 'package:tranquilo_app/features/home/ui/widgets/welcome_list_tile.dart';
import 'package:tranquilo_app/features/home/data/model/routine_response_model.dart';
import 'package:tranquilo_app/features/home/ui/widgets/carousel_slider_containers.dart';
import 'package:tranquilo_app/features/home/ui/widgets/personalized_routines_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(20),
                const WelcomeListTile(),
                verticalSpace(24),
                const CarouselSliderContainers(),
                verticalSpace(24),
                const TodayFeelings(),
                verticalSpace(17),
                const PersonalizedRoutinesSection()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
