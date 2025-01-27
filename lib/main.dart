import 'package:flutter/material.dart';
import 'package:my_muslim/view/page/compass.dart';
import 'package:my_muslim/view/page/doa_detail.dart';
import 'package:my_muslim/view/page/home.dart';
import 'package:my_muslim/view/page/library.dart';
import 'package:my_muslim/view/page/schedule.dart';
import 'package:my_muslim/view/page/surah_detail.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/schedule': (context) => SchedulePage(),
        '/library': (context) => LibraryPage(),
        '/kiblat': (context) => CompassPage(),
        '/surah': (context) => SurahDetailPage(),
        '/doa': (context) => DoaDetailPage(),
      },
    );
  }
}