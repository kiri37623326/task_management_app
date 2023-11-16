import 'package:hooks_riverpod/hooks_riverpod.dart';

final signInPageMessengerProvider =
    NotifierProvider<SignInPageMessengerNotifier, String?>(() {
  return SignInPageMessengerNotifier();
});

class SignInPageMessengerNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  void showMessage(String message) {
    state = message;
  }
}
