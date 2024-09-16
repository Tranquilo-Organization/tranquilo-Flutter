import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/widgets/app_form_field.dart';
import 'package:tranquilo_app/features/auth/sign_in/ui/widgets/already_have_account_text.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 48.h),
                // "Sign In" Text (Moved above logo)
                Text(
                  "Sign in",
                  style: TextStyle(
                    color: ColorsManager.oceanBlue,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 24.h),
                // Logo
                Image.asset(
                  'assets/images/logo.png',
                  height: 100.h,
                ),
                SizedBox(height: 32.h),
                // Email Input
                const AppTextFormField(
                  hintText: 'Email',
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: ColorsManager.lightSilver,
                  ),
                ),
                SizedBox(height: 16.h),
                // Password Input
                const AppTextFormField(
                  hintText: 'Password',
                  isObscureText: true,
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: ColorsManager.lightSilver,
                  ),
                  suffixIcon: Icon(
                    Icons.visibility_off_outlined,
                    color: ColorsManager.lightSilver,
                  ),
                ),
                SizedBox(height: 8.h),
                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Handle forgot password
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: ColorsManager.oceanBlue,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                // Sign In Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle sign in
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.oceanBlue,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        color: ColorsManager.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                // Or Divider
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 1,
                        color: ColorsManager.lightSilver,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        "Or",
                        style: TextStyle(
                          color: ColorsManager.lightSilver,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 1,
                        color: ColorsManager.lightSilver,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                // Social Media Login Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        // Handle Google login
                      },
                      icon: Image.asset(
                        'assets/images/google.png',
                        height: 40.h,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Handle Facebook login
                      },
                      icon: Image.asset(
                        'assets/images/facebook.png',
                        height: 40.h,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Handle Apple login
                      },
                      icon: Image.asset(
                        'assets/images/apple.png',
                        height: 40.h,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                // Sign Up Text
                const AlreadyHaveAccountText()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
