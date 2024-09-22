import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/otp/ui/otp_screen.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import '../../features/auth/login/ui/login_screen.dart';
import 'package:tranquilo_app/core/network/api_service.dart';
import 'package:tranquilo_app/features/layout/app_layout.dart';
import 'package:tranquilo_app/features/home/ui/home_screen.dart';
import 'package:tranquilo_app/core/di/dependency_injection.dart';
import 'package:tranquilo_app/features/home/ui/night_routine.dart';
import 'package:tranquilo_app/features/home/ui/morning_routine.dart';
import 'package:tranquilo_app/features/home/logic/routine_cubit.dart';
import 'package:tranquilo_app/features/survey/logic/survey_cubit.dart';
import 'package:tranquilo_app/features/home/ui/afternoon_routine.dart';
import 'package:tranquilo_app/features/profile/logic/profile_cubit.dart';
import 'package:tranquilo_app/features/home/data/repo/routine_repo.dart';
import 'package:tranquilo_app/features/home/ui/notifications_screen.dart';
import 'package:tranquilo_app/features/survey/data/repo/survey_repo.dart';
import 'package:tranquilo_app/features/onboarding/onboarding_screen.dart';
import 'package:tranquilo_app/features/profile/data/repo/profile_repo.dart';
import 'package:tranquilo_app/features/auth/sign_up/ui/sign_up_screen.dart';
import 'package:tranquilo_app/features/survey/ui/screens/survey_result.dart';
import 'package:tranquilo_app/features/survey/ui/screens/survey_screen.dart';
import 'package:tranquilo_app/features/auth/otp/logic/verify_otp_cubit.dart';
import 'package:tranquilo_app/features/survey/ui/screens/survey_starting.dart';
import 'package:tranquilo_app/features/profile/ui/screens/settings_screen.dart';
import 'package:tranquilo_app/features/survey/ui/screens/survey_completed.dart';
import 'package:tranquilo_app/features/profile/ui/screens/edit_profile_screen.dart';
import 'package:tranquilo_app/features/community/logic/posts_cubit/posts_cubit.dart';
import 'package:tranquilo_app/features/community/ui/screens/create_post_screen.dart';
import 'package:tranquilo_app/features/profile/ui/screens/privacy_policy_screen.dart';
import 'package:tranquilo_app/features/auth/login/logic/login_cubit/login_cubit.dart';
import 'package:tranquilo_app/features/community/ui/screens/community_post_screen.dart';
import 'package:tranquilo_app/features/auth/reset_password/ui/reset_password_screen.dart';
import 'package:tranquilo_app/features/survey/data/api/classification_model_api_call.dart';
import 'package:tranquilo_app/features/auth/reset_password/logic/reset_password_cubit.dart';
import 'package:tranquilo_app/features/auth/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:tranquilo_app/features/auth/forget_password/ui/forget_password_screen.dart';
import 'package:tranquilo_app/features/profile/ui/screens/notifications_settings_screen.dart';
import 'package:tranquilo_app/features/auth/reset_password/data/repo/reset_password_repo.dart';
import 'package:tranquilo_app/features/auth/forget_password/logic/forget_password_cubit/forget_password_cubit.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ForgetPasswordCubit>(),
            child: const ForgetPasswordScreen(),
          ),
        );
      case Routes.otpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<VerifyOtpCubit>(),
            child: const OtpScreen(),
          ),
        );
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ResetPasswordCubit(
              ResetPasswordRepo(getIt<ApiService>()),
            ),
            child: const ResetPasswordScreen(),
          ),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.surveyStarting:
        return MaterialPageRoute(
          builder: (_) => const SurveyStarting(),
        );
      case Routes.surveyScreens:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                SurveyCubit(SurveyRepo(getIt<ClassificationModelApiService>())),
            child: const SurveyScreen(),
          ),
        );
      case Routes.surveyCompleted:
        return MaterialPageRoute(
          builder: (_) => const SurveyCompleted(),
        );
      case Routes.surveyResult:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                SurveyCubit(SurveyRepo(getIt<ClassificationModelApiService>())),
            child: const SurveyResult(),
          ),
        );
      case Routes.appLayout:
        return MaterialPageRoute(
          builder: (_) => const AppLayout(),
        );
      case Routes.morningScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RoutineCubit(RoutineRepo(getIt<ApiService>())),
            child: const MorningRoutine(),
          ),
        );
      case Routes.afternoonScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RoutineCubit(RoutineRepo(getIt<ApiService>())),
            child: const AfternoonRoutine(),
          ),
        );
      case Routes.nightScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RoutineCubit(RoutineRepo(getIt<ApiService>())),
            child: const NightRoutine(),
          ),
        );
      case Routes.createPostScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<PostsCubit>()..fetchPosts(),
            child: const CreatePostScreen(),
          ),
        );
      case Routes.editProfileScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                UserProfileCubit(UserProfileRepo(getIt<ApiService>()))
                  ..fetchUserProfile(), // Fetch the profile when navigating
            child: const EditProfileScreen(),
          ),
        );
      case Routes.settingsProfileScreen:
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
        );
      case Routes.privacyPolicyScreen:
        return MaterialPageRoute(
          builder: (_) => const PrivacyPolicyScreen(),
        );
      case Routes.notificationsSettingsScreen:
        return MaterialPageRoute(
          builder: (_) => const NotificationsSettingsScreen(),
        );
      case Routes.notificationsScreen:
        return MaterialPageRoute(
          builder: (_) => const NotificationsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
