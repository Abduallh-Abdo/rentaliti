import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  const CustomRow(
      {super.key,
      required this.txt,
      required this.buttonText,
      required this.onPressed});

  final String txt;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          txt,
          style: const TextStyle(fontSize: 18),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 18, color: Colors.blue),
            ))
      ],
    );
  }
}
