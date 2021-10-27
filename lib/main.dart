import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:perfect_face/Home/home.dart';
import 'package:perfect_face/theme/theme.dart';
import 'package:wakelock/wakelock.dart';

void main() {
  runApp(const GetMaterialApp(home: MyApp()));

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
    ),
  );
  Wakelock.enable();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeDefault,
      home: Home(),
    );
  }
}
