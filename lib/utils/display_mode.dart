import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';

///Support Maximum Refresh Rate
Future<void> initDisplayMode() async {
  try {
    double max = 0.0;
    DisplayMode maxMode;
    final modes = await FlutterDisplayMode.supported;
    modes.forEach((mode) {
      final current = (mode.width * mode.height * mode.refreshRate);
      if (current > max) {
        maxMode = mode;
        max = current;
      }
    });

    FlutterDisplayMode.setHighRefreshRate();
  } on PlatformException catch (e) {
    print(e.code);
  }
}
