import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String image;
  final String name;
  final String year;
  final String speed;
  final String price;
  final VoidCallback onTap;

  const CustomContainer({
    required this.image,
    required this.name,
    required this.year,
    required this.speed,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 200,
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(),
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(image),
                ),
              ),
            ),
            Positioned(
              bottom: 1,
              child: Container(
                width: 300,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(13),
                    bottomRight: Radius.circular(13),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  name,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Rakkas',
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  year.toString(),
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontFamily: 'Rakkas',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              ' ${speed.toString()} km/h',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        ' ${price.toString()} \$',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontFamily: 'Rakkas',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
