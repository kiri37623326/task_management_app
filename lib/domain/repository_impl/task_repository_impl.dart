import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/entity/task.dart';
import 'package:task_management_application/domain/repository/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  @override
  Future<Result<void>> delete(Task task) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Task>>> loadTasks() {
    // TODO: implement loadTasks
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> register(Task task) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> update(Task task) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
