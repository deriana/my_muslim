import 'package:flutter/material.dart';

class PrayerCardGrid extends StatelessWidget {
  const PrayerCardGrid({super.key});

  final List<Map<String, String>> prayerTimes = const [
    {
      'name': 'Imsak',
      'time': '04:00',
      'icon': 'access_alarm',
      'color': 'purple',
    },
    {
      'name': 'Subuh',
      'time': '04:30',
      'icon': 'nightlight_round',
      'color': 'purple',
    },
    {
      'name': 'Dzuhur',
      'time': '12:00',
      'icon': 'sunny',
      'color': 'blue',
    },
    {
      'name': 'Ashar',
      'time': '15:30',
      'icon': 'wb_sunny',
      'color': 'orange',
    },
    {
      'name': 'Maghrib',
      'time': '18:00',
      'icon': 'sunny_snowing',
      'color': 'orange',
    },
    {
      'name': 'Isya',
      'time': '19:30',
      'icon': 'nights_stay',
      'color': 'purple',
    },
  ];

  Color getColorFromString(String colorString) {
    switch (colorString) {
      case 'blueGrey':
        return Colors.blueGrey;
      case 'blue':
        return Colors.blue;
      case 'orange':
        return Colors.orange;
      case 'green':
        return Colors.green;
      case 'red':
        return Colors.red;
      case 'purple':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  IconData getIconFromString(String iconString) {
    switch (iconString) {
      case 'access_alarm':
        return Icons.access_alarm;
      case 'nightlight_round':
        return Icons.nightlight_round;
      case 'sunny':
        return Icons.sunny;
      case 'wb_sunny':
        return Icons.wb_sunny;
      case 'sunny_snowing':
        return Icons.sunny_snowing;
      case 'nights_stay':
        return Icons.nights_stay;
      default:
        return Icons.access_alarm;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: prayerTimes.length,
      itemBuilder: (context, index) {
        final prayer = prayerTimes[index];
        final color = getColorFromString(prayer['color']!);

        return Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                prayer['name']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    prayer['time']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    getIconFromString(prayer['icon']!),
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
