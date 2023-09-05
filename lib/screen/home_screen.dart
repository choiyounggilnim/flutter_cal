import 'package:flutter/material.dart';
import 'package:flutter_cal/component/calendar_table.dart';
import 'package:flutter_cal/component/schedule_card.dart';
import 'package:flutter_cal/component/today_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Calendar(
            selectedDay: selectedDay,
            focusedDate: focusedDay,
            onDaySelected: onDaySelected,
          ),
          SizedBox(height: 8.0),
          TodayBanner(selectedDay: selectedDay, scheduleCount: 3),
          ScheduleCard(startTime: 9, endTime: 10, content: "flutter 연습", color: Colors.blue)
        ],
      ),
    ));
  }

  onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDay = selectedDate;
      this.focusedDay = selectedDate;
    });
  }
}
