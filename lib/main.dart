import 'package:flutter/material.dart';
import 'package:my_muslim/view/page/compass.dart';
import 'package:my_muslim/view/page/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}