import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/domain/entity/task.dart';

class FilteredUserTasksStateNotifier extends Notifier<List<Task>> {
  @override
  List<Task> build() {
    return [];
  }
}
