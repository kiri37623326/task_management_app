import 'package:task_management_application/core/utils/result.dart';

abstract class LocalAuthenticateUseCase {
  Future<Result<void>> authenticate();
}
