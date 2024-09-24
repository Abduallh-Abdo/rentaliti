import 'package:flutter/material.dart';

class HeadModels extends StatelessWidget {
  final String carModel;

  const HeadModels({required this.carModel});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            carModel,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 33,
              fontWeight: FontWeight.bold,
              fontFamily: 'Rakkas',
            ),
          ),
        ],
      ),
    );
  }
}
