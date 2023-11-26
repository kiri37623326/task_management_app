import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/logger.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/entity/task.dart';
import 'package:task_management_application/domain/repository/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  TaskRepositoryImpl(this._ref);
  final ProviderRef _ref;

  @override
  Future<Result<void>> delete(Task task) async {
    Future.delayed(const Duration(seconds: 1));
    Logger.info("delete");
    return const Result.success(null);
  }

  @override
  Future<Result<List<Task>>> search() async {
    Future.delayed(const Duration(seconds: 1));
    Logger.info("delete");
    return const Result.success([Task(id: "", name: "foo")]);
  }

  @override
  Future<Result<void>> register(Task task) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> update(Task task) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
