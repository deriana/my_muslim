import 'package:flutter/material.dart';

class DoaDetailPage extends StatelessWidget {
  const DoaDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String doaName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(doaName), 
      ),
      body: Center(
        child: Text(
          'Halaman detail untuk surah $doaName\nKosongkan dulu kontennya.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
