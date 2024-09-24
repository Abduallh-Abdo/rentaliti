import 'package:flutter/material.dart';
import 'package:rentaliti/screens/Info/build_Image_Container.dart';

class CustomImages extends StatelessWidget {
  final List<String> images;
  const CustomImages({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return BuildImageContainer(imagePath: images[index]);
      },
    );
  }
}
