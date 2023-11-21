import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/entity/authentication_info.dart';
import 'package:task_management_application/domain/use_case_impl/auth/sign_out_use_case_impl.dart';
import 'package:task_management_application/infrastructure/auth_service/base_auth_service.dart';

final signOutUseCaseProvider = Provider<SignOutUseCase>((ref) {
  return SignOutUseCaseImpl(ref.watch(authServiceProvider));
});

abstract class SignOutUseCase {
  Future<Result<void>> signOut(Session session);
}
