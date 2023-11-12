import 'package:flutter/material.dart';

class MyTaskListPage extends MaterialPage {
  const MyTaskListPage() : super(child: const MyTaskListView());
}

class MyTaskListView extends StatelessWidget {
  const MyTaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("MyTaskList")),
    );
  }
}
