import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_muslim/model/doa.dart'; // Ganti Surah dengan Doa
import 'package:my_muslim/model/surah.dart'; // Pastikan Surah terimport
import 'package:my_muslim/view/widget/navbar.dart'; // Navbar
import 'package:my_muslim/view/widget/surah_list.dart'; // Ganti SurahListWidget menjadi DoaListWidget
import 'package:my_muslim/view/widget/doa_list.dart'; // Import DoaListWidget untuk bagian Doa

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  final TextEditingController _searchController = TextEditingController();
  late List<Surah> surahList;
  late List<Surah> filteredSurahList;
  late List<Doa> doaList;
  late List<Doa> filteredDoaList;

  bool isSurahSelected = true;

  @override
  void initState() {
    super.initState();
    // Ambil data dummy dari model Surah dan Doa
    surahList = Surah.getDummyData();
    filteredSurahList = surahList;
    doaList = Doa.getDummyData();
    filteredDoaList = doaList;
  }

  // Method untuk memfilter Surah berdasarkan query
  void filterSurahList(String query) {
    setState(() {
      filteredSurahList = Surah.filterSurah(surahList, query);
    });
  }

  // Method untuk memfilter Doa berdasarkan query
  void filterDoaList(String query) {
    setState(() {
      filteredDoaList = Doa.filterDoa(doaList, query);
    });
  }

  int _selectedIndex = 1; // Menandakan bahwa LibraryPage aktif

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/'); // Navigasi ke HomePage
        break;
      case 1:
        // Halaman Library sudah aktif
        break;
      case 2:
        Navigator.pushNamed(context, '/schedule'); // Navigasi ke SchedulePage
        break;
      case 3:
        Navigator.pushNamed(context, '/kiblat');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "../../assets/kabah.jpg", // Pastikan path gambar benar
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          // Content
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  flex: 3, // Lebih besar untuk gambar (proporsi 7 bagian)
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 3, // Lebih kecil untuk konten utama (proporsi 3 bagian)
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.0),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Bar untuk memilih Surah atau Doa
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 223, 246, 242),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSurahSelected = true;
                                    });
                                  },
                                  child: Text(
                                    "Surah",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: isSurahSelected
                                          ? Colors.grey
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSurahSelected = false;
                                    });
                                  },
                                  child: Text(
                                    "Doa",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: !isSurahSelected
                                          ? Colors.grey
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Gap(20),
                          // Konten yang diganti berdasarkan pilihan tab
                          isSurahSelected
                              ? SurahListWidget(
                                  surahList: filteredSurahList,
                                  filterSurahList: filterSurahList,
                                  searchController: _searchController,
                                )
                              : DoaListWidget(
                                  doaList: filteredDoaList,
                                  filterDoaList: filterDoaList,
                                  searchController: _searchController,
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        // Menggunakan MyBottomNavigationBar untuk navbar
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
