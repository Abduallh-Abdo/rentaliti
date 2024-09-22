import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Customs {
  
  // ignore: non_constant_identifier_names
  Widget headModels({required String car_model}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          car_model,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Rakkas',
          ),
        ),
      ],
    );
  }

  Widget car({
    required String image,
    required String car_name,
    required String price,
    required String maxspeed,
    required String year,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 200,
        margin: const EdgeInsets.only(
          left: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(width: 2, color: Colors.black),
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
                image: AssetImage(
                  image,
                ),
              ),
            ),
            Positioned(
              bottom: 1,
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
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  car_name,
                                  style: const TextStyle(
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
                                      fontFamily: 'Rakkas',
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              maxspeed,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      // const SizedBox(
                      //   width: 145,
                      // ),
                      Text(
                        price,
                        style: const TextStyle(
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
