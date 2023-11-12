import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/use_case_impl/sign_out_use_case_impl.dart';

final signOutUseCaseProvider = Provider<SignOutUseCase>((ref) {
  return SignOutUseCaseImpl(ref);
});

abstract class SignOutUseCase {
  Future<Result<void>> signOut();
}
