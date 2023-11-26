import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/use_case_impl/local_authenticate_use_case_impl.dart';

final localAuthenticateUseCaseProvider =
    Provider((ref) => LocalAuthenticateUseCaseImpl());

abstract class LocalAuthenticateUseCase {
  Future<Result<void>> authenticate();
}
