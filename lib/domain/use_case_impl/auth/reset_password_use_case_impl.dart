import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/use_case/auth/reset_password_use_case.dart';
import 'package:task_management_application/infrastructure/auth_service/base_auth_service.dart';

class ResetPasswordUseCaseImpl extends ResetPasswordUseCase {
  ResetPasswordUseCaseImpl(this._authService);
  final BaseAuthService _authService;

  @override
  Future<Result<void>> resetPassword(
      {required String email,
      required String newPassword,
      required String oneTimePassCode,
      required String confirmationNewPassword}) async {
    try {
      _authService.resetPasswordWithOneTimePassCode(
          email: email,
          oneTimePassCode: oneTimePassCode,
          newPassword: newPassword,
          confirmationNewPassword: confirmationNewPassword);
      return const Result.success(null);
    } on Exception catch (e) {
      return Result.failure(e);
    } on Error catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> sendOneTimePassCodeForResetPassword(
      {required String email}) {
    // TODO: implement sendOneTimePassCodeForResetPassword
    throw UnimplementedError();
  }
}
