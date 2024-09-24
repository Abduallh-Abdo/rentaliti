import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  final String imagePath;
  final List<String> images; // Now expects List<String>

  ImageDialog({required this.imagePath, required this.images});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(
            image: _getImageProvider(imagePath), // Use helper method for images
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: _getImageProvider(images[index]),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Use the same image provider logic
  ImageProvider _getImageProvider(String imagePath) {
    if (imagePath.contains('http')) {
      return NetworkImage(imagePath);
    } else {
      return AssetImage(imagePath);
    }
  }
}
