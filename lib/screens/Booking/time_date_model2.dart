import 'package:flutter/material.dart';

class CalenderButtonArr extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  const CalenderButtonArr({super.key, required this.onDateSelected});

  @override
  State<CalenderButtonArr> createState() => _CalenderButtonArrState();
}

class _CalenderButtonArrState extends State<CalenderButtonArr> {
  DateTime dateTime = DateTime(2023, 3, 7, 6, 30);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        DateTime? newDate = await showDatePicker(
            context: context,
            firstDate: DateTime(2023),
            lastDate: DateTime(2033),
            initialDate: dateTime);
        if (newDate == null) return;

        TimeOfDay? newTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        );
        if (newTime == null) return;

        final newDateTime = DateTime(
          newDate.year,
          newDate.month,
          newDate.day,
          newTime.hour,
          newTime.minute,
        );
        setState(() {
          dateTime = newDateTime;
        });
        widget.onDateSelected(newDateTime);
      },
      icon: const Icon(
        Icons.calendar_month_outlined,
        color:Color(0xff495E57),
      ),
    );
  }
}
