import 'package:task_management_application/infrastructure/auth_service/base_auth_service.dart';

class CognitoAuthService extends BaseAuthService {
  @override
  Future<void> confirmEmailAddress() {
    // TODO: implement confirmEmailAddress
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithUsernameAndPassword(
      {required String username, required String password}) {
    // TODO: implement signInWithUsernameAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(
      {required String username,
      required String email,
      required String password,
      String? confirmPassword}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
