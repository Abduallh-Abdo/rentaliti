import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarData extends StatelessWidget {
  final String name;
  final String year;
  final String topspeed;
  final String price;
  final String kmPer;

  const CarData({
    super.key,
    required this.name,
    required this.year,
    required this.topspeed,
    required this.price,
    required this.kmPer,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(height: 20),
        ListTile(
          leading: const Text(
            "TopSpeed",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Rakkas',
              fontSize: 20,
            ),
          ),
          trailing: Text(
            '$topspeed km/h',
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Rakkas',
              fontSize: 25,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ListTile(
          leading: const Text(
            "How many Km per day",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Rakkas',
              fontSize: 20,
            ),
          ),
          trailing: Text(
            '$kmPer km',
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Rakkas',
              fontSize: 25,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ListTile(
          leading: const Text(
            "Year",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Rakkas',
              fontSize: 20,
            ),
          ),
          trailing: Text(
            year,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Rakkas',
              fontSize: 25,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ListTile(
          leading: const Text(
            "Price",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Rakkas',
              fontSize: 20,
            ),
          ),
          trailing: Text(
            '$price\$',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontFamily: 'Rakkas',
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
