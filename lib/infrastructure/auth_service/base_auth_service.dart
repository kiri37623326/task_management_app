import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/domain/entity/authentication_info.dart';

final authServiceProvider = Provider<BaseAuthService>((ref) {
  throw UnimplementedError();
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

  Future<void> resetPassword({
    required Session session,
    required String email,
    required String newPassword,
    required String confirmationNewPassword,
  });

  Future<void> signOut(Session session);
}
