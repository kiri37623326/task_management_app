import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/provider/notifier/sign_in_user_notifier.dart';

class SessionTimeoutPage extends Page {
  const SessionTimeoutPage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      transitionDuration: const Duration(seconds: 0),
      opaque: false,
      settings: this,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          backgroundColor: Colors.black.withOpacity(0.5),
          body: Center(
            child: AlertDialog(
              title: const Text("Timeout Session"),
              actions: [
                Consumer(
                  builder: (context, ref, child) => TextButton(
                    onPressed: () async {
                      await signOut(context, ref);
                    },
                    child: const Text("Sign Out"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> signOut(BuildContext context, WidgetRef ref) async {
    final res = await ref.read(signInUserProvider.notifier).signOut();
    res.when(
      success: (_) {
        // do nothing
      },
      failure: (exception) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Failed to sign out. Retry after a while."),
        ));
      },
    );
  }
}
