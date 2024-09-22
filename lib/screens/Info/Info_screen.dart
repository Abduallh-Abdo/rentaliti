
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rentaliti/List_info_car.dart';
import 'package:rentaliti/screens/Booking/booking_screen.dart';
import 'package:rentaliti/screens/Info/custom_details.dart';
import 'package:rentaliti/screens/Info/custom_images.dart';

class InfoScreen extends StatelessWidget {
  final Map car;
  InfoScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Rakkas',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.transparent,
                    contentPadding: EdgeInsets.zero,
                    content: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: 250,
                        height: 200,
                        color: Colors.white,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(car['image']),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: AssetImage(car['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: CustomImages(
                images: car['images'],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: BMW_X1.length,
                itemBuilder: (context, index) {
                  return Details(
                    name: car['name'],
                    year: car['year'],
                    topspeed: car['speed'],
                    price: car['price'],
                    allow: car['KM Allow per day'],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffF4CE14),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookScreen(),
                  ),
                );
              },
              child: const Text(
                'Book Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontFamily: 'Rakkas',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
