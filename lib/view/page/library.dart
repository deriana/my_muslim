import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_muslim/model/doa.dart'; // Ganti Surah dengan Doa
import 'package:my_muslim/model/surah.dart'; // Pastikan Surah terimport
import 'package:my_muslim/view/widget/surah_list.dart'; // Ganti SurahListWidget menjadi DoaListWidget
import 'package:my_muslim/view/widget/doa_list.dart'; // Import DoaListWidget untuk bagian Doa

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  final TextEditingController _searchController = TextEditingController();
  late List<Surah> surahList;
  late List<Surah> filteredSurahList;
  late List<Doa> doaList;
  late List<Doa> filteredDoaList;

  bool isSurahSelected =
      true; // Menyimpan state apakah "Surah" atau "Doa" yang dipilih

  @override
  void initState() {
    super.initState();
    // Ambil data dummy dari model Surah dan Doa
    surahList = Surah.getDummyData();
    filteredSurahList = surahList; // Set awal daftar surah yang ditampilkan
    doaList = Doa.getDummyData();
    filteredDoaList = doaList; // Set awal daftar doa yang ditampilkan
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

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "../../assets/kabah.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            child: Transform.translate(
              offset: Offset(0, screenHeight * 0.25),
              child: Container(
                width: double.infinity,
                height: screenHeight * 0.7,
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Bar untuk memilih Surah atau Doa
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 223, 246, 242),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                      Gap(20),
                      // Konten yang diganti berdasarkan pilihan tab
                      isSurahSelected
                          ? SurahListWidget(
                              // Menampilkan Surah jika Surah dipilih
                              surahList: filteredSurahList,
                              filterSurahList: filterSurahList,
                              searchController: _searchController,
                            )
                          : DoaListWidget(
                              // Menampilkan Doa jika Doa dipilih
                              doaList: filteredDoaList,
                              filterDoaList: filterDoaList,
                              searchController: _searchController,
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
