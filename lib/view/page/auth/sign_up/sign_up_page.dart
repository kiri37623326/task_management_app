import 'package:flutter/material.dart';

class SignUpPage extends MaterialPage {
  const SignUpPage() : super(child: const SignUpView());
}

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("SignUpView")),
    );
  }
}
