import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:task_management_application/domain/entity/authentication_info.dart';
part '../../_generated/domain/entity/sign_in_user.freezed.dart';

@freezed
class SignInUser with _$SignInUser {
  const factory SignInUser({
    required String id,
    required String displayName,
    required String email,
    required AuthenticationInfo authenticationInfo,
  }) = _SignInUser;
}
