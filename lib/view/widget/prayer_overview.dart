import 'package:flutter/material.dart';

class PrayerOverview extends StatelessWidget {
  const PrayerOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Sabtu 25 January 2025',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '5 Robbiul Awwal 1443 H',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
