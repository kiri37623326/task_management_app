import 'package:flutter/material.dart';

class SignUpPage extends MaterialPage {
  const SignUpPage() : super(child: const SignUpWidget());
}

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("SignUpWidget")),
    );
  }
}
