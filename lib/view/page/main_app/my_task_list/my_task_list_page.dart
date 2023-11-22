import 'package:flutter/material.dart';
import 'package:kanban_board/custom/board.dart';
import 'package:kanban_board/models/inputs.dart';

class MyTaskListPage extends MaterialPage {
  const MyTaskListPage() : super(child: const MyTaskListView());
}

class MyTaskListView extends StatelessWidget {
  const MyTaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: KanbanBoard([
      BoardListsData(items: [
        const ListTile(title: Text("foo")),
        const ListTile(title: Text("foo")),
        const ListTile(title: Text("foo")),
      ]),
      BoardListsData(items: [
        const ListTile(title: Text("foo")),
        const ListTile(title: Text("foo")),
        const ListTile(title: Text("foo")),
      ]),
      BoardListsData(items: [
        const ListTile(title: Text("foo")),
        const ListTile(title: Text("foo")),
        const ListTile(title: Text("foo")),
      ])
    ]));
  }
}
