import 'package:task_management_application/domain/entity/session.dart';
import 'package:task_management_application/domain/entity/sign_in_user.dart';

abstract class ISignInWithEmailAndPassword implements ISignOut {
  Future<SignInUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> confirmEmailAddressWithOneTimePassCode({
    required String oneTimePassCode,
  });

  Future<void> sendOneTimePassCode({
    required String email,
  });
}

abstract class ISignOut {
  Future<void> signOut(Session session);
}
