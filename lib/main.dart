import 'package:device_preview/device_preview.dart'; // ignore: depend_on_referenced_packages
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_application/core/utils/logger.dart';
import 'package:task_management_application/provider/notifier/navigation/main_route_information_parser.dart';
import 'package:task_management_application/provider/notifier/navigation/main_router_delegate.dart';
import 'package:task_management_application/view/theme/my_theme.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  Logger.init();
  setPathUrlStrategy(); // Remote "#" from url.
  runApp(DevicePreview(
    enabled: kIsWeb && !kReleaseMode,
    builder: (context) => ProviderScope(
      child: MyApp(),
      overrides: [],
    ),
  ));
}

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  // For Android back button behavior.
  final BackButtonDispatcher _backButtonDispatcher = RootBackButtonDispatcher();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("ja", ""),
        Locale("en", ""),
      ],
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: "Task management",
      theme: MyTheme.lightTheme(),
      darkTheme: MyTheme.darkTheme(),
      routerDelegate: MainRouterDelegate(ref),
      routeInformationParser: MainRouteInformationParser(ref),
      backButtonDispatcher: _backButtonDispatcher,
    );
  }
}
