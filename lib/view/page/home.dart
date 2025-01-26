import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_muslim/view/widget/highlight_card.dart';
import 'package:my_muslim/view/widget/prayer_card.dart';
import 'package:my_muslim/view/widget/prayer_overview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[50],
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PrayerOverview(), // Tanggal dan kalender hijriah
                const Gap(10),
                const HighlightCard(), // Waktu Maghrib sebagai highlight utama
                const Gap(20),
                Text("Prayer Time", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
                const Gap(10),
                const PrayerCardGrid(), // Grid view untuk prayer times
              ],
            ),
          ),
        ),
      ),
    );
  }
}
