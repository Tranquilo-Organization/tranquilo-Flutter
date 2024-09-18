import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/shared_pref_helper.dart';
import 'package:tranquilo_app/features/auth/reset_password/ui/widgets/reset_password_form.dart';
import 'package:tranquilo_app/features/auth/reset_password/ui/widgets/reset_password_header.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  Future<Map<String, String>> _fetchStoredData() async {
    final email = await SharedPrefHelper.getString('email');
    final otp = await SharedPrefHelper.getSecuredString('otp');
    return {'email': email, 'otp': otp};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<Map<String, String>>(
          future: _fetchStoredData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text('Error fetching data'));
            }
            final email = snapshot.data?['email'] ?? '';
            final otp = snapshot.data?['otp'] ?? '';
            return SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpace(16),
                  const ResetPasswordHeader(),
                  verticalSpace(64),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 56.h,
                  ),
                  verticalSpace(64),
                  ResetPasswordForm(email: email, otp: otp),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
