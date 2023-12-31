import 'package:amazon_cognito_identity_dart_2/cognito.dart';

abstract class Session {}

class SampleSession extends Session {
  SampleSession(this.email);
  String email;
}

class CognitoSession extends Session {
  CognitoSession(CognitoUserSession session) : _session = session;
  late final CognitoUserSession _session;

  String? get jwtToken => _session.getIdToken().jwtToken;
}
