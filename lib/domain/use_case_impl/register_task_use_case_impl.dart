import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/entity/task.dart';
import 'package:task_management_application/domain/use_case/register_task_use_case.dart';

class RegisterTaskUseCaseImpl extends RegisterTaskUseCase {
  @override
  Future<Result<void>> registerTask(Task newTask) {
    throw UnimplementedError();
  }
}
