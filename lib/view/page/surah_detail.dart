import 'package:flutter/material.dart';
class SurahDetailPage extends StatelessWidget {
  const SurahDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Passing the Surah name in the arguments
    final String surahName = ModalRoute.of(context)!.settings.arguments as String;

    // Arabic text for Surah Al-Fatiha
    List<String> arabicText = [
      'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ',
      'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
      'الرَّحْمَنِ الرَّحِيمِ',
      'مَالِكِ يَوْمِ الدِّينِ',
      'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
      'اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ',
      'صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ'
    ];

    // Translation of Surah Al-Fatiha
    List<String> translations = [
      'In the name of Allah, the Most Gracious, the Most Merciful.',
      'Praise be to Allah, the Lord of all the worlds.',
      'The Most Gracious, the Most Merciful.',
      'Master of the Day of Judgment.',
      'You alone we worship, and You alone we ask for help.',
      'Guide us to the straight path.',
      'The path of those who have received Your grace; not the path of those who have brought down wrath upon themselves, nor of those who have gone astray.'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(surahName),
      ),
      body: Padding(
        
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: arabicText.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Circle with verse number and black border
                    Container(
                      alignment: Alignment.center,
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // Space between ayah number and Arabic text
                    Expanded(
                      child: Text(
                        arabicText[index],
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Scheherazade',
                          height: 1.5,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Translation under each verse
                Text(
                  translations[index],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
