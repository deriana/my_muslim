import 'package:flutter/material.dart';

class SurahDetailPage extends StatelessWidget {
  const SurahDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String surahName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(surahName), 
      ),
      body: Center(
        child: Text(
          'Halaman detail untuk surah $surahName\nKosongkan dulu kontennya.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
