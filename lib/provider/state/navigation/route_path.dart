abstract class RoutePath {
  RoutePath(String url) : uri = Uri(path: baseUrl + url);
  final Uri uri;

  static const String baseUrl = "/";

  factory RoutePath.fromUri(Uri uri, bool isAuthorized) {
    if (isAuthorized) {
      if (uri.pathSegments.isEmpty) {
        return MyTaskListPath();
      }
      switch (uri.pathSegments.first) {
        case MyTaskListPath.path:
          return MyTaskListPath();
        default:
          return MyTaskListPath();
      }
    }
    switch (uri.pathSegments.first) {
      case SignInPath.path:
        return SignInPath();
      default:
        return SignInPath();
    }
  }
}

// -------------------------------- auth -------------------------------------
abstract class AuthRoutePath extends RoutePath {
  AuthRoutePath(super.url);
}

class SignInPath extends AuthRoutePath {
  SignInPath() : super(path);
  static const path = "sign-in";
}

class SignUpPath extends AuthRoutePath {
  SignUpPath() : super(path);
  static const path = "sign-up";
}

class ForgotPasswordPath extends AuthRoutePath {
  ForgotPasswordPath() : super(path);
  static const path = "forgot-password";
}

class ResetPasswordPath extends AuthRoutePath {
  ResetPasswordPath() : super(path);
  static const path = "reset-password";
}

class ConfirmMfaPath extends AuthRoutePath {
  ConfirmMfaPath() : super(path);
  static const path = "confirm-mfa";
}

// -------------------------------- main -------------------------------------
abstract class MainAppRoutePath extends RoutePath {
  MainAppRoutePath(super.url);
}

/// Project List
class ProjectListPath extends MainAppRoutePath {
  ProjectListPath() : super(path);
  static const path = "project";
}

/// All your project
class ProjectDetailPath extends MainAppRoutePath {
  ProjectDetailPath(this.id) : super("${ProjectListPath.path}/$id");
  final String id;
}

/// Your task detail in your project path.
class TaskDetailPath extends MainAppRoutePath {
  TaskDetailPath(this.id) : super("task/$id");
  final String id;
}

/// All your task management path.
class MyTaskListPath extends MainAppRoutePath {
  MyTaskListPath() : super(path);
  static const path = "my-task";
}
