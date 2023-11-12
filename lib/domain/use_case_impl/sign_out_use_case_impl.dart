import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/logger.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/use_case/sign_out_use_case.dart';
import 'package:task_management_application/infrastructure/auth_service/base_auth_service.dart';

class SignOutUseCaseImpl extends SignOutUseCase {
  SignOutUseCaseImpl(this._ref);
  final ProviderRef _ref;

  @override
  Future<Result<void>> signOut() async {
    try {
      await _ref.read(authServiceProvider).signOut();
      return const Result.success(null);
    } on Exception catch (e) {
      return Result.failure(e);
    } on Error catch (e) {
      Logger.warning(e.toString());
      rethrow;
    }
  }
}
