import 'package:task_management_application/domain/entity/task.dart';

abstract class ApiClient {
  void postTask(Task task);
}
