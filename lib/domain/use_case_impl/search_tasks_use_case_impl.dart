import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/entity/task.dart';
import 'package:task_management_application/domain/repository/task_repository.dart';

class SearchTaskUseCase implements SearchTaskUseCase {
  SearchTaskUseCase(this._ref);
  final ProviderRef _ref;

  Future<Result<void>> searchTask(Task newTask) async {
    _ref.read(taskRepositoryProvider)
  }
}
