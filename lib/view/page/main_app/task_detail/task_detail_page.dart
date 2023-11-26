import 'package:flutter/material.dart';

class TaskDetailPage extends MaterialPage {
  const TaskDetailPage() : super(child: const _TaskDetailWidget());
}

class _TaskDetailWidget extends StatelessWidget {
  const _TaskDetailWidget();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("foo")),
    );
  }
}
