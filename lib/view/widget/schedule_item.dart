import 'package:flutter/material.dart';
import 'package:my_muslim/model/schedule.dart';

class ScheduleItemWidget extends StatelessWidget {
  final Schedule schedule;

  const ScheduleItemWidget({
    super.key,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomPaint(
                size: Size(2, 70),
                painter: LinePainter(),
              ),
            ],
          ),
          SizedBox(width: 15),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white, // Background color remains the same
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Icon(
                    schedule.icon.icon,
                    color: schedule.getIconColor(), // Apply the dynamic icon color here
                    size: 24, // Optional: Adjust the size of the icon
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(schedule.name,
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      Text(schedule.time, style: TextStyle(fontSize: 13, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(255, 81, 152, 140) // Color of the line
      ..strokeWidth = 2; // Stroke width for the line

    // Drawing the vertical line at the center of the widget
    double centerX = size.width / 2;
    canvas.drawLine(Offset(centerX, 0), Offset(centerX, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
