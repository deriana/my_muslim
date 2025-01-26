import 'package:flutter/material.dart';
import 'package:my_muslim/view/page/doa_detail.dart';
import 'package:my_muslim/view/page/home.dart';
import 'package:my_muslim/view/page/library.dart';
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
        '/': (context) => const LibraryPage(),
        '/surah': (context) => const SurahDetailPage(),
        '/doa': (context) => const DoaDetailPage(),
      },
    );
  }
}