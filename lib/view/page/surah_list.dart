import 'package:flutter/material.dart';
import 'package:my_muslim/model/surah.dart';

class SurahListWidget extends StatelessWidget {
  final List<Surah> surahList;
  final Function(String) filterSurahList;
  final TextEditingController searchController;

  const SurahListWidget({
    super.key,
    required this.surahList,
    required this.filterSurahList,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller: searchController,
            onChanged: filterSurahList,
            decoration:  InputDecoration(
              labelText: 'Search Surah',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
         SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(), // Agar tidak ada scroll vertikal pada SurahListWidget
          itemCount: surahList.length,
          itemBuilder: (context, index) {
            final surah = surahList[index];
            int surahIndex = index + 1; // Menghitung index surah berdasarkan 1
            return GestureDetector(
              onTap: () {
                // Anda bisa menambahkan rute menuju detail surah disini
                Navigator.pushNamed(
                  context,
                  '/surah',
                  arguments: surah.name,
                );
              },
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration:  BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '$surahIndex',
                        style:  TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                   SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        surah.name,
                        style:  TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        surah.desc,
                        style:  TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
