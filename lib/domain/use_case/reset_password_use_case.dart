import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/entity/authentication_info.dart';
import 'package:task_management_application/domain/use_case_impl/reset_password_use_case_impl.dart';

final resetPasswordUseCaseProvider = Provider<ResetPasswordUseCase>((ref) {
  throw ResetPasswordUseCaseImpl(ref);
});

abstract class ResetPasswordUseCase {
  Future<Result<void>> resetPassword(
    Session session,
    String email,
    String newPassword,
    String confirmationNewPassword,
  );
}
