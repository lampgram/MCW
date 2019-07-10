import 'package:mcw/shared/ui_common.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

GetIt locator = GetIt();
List<SingleChildCloneableWidget> providers = [];
final globalKey = GlobalKey();

setupLog() {
  Logger.level = Level.verbose;
}

Logger getLogger(String className) {
  return Logger(
      printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 50,
    colors: false,
    printEmojis: true,
    printTime: true,
  ));
}

setupLocator() async {}

setupProviders() {
  providers = [];
}
