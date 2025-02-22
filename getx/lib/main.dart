import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/ui/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),

      // themeMode: ThemeMode.light,
    );
  }
}
