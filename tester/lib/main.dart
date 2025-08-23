import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tester/src/theme/app_responsive_ui.dart';
import 'package:tester/src/theme/app_responsive_ui_config.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tester/src/views/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil().init(context);
    ScreenConfig.init(context);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
