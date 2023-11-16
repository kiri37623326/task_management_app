import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/logger.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/entity/authentication_info.dart';
import 'package:task_management_application/domain/use_case/reset_password_use_case.dart';
import 'package:task_management_application/infrastructure/auth_service/base_auth_service.dart';

class ResetPasswordUseCaseImpl extends ResetPasswordUseCase {
  ResetPasswordUseCaseImpl(this._ref);
  final ProviderRef _ref;
  @override
  Future<Result<void>> resetPassword(
    Session session,
    String email,
    String newPassword,
    String confirmationNewPassword,
  ) async {
    try {
      await _ref.read(authServiceProvider).resetPassword(
          session: session,
          email: email,
          newPassword: newPassword,
          confirmationNewPassword: confirmationNewPassword);
      return const Result.success(null);
    } on Exception catch (e) {
      return Result.failure(e);
    } on Error catch (e) {
      Logger.warning("Unexpected Error occurred: ${e.toString()}");
      rethrow;
    }
  }
}
