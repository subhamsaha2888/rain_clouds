import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rain_clouds/screens/home_screen.dart';
import 'package:rain_clouds/screens/loading_screen.dart';
import 'package:rain_clouds/utils/display_mode.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDisplayMode();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      /// transparent status bar
      statusBarColor: Colors.transparent,

      /// dark icons on status bar (as it is light theme)
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RainClouds',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      ),
      home: LoadingScreen(),
    );
  }
}
