import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/entity/task.dart';
import 'package:task_management_application/domain/use_case_impl/register_task_use_case_impl.dart';

final registerTaskUseCaseProvider = Provider<RegisterTaskUseCase>((ref) {
  throw RegisterTaskUseCaseImpl();
});

abstract class RegisterTaskUseCase {
  Future<Result<void>> registerTask(Task newTask);
}
