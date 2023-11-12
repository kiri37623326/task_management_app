import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/domain/entity/task.dart';

class UserTasksNotifier extends Notifier<List<Task>> {
  @override
  List<Task> build() => <Task>[];

  void registerNewTask() {}

  void updateTask(Task task) {}

  void deleteTask(Task task) {}
}
