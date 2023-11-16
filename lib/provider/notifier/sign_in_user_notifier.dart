import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/logger.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/entity/sign_in_user.dart';
import 'package:task_management_application/domain/use_case/reset_password_use_case.dart';
import 'package:task_management_application/domain/use_case/sign_in_with_email_and_password_use_case.dart';
import 'package:task_management_application/domain/use_case/sign_out_use_case.dart';

final signInUserProvider =
    NotifierProvider<SignInUserStateNotifier, SignInUser?>(
  () => SignInUserStateNotifier(),
);

class SignInUserStateNotifier extends Notifier<SignInUser?> {
  @override
  SignInUser? build() => null;

  void update(SignInUser signInUser) {
    state = signInUser;
  }

  bool get isAuthorized {
    return true;
  }

  Future<Result<void>> signInWithEmailAndPassword(
      String email, String password) async {
    final res = await ref
        .read(signInWithEmailAndPasswordUseCaseProvider)
        .signInWithEmailAndPassword(email, password);
    return res.when(success: (_) {
      return const Result.success(null);
    }, failure: (e) {
      return Result.failure(e);
    });
  }

  Future<Result<void>> signOut() async {
    final res = await ref.read(signOutUseCaseProvider).signOut();
    res.when(success: (_) {
      state = null;
    }, failure: (e) {
      Logger.finest("Failed to sign out: ${e.toString()}");
    });
    return res;
  }

  Future<Result<void>> resetPassword() async {
    final res = await ref.read(resetPasswordUseCaseProvider).resetPassword(
          ref.read(signInUserProvider.select((value) => value!.session)),
        );
    res.when(success: (_) {
      Logger.finest("Success to reset password.");
    }, failure: (e) {
      Logger.finest("Failed to reset password: ${e.toString()}");
    });
    return res;
  }
}
