import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/entity/search_condition_for_tasks.dart';
import 'package:task_management_application/domain/repository/task_repository.dart';
import 'package:task_management_application/domain/use_case/search_tasks_use_case.dart';

class SearchTaskUseCaseImpl implements SearchTaskUseCase {
  SearchTaskUseCaseImpl(this._ref);
  final ProviderRef _ref;

  Future<Result<void>> searchTask(SearchConditionForTasks condition) async {
    _ref.read(taskRepositoryProvider);
    return const Result.success(null);
  }
}
