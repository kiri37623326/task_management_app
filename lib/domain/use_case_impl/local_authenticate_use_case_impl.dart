import 'package:flutter/services.dart';
import 'package:task_management_application/core/utils/logger.dart';
import 'package:task_management_application/core/utils/result.dart';
import 'package:task_management_application/domain/use_case/local_authenticate_use_case.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthenticateUseCaseImpl extends LocalAuthenticateUseCase {
  @override
  Future<Result<void>> authenticate() async {
    try {
      final auth = LocalAuthentication();
      final didAuthenticate = await auth.authenticate(
        localizedReason: "Please authenticate to show account balance",
      );
      if (didAuthenticate) {
        return const Result.success(null);
      }
      return Result.failure(Exception("failed to local auth"));
    } on PlatformException catch (e) {
      Logger.warning(e.toString());
      return Result.failure(e);
    } on Exception catch (e) {
      return Result.failure(e);
    } on Error {
      return Result.failure(Exception("Unexpected"));
    }
  }
}
