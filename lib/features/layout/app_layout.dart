import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/dependency_injection.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import '../community/logic/posts_cubit/posts_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/features/home/ui/home_screen.dart';
import 'package:tranquilo_app/features/home/logic/routine_cubit.dart';
import 'package:tranquilo_app/features/chatbot/ui/chatbot_screen.dart';
import 'package:tranquilo_app/features/profile/logic/profile_cubit.dart';
import 'package:tranquilo_app/features/dashboard/ui/dashboard_screen.dart';
import 'package:tranquilo_app/features/profile/ui/screens/profile_screen.dart';
import 'package:tranquilo_app/features/community/ui/screens/community_post_screen.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int selectedIndex = 0;
  List<Widget> screens = [
    BlocProvider(
      create: (context) => getIt<RoutineCubit>()..fetchRoutines(),
      child: const HomeScreen(),
    ),
    const ChatbotScreen(),
    const DashboardScreen(),
    BlocProvider.value(
      value: getIt<PostsCubit>()..fetchPosts(),
      child: const CommunityPostScreen(),
    ),
    BlocProvider(
      create: (context) => getIt<UserProfileCubit>()..fetchUserProfile(),
      child: const ProfileScreen(),
    ),
  ];
  PageController pageController = PageController();

  void onItemTapped(int index) {
    pageController.jumpToPage(index);
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: screens,
        ),
      ),
      bottomNavigationBar: Container(
        height: 90.h,
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 8,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: ColorsManager.oceanBlue,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyles.font12OceanBlueSemiBold,
          onTap: onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svgs/home.svg',
                colorFilter: ColorFilter.mode(
                  selectedIndex == 0 ? ColorsManager.oceanBlue : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svgs/chatbot.svg',
                colorFilter: ColorFilter.mode(
                  selectedIndex == 1 ? ColorsManager.oceanBlue : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Chatbot',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svgs/dashboard.svg',
                colorFilter: ColorFilter.mode(
                  selectedIndex == 2 ? ColorsManager.oceanBlue : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svgs/community_icon.svg',
                colorFilter: ColorFilter.mode(
                  selectedIndex == 3 ? ColorsManager.oceanBlue : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Community',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svgs/profile.svg',
                colorFilter: ColorFilter.mode(
                  selectedIndex == 4 ? ColorsManager.oceanBlue : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
