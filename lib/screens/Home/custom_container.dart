import 'package:flutter/material.dart';

class CustomContaineHome extends StatelessWidget {
  const CustomContaineHome(
      {super.key,
      required this.image,
      required this.name,
      required this.year,
      required this.price,
      required this.speed});

  final String image;
  final String name;
  final String year;
  final String price;
  final String speed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      margin: const EdgeInsets.only(
        left: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffF4CE14),
        border: Border.all(
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(image),
            ),
          ),
          Positioned(
            bottom: 25,
            child: Container(
              width: 300,
              decoration: const BoxDecoration(
                // color: Colors.teal,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              color: Color(0xff101820),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Rakkas',
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            year,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Rakkas',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Rakkas',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
