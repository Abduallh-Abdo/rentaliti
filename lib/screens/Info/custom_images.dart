import 'package:flutter/material.dart';

class CustomImages extends StatelessWidget {
  
  final List<String> images;
  const CustomImages({
    Key? key,
    required this.images,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: images.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return _buildImageContainer(images[index],context);
      },

    );
  }

  Widget _buildImageContainer(String imagePath,context) {
    return GestureDetector(
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
                      image: AssetImage(imagePath),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xff495E57),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.asset(
          imagePath,
          width: 120,
          height: 120,
        ),
      ),
    );
  }
}
