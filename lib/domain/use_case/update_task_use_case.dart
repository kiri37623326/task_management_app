import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/entity/task.dart';

final updateTaskUseCaseProvider = Provider<UpdateTaskUseCase>((ref) {
  throw UnimplementedError();
});

abstract class UpdateTaskUseCase {
  Future<Result<void>> updateTask(Task task);
}
