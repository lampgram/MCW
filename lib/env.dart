import 'dart:async';

import 'package:mcw/shared/types.dart';
import 'package:mcw/shared/ui_common.dart';
import 'package:logger/logger.dart';

BuildMode buildMode = (() {
  if (const bool.fromEnvironment('dart.vm.product')) {
    return BuildMode.release;
  }
  var result = BuildMode.profile;
  assert(() {
    result = BuildMode.debug;
    return true;
  }());
  return result;
}());

Future<void> reportError(dynamic error, dynamic stackTrace) async {
  // Print the exception to the console.
  if (buildMode == BuildMode.debug) {
    // Print the full stacktrace in debug mode.
    locator.get<Logger>().d("Caught error:", error, stackTrace);
    return;
  }
}
