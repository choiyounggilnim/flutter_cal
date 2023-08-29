import 'package:flutter/material.dart';
import 'package:flutter_cal/const/color.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  final DateTime? selectedDay;
  final DateTime focusedDate;
  final OnDaySelected? onDaySelected;

  const Calendar({required this.selectedDay, required this.focusedDate, required this.onDaySelected, super.key});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: "ko-kr",
      //디바이스 설정언어 따라가게 할 방법은 없나...
      focusedDay: focusedDate,
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
            border: Border.all(color: PRIMARY_COLOR, width: 1.0)),
        outsideDecoration: BoxDecoration(shape: BoxShape.rectangle),
        defaultTextStyle: defaultTxtStyle(),
        selectedTextStyle: defaultTxtStyle(),
        weekendTextStyle: defaultTxtStyle().copyWith(color: PRIMARY_COLOR),
        isTodayHighlighted: false,
      ),
      onDaySelected: onDaySelected,
      selectedDayPredicate: (DateTime date) {
        if (selectedDay == null) {
          return false;
        }

        return selectedDay!.year == date.year && selectedDay!.month == date.month && selectedDay!.day == date.day;
      },
    );
  }

  TextStyle defaultTxtStyle() {
    return TextStyle(fontWeight: FontWeight.w800);
  }

  BoxDecoration defaultDeco() {
    return BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: Colors.grey[200]);
  }
}
