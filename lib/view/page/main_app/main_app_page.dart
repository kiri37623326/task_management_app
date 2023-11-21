import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/provider/notifier/navigation/navigation_state_provider.dart';
import 'package:task_management_application/provider/notifier/navigation/nested_router_delegate.dart';
import 'package:task_management_application/provider/state/navigation/route_path.dart';

class MainAppPage extends MaterialPage {
  const MainAppPage() : super(child: const MainApp());
}

class MainApp extends ConsumerWidget {
  const MainApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ChildBackButtonDispatcher childBackButtonDispatcher = Router.of(context)
        .backButtonDispatcher!
        .createChildBackButtonDispatcher()
      ..takePriority();
    return Scaffold(
      body: Router(
        routerDelegate: NestedRouterDelegate(ref),
        backButtonDispatcher: childBackButtonDispatcher,
        routeInformationParser: null,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: const Text("SampleMenu"),
              onTap: () {
                ref
                    .read(navigationStateProvider.notifier)
                    .goTo(TaskDetailPath("sample"));
              },
            ),
          ],
        ),
      ),
    );
  }
}
