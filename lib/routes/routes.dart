import 'package:flutter/cupertino.dart';
import 'package:mcw/screen/home_screen.dart';
import 'package:mcw/shared/ui_common.dart';

class RoutePaths {
  static const String Home = '/';
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Home:
        return CupertinoPageRoute(builder: (context) {
          ScreenUtil.instance = ScreenUtil(width: 375, height: 667)
            ..init(context);
          return HomeScreen();
        });

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
