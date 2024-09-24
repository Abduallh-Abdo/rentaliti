import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentaliti/app_cubit/app_cubit.dart';
import 'package:rentaliti/app_cubit/app_state.dart';
import 'package:rentaliti/screens/Home/custom_container.dart';
import 'package:rentaliti/screens/Home/customize_home.dart';
import 'package:rentaliti/screens/Info/Info_screen.dart';
import 'package:rentaliti/screens/Top_bar/topbar.dart';

class HomeScreen extends StatelessWidget {
  final String? username;
  final String? image;

  HomeScreen({super.key, this.username, this.image});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        AppCubit appCubit = AppCubit.get(context);

        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/back.jpg'),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TopBar(
                      imageUrl: image ?? '',
                      username: username ?? '',
                    ),

                    // Alfa Cars Section
                    const HeadModels(carModel: 'Alfa Cars'),
                    _buildCarList(
                      context: context,
                      carsList: appCubit.carsListDataAlfa,
                      carModel: 'Alfa',
                    ),

                    // BMW Cars Section
                    const HeadModels(carModel: 'BMW Cars'),
                    _buildCarList(
                      context: context,
                      carsList: appCubit.carsListDataBMW,
                      carModel: 'BMW',
                    ),

                    // Mercedes Cars Section
                    const HeadModels(carModel: 'Mercedes Cars'),
                    _buildCarList(
                      context: context,
                      carsList: appCubit.carsListDataMercedes,
                      carModel: 'Mercedes',
                    ),

                    // Ford Cars Section
                    const HeadModels(carModel: 'Ford Cars'),
                    _buildCarList(
                      context: context,
                      carsList: appCubit.carsListDataFord,
                      carModel: 'Ford',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Helper method to create car list sections
  Widget _buildCarList({
    required BuildContext context,
    required List<Map<String, dynamic>> carsList,
    required String carModel,
  }) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: carsList.length,
        itemBuilder: (context, index) {
          var carData = carsList[index];

          // Handle potential null or missing fields
          String? imageUrl = carData['imageUrl'];
          List<String> images = [];
          if (carData['images'] != null) {
            images = List<String>.from(carData['images']);
          }

          return CustomContainer(
            image: imageUrl ?? '', // Provide a default empty string for image
            name: carData['name'] ?? 'Unknown', // Handle missing name field
            year: carData['year'] ?? 'Unknown', // Handle missing year
            speed: carData['speed'] ?? 'Unknown', // Handle missing speed
            price: carData['price'] ?? 'Unknown', // Handle missing price
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => InfoScreen(
                    car: carData,
                    nameCar:
                        carData['name'] ?? 'Unknown', // Default if name is null
                    images: images, // Cast images list correctly
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
