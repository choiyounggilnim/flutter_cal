import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});


  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime(1800),
      lastDay: DateTime(3000),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
      ),
      onDaySelected: (DateTime selectedDate, DateTime focusedDate) {
        setState(() {
          this.selectedDate = selectedDate;
        });
        print(selectedDate);
        print(focusedDate);
      },
      selectedDayPredicate: (DateTime date){
        if (selectedDate == null) {
          return false;
        }

        return this.selectedDate!.year == date.year &&
            this.selectedDate!.month == date.month &&
            this.selectedDate!.day == date.day;
      },

    );
  }
}
