import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/routing/app_router.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';

class TranquiloApp extends StatelessWidget {
  final AppRouter appRouter;
  final String initialRoute;

  const TranquiloApp({
    super.key,
    required this.appRouter,
    required this.initialRoute,
  });

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
        initialRoute: initialRoute,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
