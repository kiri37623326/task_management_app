import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/provider/notifier/sign_in_user_notifier.dart';
import 'package:task_management_application/provider/state/navigation/navigation_state.dart';
import 'package:task_management_application/provider/state/navigation/route_path.dart';

class NavigationStateNotifier extends Notifier<NavigationState> {
  @override
  NavigationState build() {
    return NavigationState(
      authRoutePath: SignInPath(),
      mainAppRoutePath: MyTaskListPath(),
      isSessionTimeout: false,
    );
  }

  RoutePath get currentRoutePath {
    if (ref.read(signInUserProvider) == null) {
      return state.authRoutePath;
    }
    return state.mainAppRoutePath;
  }

  void goTo(RoutePath routePath) {
    if (routePath is MainAppRoutePath) {
      state = state.copyWith(mainAppRoutePath: routePath);
    } else if (routePath is AuthRoutePath) {
      state = state.copyWith(authRoutePath: routePath);
    }
  }

  RoutePath? pop() {
    RoutePath? routePath;
    switch (state.authRoutePath.runtimeType) {
      case SignInPath:
        break;
      case SignUpPath:
        state = state.copyWith(authRoutePath: SignInPath());
      case ForgotPasswordPath:
        state = state.copyWith(authRoutePath: SignInPath());
      case ResetPasswordPath:
        state = state.copyWith(authRoutePath: ForgotPasswordPath());
      // TODO: implement the others cases.
      default:
        routePath = null;
    }
    return routePath;
  }
}

final navigationStateProvider =
    NotifierProvider<NavigationStateNotifier, NavigationState>(
  () => NavigationStateNotifier(),
);
