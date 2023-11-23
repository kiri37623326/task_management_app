import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/entity/task.dart';
import 'package:task_management_application/domain/repository/task_repository.dart';
import 'package:task_management_application/domain/use_case/delete_task_use_case.dart';

class DeleteTaskUseCaseImpl extends DeleteTaskUseCase {
  DeleteTaskUseCaseImpl(this._ref);
  final ProviderRef _ref;

  @override
  Future<Result<void>> deleteTask(Task task) async {
    return await _ref.read(taskRepositoryProvider).delete(task);
  }
}
