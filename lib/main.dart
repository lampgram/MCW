import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mcw/env.dart';
import 'package:mcw/routes/routes.dart';
import 'package:mcw/shared/types.dart';
import 'package:mcw/shared/ui_common.dart';

main() async {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  if (Platform.isAndroid) {
// 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  setupLog();
  await setupLocator();
  setupProviders();

  FlutterError.onError = (FlutterErrorDetails details) async {
    if (buildMode == BuildMode.debug) {
      // In development mode simply print to console.
      FlutterError.dumpErrorToConsole(details);
    } else {
      // In production mode report to the application zone to report to
      // Sentry.
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };

  runZoned<Future<void>>(() async {
    runApp(MyApp());
  }, onError: (error, stackTrace) {
    // Whenever an error occurs, call the `_reportError` function. This sends
    // Dart errors to the dev console or Sentry depending on the environment.
    reportError(error, stackTrace);
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MCW',
          localizationsDelegates: [I18n.delegate],
          locale: Locale("en"),
          supportedLocales: [
            const Locale("en"),
            const Locale("zh"),
          ],
          localeResolutionCallback: (deviceLocale, supportedLocales) {
            return Locale("en");
          },
          initialRoute: RoutePaths.Home,
          onGenerateRoute: Routes.generateRoute,
        ));
  }
}
