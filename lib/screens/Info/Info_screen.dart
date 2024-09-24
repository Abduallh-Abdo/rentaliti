import 'package:flutter/material.dart';
import 'package:rentaliti/screens/Booking/booking_screen.dart';
import 'package:rentaliti/screens/Info/Dialog_Show_Car.dart';
import 'package:rentaliti/screens/Info/custom_details.dart';
import 'package:rentaliti/screens/Info/custom_images.dart';

class InfoScreen extends StatelessWidget {
  final Map<String, dynamic> car;
  final String nameCar;
  final List<String> images; // Ensure the images are of type List<String>

  const InfoScreen(
      {super.key,
      required this.car,
      required this.nameCar,
      required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          nameCar,
          style: const TextStyle(
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
            const SizedBox(height: 10),

            // Image Tap to Open in Dialog
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) => ImageDialog(
                    imagePath: car['imageUrl'], // Can be asset or network image
                    images: images, // Cast the car['images'] as List<String>
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
                    image: _getImageProvider(car['imageUrl']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Carousel or List of Other Images
            SizedBox(
              height: 150,
              child: CustomImages(
                images:
                    images, // Should handle a list of image URLs (List<String>)
              ),
            ),
            const SizedBox(height: 15),

            // Car Details Section
            SizedBox(
              height: 265,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 1, // Only showing one car's data
                itemBuilder: (context, index) {
                  return CarData(
                    name: car['name'],
                    year: car['year'],
                    topspeed: car['speed'],
                    price: car['price'],
                    kmPer: car['km_allow'], // Ensure the key matches your data
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // Book Now Button
            Container(
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookScreen(
                        car: car,
                        
                      ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to get the correct image provider (NetworkImage or AssetImage)
  ImageProvider _getImageProvider(String imagePath) {
    if (imagePath.contains('http')) {
      // If the imagePath is a URL (from Firebase or online)
      return NetworkImage(imagePath);
    } else {
      // If the image is from local assets
      return AssetImage(imagePath);
    }
  }
}
