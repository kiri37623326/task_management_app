import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/logger.dart';
import 'package:task_management_application/provider/notifier/navigation/navigation_state_provider.dart';
import 'package:task_management_application/provider/state/navigation/route_path.dart';
import 'package:task_management_application/view/page/main_app/my_task_list/my_task_list_page.dart';

class NestedRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final WidgetRef _ref;
  MainAppRoutePath get _currentMainAppRoutePath =>
      _ref.read(navigationStateProvider).mainAppRoutePath;

  NestedRouterDelegate(this._ref) : navigatorKey = GlobalKey<NavigatorState>() {
    _ref.listen(navigationStateProvider, (_, __) => notifyListeners());
  }

  /// 戻るボタンが押された時の挙動、Web のブラウザバックは無関係
  ///
  /// 基本は [PopNavigatorRouterDelegateMixin] を with で mixin する。
  /// false を返すとアプリ全体をポップする。つまりアプリを閉じる。
  ///
  /// 非同期処理を行わない場合は [SynchronousFuture] で返却すべき
  @override
  Future<bool> popRoute() async {
    Logger.finest("nested popRoute");
    final NavigatorState? navigator = navigatorKey.currentState;
    if (navigator == null) {
      return SynchronousFuture<bool>(false);
    }
    final canPopPage = await navigator.maybePop();
    if (canPopPage) {
      return true;
    }
    final res = _ref.read(navigationStateProvider.notifier).pop();
    return res != null;
  }

  @override
  Widget build(BuildContext context) {
    Logger.finest("nested build");
    return Navigator(
      key: navigatorKey,
      pages: [
        const MaterialPage(child: Scaffold(body: Placeholder())),
        if (_currentMainAppRoutePath is MyTaskListPath) const MyTaskListPage(),
      ],
      onPopPage: _onPopPage,
    );
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    Logger.finest("nested _onPopPage");
    if (!route.didPop(result)) return false;
    return true;
  }

  @override
  Future<void> setNewRoutePath(RoutePath configuration) async {
    /// ネストされたここでは setNewRoutePath は呼び出されない.
    Logger.finest("nested setNewRoutePath");
    _ref.read(navigationStateProvider.notifier).goTo(configuration);
    assert(false); // 仮に呼び出された場合にエラーを出すようにしておく
  }

  // @override
  // Future<void> setInitialRoutePath(RoutePath configuration) {
  //   return super.setInitialRoutePath(configuration);
  // }
}
