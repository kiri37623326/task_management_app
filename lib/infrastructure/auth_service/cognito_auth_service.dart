// import 'package:task_management_application/core/utils/logger.dart';
// import 'package:task_management_application/domain/entity/session.dart';
// import 'package:amazon_cognito_identity_dart_2/cognito.dart';
// import 'package:task_management_application/domain/entity/sign_in_user.dart';
// import 'package:task_management_application/infrastructure/auth_service/base_auth_service.dart';

// class CognitoService extends BaseAuthService {
//   final _userPool = CognitoUserPool(
//     'ap-southeast-1_xxxxxxxxx',
//     'xxxxxxxxxxxxxxxxxxxxxxxxxx',
//   );

//   @override
//   Future<void> signOut(Session session) {
//     // TODO: implement signOut
//     throw UnimplementedError();
//   }

//   Future<void> signUp(
//       {required String username,
//       required String email,
//       required String password,
//       String? confirmPassword}) async {
//     final userAttributes = [
//       const AttributeArg(name: 'first_name', value: 'Jimmy'),
//       const AttributeArg(name: 'last_name', value: 'Wong'),
//     ];
//     try {
//       CognitoUserPoolData data = await _userPool.signUp(
//         email,
//         password,
//         userAttributes: userAttributes,
//       );
//     } catch (e) {
//       Logger.warning(e.toString());
//     }
//   }

//   Future<void> confirmRegistration({
//     required String confirmCode,
//   }) async {
//     final cognitoUser = CognitoUser('email@inspire.my', _userPool);

//     bool registrationConfirmed = false;
//     try {
//       registrationConfirmed =
//           await cognitoUser.confirmRegistration(confirmCode);
//     } catch (e) {
//       Logger.warning(e.toString());
//     }
//     Logger.finest(registrationConfirmed.toString());
//   }

//   Future<void> resendConfirmationCode(String email) async {
//     final cognitoUser = CognitoUser(email, _userPool);
//     try {
//       await cognitoUser.resendConfirmationCode();
//     } catch (e) {
//       Logger.warning(e.toString());
//     }
//   }

//   @override
//   Future<void> confirmEmailAddressWithOneTimePassCode(
//       {required String oneTimePassCode}) {
//     // TODO: implement confirmEmailAddressWithOneTimePassCode
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> resetPasswordWithOneTimePassCode(
//       {required String email,
//       required String oneTimePassCode,
//       required String newPassword,
//       required String confirmationNewPassword}) {
//     // TODO: implement resetPasswordWithOneTimePassCode
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> sendOneTimePassCode({required String email}) {
//     // TODO: implement sendOneTimePassCode
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> signUpWithEmailAndPassword(
//       {required String username,
//       required String email,
//       required String password,
//       String? confirmPassword}) {
//     // TODO: implement signUpWithEmailAndPassword
//     throw UnimplementedError();
//   }

//   @override
//   Future<SignInUser> signInWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) async {
//     final cognitoUser = CognitoUser(email, _userPool);
//     final authDetails = AuthenticationDetails(
//       username: email,
//       password: password,
//     );
//     try {
//       final CognitoUserSession? session =
//           await cognitoUser.authenticateUser(authDetails);
//       if (session == null) {
//         throw Exception();
//       }
//       Logger.finest(session.getAccessToken().getJwtToken() ?? "null");
//       return SignInUser(
//           id: "",
//           displayName: "",
//           email: email,
//           session: CognitoSession(session));
//     } on CognitoUserNewPasswordRequiredException catch (e) {
//       // handle New Password challenge
//     } on CognitoUserMfaRequiredException catch (e) {
//       // handle SMS_MFA challenge
//     } on CognitoUserSelectMfaTypeException catch (e) {
//       // handle SELECT_MFA_TYPE challenge
//     } on CognitoUserMfaSetupException catch (e) {
//       // handle MFA_SETUP challenge
//     } on CognitoUserTotpRequiredException catch (e) {
//       // handle SOFTWARE_TOKEN_MFA challenge
//     } on CognitoUserCustomChallengeException catch (e) {
//       // handle CUSTOM_CHALLENGE challenge
//     } on CognitoUserConfirmationNecessaryException catch (e) {
//       // handle User Confirmation Necessary
//     } on CognitoClientException catch (e) {
//       // handle Wrong Username and Password and Cognito Client
//     } catch (e) {
//       Logger.warning(e.toString());
//     }
//     throw Exception("");
//   }
// }
