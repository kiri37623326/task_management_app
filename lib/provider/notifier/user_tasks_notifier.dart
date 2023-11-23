import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/logger.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/entity/task.dart';
import 'package:task_management_application/domain/use_case/delete_task_use_case.dart';
import 'package:task_management_application/domain/use_case/register_task_use_case.dart';
import 'package:task_management_application/domain/use_case/update_task_use_case.dart';

final userTasksProvider = NotifierProvider<UserTasksNotifier, List<Task>>(() {
  return UserTasksNotifier();
});

class UserTasksNotifier extends Notifier<List<Task>> {
  @override
  List<Task> build() => <Task>[];

  Future<Result<void>> registerTask(Task task) async {
    final res = await ref.read(registerTaskUseCaseProvider).registerTask(task);
    res.when(
      success: (_) {
        state = [...state..add(task)];
      },
      failure: (e) {
        Logger.warning(e.toString());
      },
    );
    return res;
  }

  Future<Result<void>> updateTask(Task task) async {
    final res = await ref.read(updateTaskUseCaseProvider).updateTask(task);
    res.when(
      success: (_) {
        state.firstWhereOrNull((element) => element.id == task.id);
      },
      failure: (e) {
        // state.firstWhereOrNull((element) => element.id == task.id);
      },
    );
    return res;
  }

  Future<Result<void>> deleteTask(Task task) async {
    final res = await ref.read(deleteTaskUseCaseProvider).deleteTask(task);
    res.when(success: (_) {
      state = [...state..removeWhere((element) => element.id == task.id)];
    }, failure: (e) {
      Logger.finest(e.toString());
    });
    return res;
  }
}
