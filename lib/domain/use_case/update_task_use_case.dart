import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/entity/task.dart';
import 'package:task_management_application/domain/use_case_impl/update_task_use_case_impl.dart';

final updateTaskUseCaseProvider = Provider<UpdateTaskUseCase>((ref) {
  throw UpdateTaskUseCaseImpl();
});

abstract class UpdateTaskUseCase {
  Future<Result<void>> updateTask(Task task);
}
