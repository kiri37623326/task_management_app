import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/entity/task.dart';
import 'package:task_management_application/domain/use_case_impl/register_task_use_case_impl.dart';

final searchTaskUseCaseProvider = Provider<SearchTaskUseCase>((ref) {
  throw ();
});

abstract class SearchTaskUseCase {
  Future<Result<void>> searchTask(Task newTask);
}
