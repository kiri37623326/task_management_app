import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/infrastructure/auth_service/cognito_auth_service.dart';

final authServiceProvider = Provider<BaseAuthService>((ref) {
  return CognitoAuthService();
});

abstract class BaseAuthService {
  Future<void> signUp({
    required String username,
    required String email,
    required String password,
    String? confirmPassword,
  });

  Future<void> confirmEmailAddress();

  Future<void> signInWithUsernameAndPassword({
    required String username,
    required String password,
  });

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  // void signInWithPasskey();

  Future<void> signOut();
}
