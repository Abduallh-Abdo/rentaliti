import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String name;
  final String year;
  final String topspeed;
  final String allow;
  final String price;
  const Details({
    super.key,
    required this.name,
    required this.year,
    required this.topspeed,
    required this.allow,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Name",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Rakkas',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Top Speed",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Rakkas',
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Year",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Rakkas',
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Allowed Km per day",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Rakkas',
                fontSize: 20,
              ),
            ),
            Text(
              "Price",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Rakkas',
                fontSize: 20,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Rakkas',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              topspeed,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Rakkas',
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              year,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Rakkas',
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              allow,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'Rakkas',
              ),
            ),
            Text(
              price,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'Rakkas',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
