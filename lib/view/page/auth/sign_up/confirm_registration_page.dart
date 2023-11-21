import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfirmRegistrationPage extends MaterialPage {
  const ConfirmRegistrationPage()
      : super(child: const _ConfirmRegistrationWidget());
}

class _ConfirmRegistrationWidget extends HookWidget {
  const _ConfirmRegistrationWidget();

  @override
  Widget build(BuildContext context) {
    final confirmCodeTextEditingController = useTextEditingController();
    final formKey = useMemoized(GlobalKey<FormState>.new, const []);
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: confirmCodeTextEditingController,
              decoration:
                  const InputDecoration(labelText: "ConfirmRegistrationCode"),
              keyboardType: TextInputType.none,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              // autofillHints: const [AutofillHints.none],
            ),
            Consumer(
              builder: (context, ref, _) {
                return TextButton(
                  child: const Text("Confirm"),
                  onPressed: () async {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
