import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/entity/sign_in_user.dart';
import 'package:task_management_application/domain/use_case/auth/sign_in_with_email_and_password_use_case.dart';
import 'package:task_management_application/infrastructure/auth_service/base_auth_service.dart';

class SignInWithEmailAndPasswordUseCaseImpl
    extends SignInWithEmailAndPasswordUseCase {
  SignInWithEmailAndPasswordUseCaseImpl(this._authService);
  final BaseAuthService _authService;

  @override
  Future<Result<SignInUser>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _authService.signInWithEmailAndPassword(
          email: email, password: password);
      return Result.success(user);
    } on Exception catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }
}
