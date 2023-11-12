import 'package:flutter/material.dart';

class SendCodeForResetPasswordPage extends MaterialPage {
  const SendCodeForResetPasswordPage()
      : super(child: const SendCodeForResetPasswordView());
}

class SendCodeForResetPasswordView extends StatelessWidget {
  const SendCodeForResetPasswordView({super.key});

  static Page get page {
    return const MaterialPage(child: SendCodeForResetPasswordView());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("ForgotPasswordView"),
      ),
    );
  }
}
