import 'package:flutter/material.dart';

class SignInPage extends MaterialPage {
  const SignInPage() : super(child: const _MfaWidget());
}

class _MfaWidget extends StatelessWidget {
  const _MfaWidget();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text("MFA view"));
  }
}
