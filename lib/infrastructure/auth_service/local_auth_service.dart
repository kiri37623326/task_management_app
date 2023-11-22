import 'package:task_management_application/domain/entity/session.dart';
import 'package:task_management_application/domain/entity/sign_in_user.dart';
import 'package:task_management_application/infrastructure/auth_service/base_auth_service.dart';

class LocalAuthService extends BaseAuthService {
  @override
  Future<void> confirmEmailAddressWithOneTimePassCode(
      {required String oneTimePassCode}) async {
    Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> resetPasswordWithOneTimePassCode(
      {required String email,
      required String oneTimePassCode,
      required String newPassword,
      required String confirmationNewPassword}) async {
    Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> sendOneTimePassCode({required String email}) async {
    Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> signOut(Session session) async {
    Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> signUpWithEmailAndPassword(
      {required String username,
      required String email,
      required String password,
      String? confirmPassword}) async {
    Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<SignInUser> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    Future.delayed(const Duration(seconds: 1));
    return SignInUser(
      id: "email$email",
      displayName: email,
      email: email,
      session: SampleSession(email),
    );
  }
}
