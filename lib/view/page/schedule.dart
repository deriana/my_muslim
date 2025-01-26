import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_muslim/view/widget/calender.dart';
import 'package:my_muslim/view/widget/fasting_widget.dart';
import 'package:my_muslim/view/widget/navbar.dart';
import 'package:my_muslim/view/widget/schedule_item.dart';
import 'package:my_muslim/model/schedule.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<SchedulePage> {
  late DateTime _selectedDay;
  bool isFastingChecked = false; // To hold the state of the fasting checkbox
  int _selectedIndex =
      2; // Variabel untuk menyimpan indeks halaman yang dipilih

  // Fetch the schedule directly from the Schedule class
  final List<Schedule> scheduleItems = Schedule.getScheduleItems();

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
  }

  // Fungsi untuk menangani perubahan halaman berdasarkan navbar item yang dipilih
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi ke halaman terkait jika perlu, misalnya:
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/');
        break;
      case 1:
        Navigator.pushNamed(context, '/library');
        break;
      case 2:
        break;
      case 3:
        Navigator.pushNamed(context, '/kiblat');
        break;
    }
  }

  // Filter function to only show Imsak and Tarawih if fasting is checked
  List<Schedule> getFilteredSchedules() {
    if (isFastingChecked) {
      return scheduleItems; // Show all items if fasting is selected
    } else {
      return scheduleItems.where((schedule) {
        return schedule.name != 'Imsak' &&
            schedule.name !=
                'Tarawih'; // Hide Imsak and Tarawih if fasting is not selected
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 246, 242),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _selectedDay = DateTime.now();
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 81, 152, 140),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: CalendarWidget(
                selectedDay: _selectedDay,
                onDaySelected: (selectedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                  });
                },
                onPageChanged: (focusedDay) {
                  setState(() {});
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FastingWidget(
                        onChanged: (bool isChecked) {
                          setState(() {
                            isFastingChecked =
                                isChecked; // Update fasting checkbox state
                          });
                        },
                      ),
                      Gap(10),
                      Text("Schedule",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Gap(20),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: getFilteredSchedules()
                            .length, // Use the filtered schedules
                        itemBuilder: (context, index) {
                          return ScheduleItemWidget(
                            schedule: getFilteredSchedules()[index],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
