import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/entity/task.dart';

abstract class TaskRepository {
  Future<Result<List<Task>>> loadTasks();
  Future<Result<void>> register(Task task);
  Future<Result<void>> delete(Task task);
  Future<Result<void>> update(Task task);
}
