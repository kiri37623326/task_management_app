import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/entity/search_condition_for_tasks.dart';

final searchTaskUseCaseProvider = Provider<SearchTaskUseCase>((ref) {
  throw ();
});

abstract class SearchTaskUseCase {
  Future<Result<void>> searchTask(SearchConditionForTasks condition);
}
