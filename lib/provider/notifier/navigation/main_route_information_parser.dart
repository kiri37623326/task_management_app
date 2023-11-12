import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/logger.dart';
import 'package:task_management_application/provider/notifier/sign_in_user_notifier.dart';
import 'package:task_management_application/provider/state/navigation/route_path.dart';

/// [RouteInformationParser] は OS とのやり取りを行う
class MainRouteInformationParser extends RouteInformationParser<RoutePath> {
  MainRouteInformationParser(this._ref);
  final WidgetRef _ref;

  /// [RouteInformationProvider] から通知される [RouteInformation] を
  /// アプリの状態である [RoutePath] に変換する
  ///
  /// Web : URL に値を入力したとき、「戻る」「進む」が押されたときに呼び出される
  ///
  /// その他プラットフォーム : 初回アクセス時に呼び出される
  ///
  /// Async な理由は認証チェックなどを行うため
  /// async 処理をしないなら [SynchronousFuture] 返却を検討する
  @override
  Future<RoutePath> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    Logger.finest("parseRouteInformation: ${routeInformation.uri.path}");

    final isAuthorized = _ref.read(signInUserProvider.notifier).isAuthorized;
    return RoutePath.fromUri(routeInformation.uri, isAuthorized);
  }

  /// アプリの状態からパスを更新するためのメソッド
  ///
  /// [RouterDelegate.currentConfiguration] の後に呼び出され、
  /// 渡された [RoutePath] が持つ状態から [RouteInformation] に変換する
  @override
  RouteInformation? restoreRouteInformation(RoutePath configuration) {
    Logger.finest("restoreRouteInformation: ${configuration.runtimeType}");
    return RouteInformation(uri: configuration.uri);
  }
}
