import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:tranquilo_app/features/dashboard/ui/dashboard_screen.dart';

void main() {
  testWidgets('DashboardScreen has expected widgets', (WidgetTester tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return const MaterialApp(
            home: DashboardScreen(),
          );
        },
      ),
    );

    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.text('Anxiety level improvement'), findsOneWidget);
    expect(find.text('Routine completion percentage'), findsOneWidget);
    expect(find.text('67%'), findsOneWidget);
    expect(find.text('Community Engagement'), findsOneWidget);
    expect(find.text('Number of posts ='), findsOneWidget);
    expect(find.text(' 10'), findsOneWidget);
    expect(find.text('Posts views ='), findsOneWidget);
    expect(find.text(' 60'), findsOneWidget);
    expect(find.text('Posts comments ='), findsOneWidget);
    expect(find.text(' 24'), findsOneWidget);
    expect(find.byType(LinearPercentIndicator), findsOneWidget);
  });
}
