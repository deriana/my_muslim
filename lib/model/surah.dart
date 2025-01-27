class Surah {
  final String name;
  final String desc;

  Surah({
    required this.name,
    required this.desc,
  });

  static List<Surah> filterSurah(List<Surah> surahList, String query) {
    return surahList.where((surah) {
      return surah.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  static List<Surah> getDummyData() {
    return [
      Surah(name: "Al-Fatihah", desc: "Makiyyah - 7 Ayat"),
      Surah(name: "Al-Baqarah", desc: "Madaniyyah - 286 Ayat"),
      Surah(name: "Aali Imran", desc: "Madaniyyah - 200 Ayat"),
      Surah(name: "An-Nisa'", desc: "Madaniyyah - 176 Ayat"),
      Surah(name: "Al-Ma'idah", desc: "Madaniyyah - 120 Ayat"),
      Surah(name: "Al-An'am", desc: "Makiyyah - 165 Ayat"),
      Surah(name: "Al-A'raf", desc: "Makiyyah - 206 Ayat"),
      Surah(name: "Al-Anfal", desc: "Madaniyyah - 75 Ayat"),
      Surah(name: "At-Tawbah", desc: "Madaniyyah - 129 Ayat"),
      Surah(name: "Yunus", desc: "Makiyyah - 109 Ayat"),
      Surah(name: "Hud", desc: "Makiyyah - 123 Ayat"),
      Surah(name: "Yusuf", desc: "Makiyyah - 111 Ayat"),
      Surah(name: "Ar-Ra'd", desc: "Makiyyah - 43 Ayat"),
      Surah(name: "Ibrahim", desc: "Makiyyah - 52 Ayat"),
      Surah(name: "Al-Hijr", desc: "Makiyyah - 99 Ayat"),
      Surah(name: "An-Nahl", desc: "Makiyyah - 128 Ayat"),
      Surah(name: "Al-Isra'", desc: "Makiyyah - 111 Ayat"),
      Surah(name: "Al-Kahf", desc: "Makiyyah - 110 Ayat"),
      Surah(name: "Maryam", desc: "Makiyyah - 98 Ayat"),
      Surah(name: "Taha", desc: "Makiyyah - 135 Ayat"),
      Surah(name: "Al-Anbya", desc: "Makiyyah - 112 Ayat"),
    ];
  }
}
