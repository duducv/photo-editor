import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:perfect_face/ImageEditor/image_editor.dart';
import 'package:perfect_face/theme/theme.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF121212),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeDefault,
      home: const ImageEditor(),
    );
  }
}
