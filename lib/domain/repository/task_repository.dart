import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/entity/task.dart';
import 'package:task_management_application/domain/repository_impl/task_repository_impl.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  return TaskRepositoryImpl(ref);
});

abstract class TaskRepository {
  Future<Result<List<Task>>> search();
  Future<Result<void>> register(Task task);
  Future<Result<void>> delete(Task task);
  Future<Result<void>> update(Task task);
}
