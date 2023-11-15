import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/entity/task.dart';

final registerTaskUseCaseProvider = Provider<RegisterTaskUseCase>((ref) {
  throw UnimplementedError();
});

abstract class RegisterTaskUseCase {
  Future<Result<void>> registerTask(Task newTask);
}
