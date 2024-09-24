import 'package:flutter/material.dart';

class BuildImageContainer extends StatelessWidget {
  const BuildImageContainer({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
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
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imagePath),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      child: Container(
        width: 120,
        height: 120,
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xff495E57),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.network(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
