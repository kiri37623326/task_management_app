import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/provider/notifier/navigation/nested_router_delegate.dart';

class MainAppPage extends MaterialPage {
  const MainAppPage() : super(child: const MainApp());
}

class MainApp extends ConsumerWidget {
  const MainApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // BottomNavigationBar は各画面共通のため、Routerをネストして実装する
    ChildBackButtonDispatcher childBackButtonDispatcher = Router.of(context)
        .backButtonDispatcher!
        .createChildBackButtonDispatcher()
      ..takePriority();
    return Scaffold(
      body: Router(
        routerDelegate: NestedRouterDelegate(ref),
        // 戻るボタンの制御をネストされた Router に渡す
        backButtonDispatcher: childBackButtonDispatcher,
        // ネストされた RouteInformationParser は設定しても呼び出されることはない
        routeInformationParser: null,
      ),
      // Drawer も bottomNavigationBar と同様に各画面共通のものであるならここに書く
      // drawer: const Drawer(
      //   child: Column(
      //     children: [
      //       ListTile(title: Text("SampleMenu")),
      //     ],
      //   ),
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //     currentIndex: ref.watch(navigationStateProvider
      //         .select((value) => value.bottomNavigationState.rawValue)),
      //     type: BottomNavigationBarType.fixed,
      //     onTap: (value) {},
      //     items: BottomNavigationState.values
      //         .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.name))
      //         .toList()),
    );
  }
}
