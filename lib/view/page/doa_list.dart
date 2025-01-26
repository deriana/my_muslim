import 'package:flutter/material.dart';
import 'package:my_muslim/model/doa.dart';

class DoaListWidget extends StatelessWidget {
  final List<Doa> doaList;
  final Function(String) filterDoaList;
  final TextEditingController searchController;

  const DoaListWidget({
    super.key,
    required this.doaList,
    required this.filterDoaList,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller: searchController,
            onChanged: filterDoaList,
            decoration: InputDecoration(
              labelText: 'Search Doa',
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
          physics: NeverScrollableScrollPhysics(),
          itemCount: doaList.length,
          itemBuilder: (context, index) {
            final doa = doaList[index];
            return GestureDetector(
              onTap: () {
                // Navigasi ke halaman detail doa (bisa ditambahkan di sini)
                Navigator.pushNamed(
                  context,
                  '/doa',
                  arguments: doa.name,
                );
              },
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doa.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          doa.meaning,
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                          overflow: TextOverflow.ellipsis, // Tambahkan ellipsis jika teks terlalu panjang
                          softWrap: true, // Membungkus teks ketika tidak muat
                        ),
                      ],
                    ),
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
