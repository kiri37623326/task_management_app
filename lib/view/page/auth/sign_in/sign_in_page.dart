import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/provider/notifier/navigation/navigation_state_provider.dart';
import 'package:task_management_application/provider/notifier/sign_in_user_notifier.dart';
import 'package:task_management_application/provider/state/navigation/route_path.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInPage extends MaterialPage {
  const SignInPage() : super(child: const _SignInView());
}

class _SignInView extends HookWidget {
  const _SignInView();

  @override
  Widget build(BuildContext context) {
    final emailTextEditingController = useTextEditingController();
    final passwordTextEditingController = useTextEditingController();
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
              ),
              TextFormField(
                controller: passwordTextEditingController,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
                autofillHints: const [AutofillHints.password],
                onEditingComplete: () => TextInput.finishAutofillContext(),
              ),
              Consumer(
                builder: (context, ref, _) {
                  return TextButton(
                    child: Text(AppLocalizations.of(context)!.signIn),
                    onPressed: () async {
                      final res = await ref
                          .read(signInUserProvider.notifier)
                          .signInWithEmailAndPassword(
                            emailTextEditingController.text,
                            passwordTextEditingController.text,
                          );
                      res.when(
                        success: (_) {
                          ref
                              .read(navigationStateProvider.notifier)
                              .goTo(MyTaskListPath());
                        },
                        failure: (e) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(AppLocalizations.of(context)!
                                  .wrongEmailOrPassword)));
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
