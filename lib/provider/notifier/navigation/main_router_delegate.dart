import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/logger.dart';
import 'package:task_management_application/provider/notifier/navigation/navigation_state_provider.dart';
import 'package:task_management_application/provider/notifier/sign_in_user_notifier.dart';
import 'package:task_management_application/provider/state/navigation/route_path.dart';
import 'package:task_management_application/view/page/main_app/main_app_page.dart';
import 'package:task_management_application/view/page/auth/reset_password/reset_password_page.dart';
import 'package:task_management_application/view/page/auth/send_code_for_reset_password/send_code_for_reset_password_page.dart';
import 'package:task_management_application/view/page/session_timeout_page.dart';
import 'package:task_management_application/view/page/auth/sign_in/sign_in_page.dart';
import 'package:task_management_application/view/page/auth/sign_up/sign_up_page.dart';

/// [RouterDelegate] は 渡された設定に基づいて状態を復元する役割
class MainRouterDelegate extends RouterDelegate<RoutePath>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<RoutePath>,
        PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final WidgetRef _ref;

  MainRouterDelegate(this._ref) : navigatorKey = GlobalKey<NavigatorState>() {
    _ref.listen(navigationStateProvider, (_, __) => notifyListeners());
  }

  /// 戻るボタンが押された時の挙動、Web のブラウザバックは関係ない。
  ///
  /// 基本は [PopNavigatorRouterDelegateMixin] を with で mixin する。
  /// false を返すとアプリ全体をポップする。つまりアプリを閉じる。
  ///
  /// 非同期処理を行わない場合は [SynchronousFuture] で返却すべき
  // @override
  // Future<bool> popRoute() async {
  //   Logger.finest("popRoute");
  //   // 基本機能は PopNavigatorRouterDelegateMixin が提供するので override しなくてもいい
  //   // PopNavigatorRouterDelegateMixin が提供するのは以下
  //   final NavigatorState? navigator = navigatorKey.currentState;
  //   if (navigator == null) {
  //     return SynchronousFuture<bool>(false);
  //   }
  //   return navigator.maybePop();
  //   // maybePop は Navigator の pages stack がなくなるまでポップする
  //   // stack がなくなったら false が返る
  //   // stack がなくても戻るボタンでアプリを閉じてほしくない場合
  //   // 例えば bottom navigation bar でタブ移動の履歴をたどるような場合には向かない
  // }

  /// 現在のアプリの状態から [RoutePath] を返す
  ///
  /// [Router] が再構築によって経路情報が変更された可能性を検出したときに呼び出される.
  ///
  /// 現在のアプリの状態は _ref によって読み取る
  @override
  RoutePath? get currentConfiguration {
    Logger.finest("currentConfiguration");
    return _ref.read(navigationStateProvider.notifier).currentRoutePath;
  }

  bool get _isSignIn => _ref.read(signInUserProvider) != null;
  AuthRoutePath get _currentAuthRoutePath =>
      _ref.read(navigationStateProvider.select((value) => value.authRoutePath));
  bool get _isSessionTimeout => _ref
      .read(navigationStateProvider.select((value) => value.isSessionTimeout));

  /// 状態によって [Widget] を切り替える [Navigator] を返す
  /// notifyListeners が呼び出された後に実行される
  ///
  /// _ref.watch() としないのは 再描画が必要だと判断するのは
  /// ChangeNotifier の notifyListeners であるため
  @override
  Widget build(BuildContext context) {
    Logger.finest("build");
    return Navigator(
      key: navigatorKey,
      pages: [
        if (_isSignIn == false) const SignInPage(),
        if (_isSignIn == false && _currentAuthRoutePath is SignUpPath)
          const SignUpPage(),
        if (_isSignIn == false && _currentAuthRoutePath is ForgotPasswordPath)
          const SendCodeForResetPasswordPage(),
        if (_isSignIn == false && _currentAuthRoutePath is ResetPasswordPath)
          const ResetPasswordPage(),
        if (_isSignIn) const MainAppPage(),
        if (_isSignIn && _isSessionTimeout) const SessionTimeoutPage(),
      ],
      onPopPage: _onPopPage,
    );
  }

  /// [Navigator.pop] のコールバック関数.
  /// AppBar の pop 用ボタン ( ← のようなもの ) 押下時など
  ///
  /// Web の ブラウザバックは該当しない
  /// ブラウザバックは [RouteInformationParser.parseRouteInformation] が走る
  bool _onPopPage(Route<dynamic> route, dynamic result) {
    Logger.finest("_onPopPage: ${route.runtimeType}");
    if (!route.didPop(result)) return false;
    _ref.read(navigationStateProvider.notifier).pop();
    return true;
  }

  /// [RouteInformationParser.parseRouteInformation] で解析された [RoutePath] から状態を更新する
  ///
  /// [setNewRoutePath] の後に notifyListeners を呼び出すべき
  /// 非同期処理を行わない場合 [SynchronousFuture] で返却すべき
  @override
  Future<void> setNewRoutePath(RoutePath configuration) async {
    Logger.finest("setNewRoutePath: ${configuration.runtimeType}");
    _ref.read(navigationStateProvider.notifier).goTo(configuration);
    return SynchronousFuture<void>(null);
  }

  /// 状態の復元中に Router によって呼び出される、基本的に記載する必要はない
  // @override
  // Future<void> setRestoredRoutePath(RoutePath configuration) {
  //   return setNewRoutePath(configuration); // デフォルト
  // }

  /// アプリ起動時にのみ呼び出される状態更新処理、必要であれば記載する
  @override
  Future<void> setInitialRoutePath(RoutePath configuration) async {
    Logger.finest("setInitialRoutePath");
    super.setInitialRoutePath(configuration);
    _ref.read(navigationStateProvider.notifier).goTo(configuration);
  }
}
