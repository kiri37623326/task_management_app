import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/use_case_impl/auth/reset_password_use_case_impl.dart';
import 'package:task_management_application/infrastructure/auth_service/base_auth_service.dart';

final resetPasswordUseCaseProvider = Provider<ResetPasswordUseCase>((ref) {
  return ResetPasswordUseCaseImpl(ref.watch(authServiceProvider));
});

abstract class ResetPasswordUseCase {
  Future<Result<void>> resetPassword({
    required String email,
    required String newPassword,
    required String oneTimePassCode,
    required String confirmationNewPassword,
  });

  Future<Result<void>> sendOneTimePassCodeForResetPassword({
    required String email,
  });
}
