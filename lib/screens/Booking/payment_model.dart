import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaymentModel extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;
  const PaymentModel(
      {super.key,
      required this.title,
      required this.onTap,
      required this.isSelected});

  @override
  State<PaymentModel> createState() => _PaymentModelState();
}

class _PaymentModelState extends State<PaymentModel> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 140,
        height: 130,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color:
              widget.isSelected ? const Color(0xffF4CE14) : Color(0xffC0C0C0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.title == 'Credit Card'
                ? const Icon(Icons.payment)
                : const Icon(Icons.monetization_on),
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Rakkas',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
