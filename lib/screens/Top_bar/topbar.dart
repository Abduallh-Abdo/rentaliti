import 'dart:ui';

import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String imageUrl;
  final String username;

  const TopBar({super.key, required this.imageUrl, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      margin: const EdgeInsets.symmetric(vertical: 25),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: imageUrl.isNotEmpty
                ? NetworkImage(imageUrl) // Use network image if available
                : const AssetImage('assets/user.jpg')
                    as ImageProvider, // Placeholder image
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome, $username',
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Rakkas',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Egypt-Cairo', // You can make this dynamic if needed
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Rakkas',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
