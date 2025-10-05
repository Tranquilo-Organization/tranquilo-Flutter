import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/helpers/shared_pref_helper.dart';
import 'package:tranquilo_app/features/profile/logic/providers/delete_account_provider.dart';

class DeleteAccountListener extends ConsumerWidget {
  const DeleteAccountListener({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<bool>>(
      deleteAccountProvider,
      (previous, next) {
        next.when(
          data: (success) {
            if (success) {
              SharedPrefHelper.clearAllData();
              SharedPrefHelper.clearAllSecuredData();
              context.pushNamedAndRemoveUntil(
                Routes.loginScreen,
                predicate: (route) => false,
              );
            }
          },
          loading: () {},
          error: (error, stackTrace) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: $error')),
            );
          },
        );
      },
    );

    return const SizedBox.shrink();
  }
}
