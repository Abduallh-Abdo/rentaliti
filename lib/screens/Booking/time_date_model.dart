import 'package:flutter/material.dart';

class CalenderButtonDep extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  const CalenderButtonDep({super.key, required this.onDateSelected});

  @override
  State<CalenderButtonDep> createState() => _CalenderButtonDepState();
}

class _CalenderButtonDepState extends State<CalenderButtonDep> {
  DateTime dateTime = DateTime(2023, 3, 6, 5, 30);
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
        color: Color(0xff495E57),
      ),
    );
  }
}
