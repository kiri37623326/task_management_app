import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_management_application/provider/notifier/navigation/navigation_state_provider.dart';
import 'package:task_management_application/provider/notifier/sign_in_user_notifier.dart';
import 'package:task_management_application/provider/state/navigation/route_path.dart';

class ResetPasswordPage extends MaterialPage {
  const ResetPasswordPage() : super(child: const _ResetPasswordWidget());
}

class _ResetPasswordWidget extends HookWidget {
  const _ResetPasswordWidget();

  @override
  Widget build(BuildContext context) {
    final emailTextEditingController = useTextEditingController();
    final oneTimePassCodeTextEditingController = useTextEditingController();
    final newPasswordTextEditingController = useTextEditingController();
    final confirmationNewPasswordTextEditingController =
        useTextEditingController();
    final formKey = useMemoized(GlobalKey<FormState>.new, const []);
    return Scaffold(
        body: Form(
      key: formKey,
      child: AutofillGroup(
        child: Column(
          children: [
            TextFormField(
              controller: emailTextEditingController,
              decoration: const InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              controller: oneTimePassCodeTextEditingController,
              decoration: const InputDecoration(labelText: "OneTimePassCode"),
              obscureText: true,
              autofillHints: const [AutofillHints.oneTimeCode],
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              controller: newPasswordTextEditingController,
              decoration: const InputDecoration(labelText: "New Password"),
              obscureText: true,
              autofillHints: const [AutofillHints.newPassword],
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              controller: confirmationNewPasswordTextEditingController,
              decoration: const InputDecoration(
                labelText: "Confirmation New Password",
              ),
              obscureText: true,
              autofillHints: const [AutofillHints.newPassword],
              onEditingComplete: () => TextInput.finishAutofillContext(),
              textInputAction: TextInputAction.done,
            ),
            Consumer(
              builder: (context, ref, _) {
                return TextButton(
                  child: Text(AppLocalizations.of(context)!.signIn),
                  onPressed: () async {
                    final res = await ref
                        .read(signInUserProvider.notifier)
                        .resetPassword(
                          email: emailTextEditingController.text,
                          oneTimePassCode:
                              oneTimePassCodeTextEditingController.text,
                          newPassword: newPasswordTextEditingController.text,
                          confirmationNewPassword:
                              confirmationNewPasswordTextEditingController.text,
                        );
                    res.when(
                      success: (_) {
                        ref
                            .read(navigationStateProvider.notifier)
                            .goTo(SignInPath());
                      },
                      failure: (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(AppLocalizations.of(context)!
                              .wrongEmailOrPassword),
                        ));
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
