import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/entity/sign_in_user.dart';
import 'package:task_management_application/domain/use_case_impl/auth/sign_in_with_email_and_password_use_case_impl.dart';
import 'package:task_management_application/infrastructure/auth_service/base_auth_service.dart';

final signInWithEmailAndPasswordUseCaseProvider =
    Provider<SignInWithEmailAndPasswordUseCase>((ref) {
  return SignInWithEmailAndPasswordUseCaseImpl(ref.watch(authServiceProvider));
});

abstract class SignInWithEmailAndPasswordUseCase {
  Future<Result<SignInUser>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
