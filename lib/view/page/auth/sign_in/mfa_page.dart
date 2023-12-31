import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_management_application/provider/notifier/sign_in_user_notifier.dart';

class SignInPage extends MaterialPage {
  const SignInPage() : super(child: const _MfaWidget());
}

class _MfaWidget extends HookWidget {
  const _MfaWidget();

  @override
  Widget build(BuildContext context) {
    final mfaTextEditingController = useTextEditingController();
    final formKey = useMemoized(GlobalKey<FormState>.new, const []);
    return Scaffold(
      body: Form(
        key: formKey,
        child: AutofillGroup(
          child: Column(
            children: [
              TextFormField(
                controller: mfaTextEditingController,
                decoration: const InputDecoration(labelText: "OneTimePassword"),
                keyboardType: TextInputType.none,
                autofillHints: const [AutofillHints.oneTimeCode],
              ),
              Consumer(
                builder: (context, ref, _) {
                  return TextButton(
                    child: Text(AppLocalizations.of(context)!.signIn),
                    onPressed: () async {
                      ref.read(signInUserProvider.notifier);
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
