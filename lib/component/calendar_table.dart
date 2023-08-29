import 'package:flutter/material.dart';
import 'package:flutter_cal/const/color.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  DateTime? selectedDate;
  DateTime focusedDated = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: "ko-kr", //디바이스 설정언어 따라가게 할 방법은 없나...
      focusedDay: focusedDated,
      firstDay: DateTime(1800),
      lastDay: DateTime(3000),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
      ),
      calendarStyle: CalendarStyle(
        defaultDecoration: defaultDeco(),
        weekendDecoration: defaultDeco(),
        selectedDecoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
            border: Border.all(
              color: PRIMARY_COLOR,
              width: 1.0
            )
        ),
        outsideDecoration: BoxDecoration(
          shape: BoxShape.rectangle
        ),

        defaultTextStyle: defaultTxtStyle(),
        selectedTextStyle: defaultTxtStyle(),
        weekendTextStyle: defaultTxtStyle().copyWith(color: PRIMARY_COLOR),
        isTodayHighlighted: false,
      ),
      onDaySelected: (DateTime selectedDate, DateTime focusedDate) {
        setState(() {
          this.selectedDate = selectedDate;
          this.focusedDated = selectedDate;
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

  TextStyle defaultTxtStyle() {
    return TextStyle(
        fontWeight: FontWeight.w800
      );
  }

  BoxDecoration defaultDeco() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[200]
      );
  }
}
