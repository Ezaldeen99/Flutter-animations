import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_wifi/widgets/wifi_animations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WifiAnimations(),
    );
  }
}
