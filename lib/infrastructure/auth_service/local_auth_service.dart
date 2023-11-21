import 'package:task_management_application/domain/entity/authentication_info.dart';
import 'package:task_management_application/domain/entity/sign_in_user.dart';
import 'package:task_management_application/infrastructure/auth_service/base_auth_service.dart';

class LocalAuthService extends BaseAuthService {
  @override
  Future<void> confirmEmailAddressWithOneTimePassCode(
      {required String oneTimePassCode}) {
    // TODO: implement confirmEmailAddressWithOneTimePassCode
    throw UnimplementedError();
  }

  @override
  Future<void> resetPasswordWithOneTimePassCode(
      {required String email,
      required String oneTimePassCode,
      required String newPassword,
      required String confirmationNewPassword}) {
    // TODO: implement resetPasswordWithOneTimePassCode
    throw UnimplementedError();
  }

  @override
  Future<void> sendOneTimePassCode({required String email}) {
    // TODO: implement sendOneTimePassCode
    throw UnimplementedError();
  }

  @override
  Future<void> signOut(Session session) {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> signUpWithEmailAndPassword(
      {required String username,
      required String email,
      required String password,
      String? confirmPassword}) {
    // TODO: implement signUpWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<SignInUser> signInWithEmailAndPassword(
      {required String email, required String password}) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }
}
