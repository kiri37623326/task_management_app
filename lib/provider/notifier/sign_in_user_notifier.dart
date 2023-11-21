import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/logger.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/entity/sign_in_user.dart';
import 'package:task_management_application/domain/use_case/auth/reset_password_use_case.dart';
import 'package:task_management_application/domain/use_case/auth/sign_in_with_email_and_password_use_case.dart';
import 'package:task_management_application/domain/use_case/auth/sign_out_use_case.dart';

final signInUserProvider =
    NotifierProvider<SignInUserStateNotifier, SignInUser?>(
  () => SignInUserStateNotifier(),
);

class SignInUserStateNotifier extends Notifier<SignInUser?> {
  @override
  SignInUser? build() => null;

  bool get isAuthorized => state != null;

  Future<Result<void>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final res = await ref
        .read(signInWithEmailAndPasswordUseCaseProvider)
        .signInWithEmailAndPassword(email: email, password: password);
    return res.when(success: (user) {
      state = user;
      return const Result.success(null);
    }, failure: (e) {
      return Result.failure(e);
    });
  }

  Future<Result<void>> signOut() async {
    final res = await ref.read(signOutUseCaseProvider).signOut(state!.session);
    res.when(success: (_) {
      state = null;
    }, failure: (e) {
      Logger.finest("Failed to sign out: ${e.toString()}");
    });
    return res;
  }

  Future<Result<void>> sendOneTimePassCodeForResetPassword(String email) async {
    final res = await ref
        .read(resetPasswordUseCaseProvider)
        .sendOneTimePassCodeForResetPassword(email: email);
    res.when(success: (_) {
      Logger.finest("Success to send one time pass code.");
    }, failure: (e) {
      Logger.warning(e.toString());
    });
    return res;
  }

  Future<Result<void>> resetPassword({
    required String email,
    required String newPassword,
    required String oneTimePassCode,
    required String confirmationNewPassword,
  }) async {
    final res = await ref.read(resetPasswordUseCaseProvider).resetPassword(
          email: email,
          newPassword: newPassword,
          oneTimePassCode: oneTimePassCode,
          confirmationNewPassword: confirmationNewPassword,
        );
    res.when(success: (_) {
      Logger.finest("Success to reset password.");
    }, failure: (e) {
      Logger.finest("Failed to reset password: ${e.toString()}");
    });
    return res;
  }
}
