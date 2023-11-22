import 'package:task_management_application/core/utils/logger.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/entity/session.dart';
import 'package:task_management_application/domain/use_case/auth/sign_out_use_case.dart';
import 'package:task_management_application/infrastructure/auth_service/base_auth_service.dart';

class SignOutUseCaseImpl extends SignOutUseCase {
  SignOutUseCaseImpl(this._authService);
  final BaseAuthService _authService;

  @override
  Future<Result<void>> signOut(Session session) async {
    try {
      await _authService.signOut(session);
      return const Result.success(null);
    } on Exception catch (e) {
      return Result.failure(e);
    } on Error catch (e) {
      Logger.warning(e.toString());
      rethrow;
    }
  }
}
