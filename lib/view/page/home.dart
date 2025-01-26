import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_muslim/view/widget/highlight_card.dart';
import 'package:my_muslim/view/widget/navbar.dart';
import 'package:my_muslim/view/widget/prayer_card.dart';
import 'package:my_muslim/view/widget/prayer_overview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Variabel untuk menyimpan indeks halaman yang dipilih

  // Fungsi untuk menangani perubahan halaman berdasarkan navbar item yang dipilih
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi ke halaman terkait jika perlu, misalnya:
    switch (index) {
      case 0:
        // Halaman Home sudah aktif
        break;
      case 1:
        Navigator.pushNamed(context, '/library');
        break;
      case 2:
        Navigator.pushNamed(context, '/schedule');
        break;
      case 3:
        Navigator.pushNamed(context, '/kiblat');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Text(
                "Prayer Time",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              const PrayerCardGrid(), // Grid view untuk prayer times
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar( // Menggunakan MyBottomNavigationBar untuk navbar
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
