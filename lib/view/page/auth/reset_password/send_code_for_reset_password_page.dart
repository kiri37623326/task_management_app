import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_management_application/provider/notifier/navigation/navigation_state_provider.dart';
import 'package:task_management_application/provider/notifier/sign_in_user_notifier.dart';
import 'package:task_management_application/provider/state/navigation/route_path.dart';

class SendCodeForResetPasswordPage extends MaterialPage {
  const SendCodeForResetPasswordPage()
      : super(child: const _SendCodeForResetWidget());
}

class _SendCodeForResetWidget extends HookWidget {
  const _SendCodeForResetWidget();

  @override
  Widget build(BuildContext context) {
    final emailTextEditingController = useTextEditingController();
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
              textInputAction: TextInputAction.done,
              onEditingComplete: () => TextInput.finishAutofillContext(),
            ),
            Consumer(
              builder: (context, ref, _) {
                return TextButton(
                  child: Text(AppLocalizations.of(context)!.signIn),
                  onPressed: () async {
                    final res = await ref
                        .read(signInUserProvider.notifier)
                        .sendOneTimePassCodeForResetPassword(
                            emailTextEditingController.text);
                    res.when(
                      success: (_) {
                        ref
                            .read(navigationStateProvider.notifier)
                            .goTo(ResetPasswordPath());
                      },
                      failure: (e) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Invalid email or connection error."),
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
