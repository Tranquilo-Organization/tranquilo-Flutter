import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/helpers/shared_pref_helper.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import 'package:tranquilo_app/features/profile/logic/profile_cubit.dart';
import 'package:tranquilo_app/features/profile/logic/profile_state.dart';

class DeleteAccountListener extends StatelessWidget {
  const DeleteAccountListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserProfileCubit, UserProfileState>(
      child: const SizedBox.shrink(),
      listener: (context, state) {
        if (state is DeleteSuccess) {
          SharedPrefHelper.clearAllData();
          SharedPrefHelper.clearAllSecuredData();
          context.pushNamedAndRemoveUntil(
            Routes.loginScreen,
            predicate: (route) => false,
          );
        }
      },
    );
  }
}
