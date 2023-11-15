import 'package:flutter/material.dart';

class SendCodeForResetPasswordPage extends MaterialPage {
  const SendCodeForResetPasswordPage()
      : super(child: const _SendCodeForResetWidget());
}

class _SendCodeForResetWidget extends StatelessWidget {
  const _SendCodeForResetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("ForgotPasswordView"),
      ),
    );
  }
}
