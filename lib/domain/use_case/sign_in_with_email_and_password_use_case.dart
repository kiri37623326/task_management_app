import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/use_case_impl/sign_in_with_email_and_password_use_case_impl.dart';
import 'package:task_management_application/infrastructure/auth_service/cognito_auth_service.dart';

final signInWithEmailAndPasswordUseCaseProvider =
    Provider<SignInWithEmailAndPasswordUseCase>((ref) {
  return SignInWithEmailAndPasswordUseCaseImpl(CognitoAuthService());
});

abstract class SignInWithEmailAndPasswordUseCase {
  Future<Result> signInWithEmailAndPassword(String email, String password);
}
