import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/routing/app_router.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';

class TranquiloApp extends StatelessWidget {
  final AppRouter appRouter;

  const TranquiloApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Tranquilo App',
        theme: ThemeData(
          primaryColor: ColorsManager.oceanBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.surveyStarting,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
