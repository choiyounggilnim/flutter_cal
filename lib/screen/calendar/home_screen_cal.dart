import 'package:flutter/material.dart';
import 'package:flutter_cal/component/calendar_table.dart';
import 'package:flutter_cal/component/schedule_card.dart';
import 'package:flutter_cal/component/today_banner.dart';

class HomeScreenCal extends StatefulWidget {
  const HomeScreenCal({super.key});

  @override
  State<HomeScreenCal> createState() => _HomeScreenCalState();
}

class _HomeScreenCalState extends State<HomeScreenCal> {
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
          ScheduleCard(startTime: 9, endTime: 10, content: "flutter 연습", color: Colors.blue),
          ElevatedButton(onPressed: (){
            Navigator.of(context).pop(context);
          }, child: Text("pop"))
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
