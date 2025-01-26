class Doa {
  final String name;
  final String meaning;  // Mengganti 'desc' dengan arti doa

  Doa({
    required this.name,
    required this.meaning,
  });

  // Fungsi untuk menyaring doa berdasarkan nama
  static List<Doa> filterDoa(List<Doa> doaList, String query) {
    return doaList.where((doa) {
      return doa.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  // Fungsi untuk mendapatkan data dummy doa
  static List<Doa> getDummyData() {
    return [
      Doa(name: "Doa Safar", meaning: "Doa untuk keselamatan selama perjalanan"),
      Doa(name: "Doa Masuk Rumah", meaning: "Doa untuk keberkahan dan perlindungan di dalam rumah"),
      Doa(name: "Doa Tidur", meaning: "Doa yang dibaca sebelum tidur"),
      Doa(name: "Doa Makan", meaning: "Doa yang dibaca sebelum makan"),
      Doa(name: "Doa Wudhu", meaning: "Doa yang dibaca saat melakukan wudhu"),
      Doa(name: "Doa Berbuka Puasa", meaning: "Doa yang dibaca ketika berbuka puasa"),
      Doa(name: "Doa Setelah Sholat", meaning: "Doa yang dibaca setelah melaksanakan sholat fardhu"),
      Doa(name: "Doa Untuk Orang Tua", meaning: "Doa untuk mendoakan kebaikan bagi orang tua"),
      Doa(name: "Doa Keselamatan", meaning: "Doa untuk memohon keselamatan dari segala bahaya"),
      Doa(name: "Doa Rizki", meaning: "Doa untuk memohon keberkahan dalam rezeki"),
    ];
  }
}
