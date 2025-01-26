import 'package:flutter/material.dart';

class Schedule {
  final String time;
  final String name;
  final Icon icon;
  final String colorString;  // Add the color string for the icon.

  Schedule({
    required this.time,
    required this.name,
    required this.icon,
    required this.colorString,  // Constructor now accepts the color string for the icon.
  });

  static List<Schedule> getScheduleItems() {
    return [
      Schedule(
        name: "Imsak",
        time: "04:00 WIB",
        icon: Icon(Icons.access_alarm),
        colorString: "blueGrey", // Color for the icon
      ),
      Schedule(
        name: "Subuh",
        time: "04:00 WIB",
        icon: Icon(Icons.nightlight_round_outlined),
        colorString: "purple", // Color for the icon
      ),
      Schedule(
        name: "Terbit",
        time: "04:00 WIB",
        icon: Icon(Icons.sunny_snowing),
        colorString: "orange", // Color for the icon
      ),
      Schedule(
        name: "Dzuhur",
        time: "04:00 WIB",
        icon: Icon(Icons.sunny),
        colorString: "orange", // Color for the icon
      ),
      Schedule(
        name: "Ashar",
        time: "04:00 WIB",
        icon: Icon(Icons.wb_sunny),
        colorString: "orange", // Color for the icon
      ),
      Schedule(
        name: "Maghrib",
        time: "04:00 WIB",
        icon: Icon(Icons.sunny_snowing),
        colorString: "orange", // Color for the icon
      ),
      Schedule(
        name: "Isya",
        time: "04:00 WIB",
        icon: Icon(Icons.nights_stay_sharp),
        colorString: "purple", // Color for the icon
      ),
    ];
  }

  // Adding the color conversion method just for the icon
  Color getIconColor() {
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
}
