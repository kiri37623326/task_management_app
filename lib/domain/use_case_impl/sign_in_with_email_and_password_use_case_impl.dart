import 'package:task_management_application/core/utils/logger.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/use_case/sign_in_with_email_and_password_use_case.dart';
import 'package:task_management_application/infrastructure/auth_service/base_auth_service.dart';

class SignInWithEmailAndPasswordUseCaseImpl
    extends SignInWithEmailAndPasswordUseCase {
  SignInWithEmailAndPasswordUseCaseImpl(this._authService);
  final BaseAuthService _authService;
  @override
  Future<Result> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const Result.success(null);
    } on Exception catch (e) {
      return Result.failure(e);
    } on Error catch (e) {
      Logger.warning(e.toString());
      rethrow;
    }
  }
}
