import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/infrastructure/auth_service/interface/sign_in.dart';
import 'package:task_management_application/infrastructure/auth_service/interface/sign_up.dart';
import 'package:task_management_application/infrastructure/auth_service/local_auth_service.dart';

final authServiceProvider = Provider<BaseAuthService>((ref) {
  return LocalAuthService();
});

abstract class BaseAuthService
    implements
        ISignUpWithEmailAndPassword,
        ISignInWithEmailAndPassword,
        IResetPassword {}
