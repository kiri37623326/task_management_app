// abstract class ISignUpWithGoogle {
//   Future<void> signUpWithGoogle();
// }

// abstract class ISignUpWithFacebook {
//   Future<void> signUpWithFacebook();
// }

abstract class ISignUpWithEmailAndPassword {
  Future<void> signUpWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
    String? confirmPassword,
  });
}

abstract class IResetPassword {
  Future<void> resetPasswordWithOneTimePassCode({
    required String email,
    required String oneTimePassCode,
    required String newPassword,
    required String confirmationNewPassword,
  });
}
