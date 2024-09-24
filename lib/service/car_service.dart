import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'package:rentaliti/service/cloud_storage_service.dart';

class CarService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final CloudStorageService _storageService = CloudStorageService.instance;

  Future<void> addCarToFirestore({
    required String name,
    required String year,
    required String speed,
    required String kmAllowPerDay,
    required String imageUrl,
    required List<File> images, // List of image files to upload
  }) async {
    List<String> imageUrls = [];

    // Upload each image to Firebase Storage and get the download URL
    for (int i = 0; i < images.length; i++) {
      String? imageUrl = await _storageService.uploadImage(
        images[i], 
        'cars/$name', // Storing the images in a "cars" folder in Firebase Storage
        'image_$i.jpg',
      );

      if (imageUrl != null) {
        imageUrls.add(imageUrl); // Add the image URL to the list
      }
    }

    // Add car information to Firestore
    _db.collection('cars').add({
      'name': name,
      'year': year,
      'speed': speed,
      'km_allow': kmAllowPerDay,
      'images': imageUrls, // Store the image URLs in Firestore as a list
      'imageURl': imageUrl, // Store the image URLs in Firestore
    });
  }
}
