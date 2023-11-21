import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_management_application/core/utils/logger.dart';

class SignUpPage extends MaterialPage {
  const SignUpPage() : super(child: const _SignUpWidget());
}

class _SignUpWidget extends HookWidget {
  const _SignUpWidget();

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
                keyboardType: TextInputType.none,
                autofillHints: const [AutofillHints.email],
              ),
              TextFormField(
                controller: passwordTextEditingController,
                decoration: const InputDecoration(labelText: "Password"),
                keyboardType: TextInputType.none,
                autofillHints: const [AutofillHints.email],
              ),
              Consumer(
                builder: (context, ref, _) {
                  return TextButton(
                    child: Text(AppLocalizations.of(context)!.signIn),
                    onPressed: () async {},
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  Logger.finest("sign in with Google.");
                },
                child: const Text("Sign up with platform."),
              )
            ],
          ),
        ),
      ),
    );
  }
}
