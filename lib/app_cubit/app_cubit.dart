import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentaliti/app_cubit/app_state.dart';
import 'package:rentaliti/screens/Info/custom_details.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int selectedIconIndex = -1;
  int currentIndex = 0;

  List<Widget> curvedNavBarItem = [
    const Icon(
      Icons.home_outlined,
      color: Colors.white,
    ),
    const Icon(
      Icons.shopping_bag_outlined,
      color: Colors.white,
    ),
    const Icon(
      Icons.wallet,
      color: Colors.white,
    ),
    const Icon(
      Icons.person_outline_rounded,
      color: Colors.white,
    ),
  ];

  List<Widget> screens = [
    // const HomeLayout(),
    // const OrderScreen(),
    // const WalletScreen(),
    // const ProfileScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }

  void selectCategory(int index) {
    selectedIconIndex = index;
    emit(AppChanegeSelectFoosCatState());
  }

  List<Map<String, dynamic>> carsListDataAlfa = [];
  List<Map<String, dynamic>> carsListDataFord = [];
  List<Map<String, dynamic>> carsListDataMercedes = [];
  List<Map<String, dynamic>> carsListDataBMW = [];

  void getCarListData() {
    emit(AppGetCarsListDataLoadingState());

    FirebaseFirestore.instance
        .collection('cars_list')
        .get()
        .then((QuerySnapshot querySnapshot) {
      // Clear the existing lists to prevent duplicate entries
      carsListDataAlfa.clear();
      carsListDataBMW.clear();
      carsListDataMercedes.clear();
      carsListDataFord.clear();

      // Iterate through all documents in the querySnapshot
      querySnapshot.docs.forEach((doc) {
        var carData = doc.data() as Map<String, dynamic>;
        String carModel = carData['car_model'];

        // Assign to appropriate list based on the 'car_model' field
        if (carModel == 'alfa') {
          carsListDataAlfa.add(carData);
        } else if (carModel == 'bmw') {
          carsListDataBMW.add(carData);
        } else if (carModel == 'mercedes') {
          carsListDataMercedes.add(carData);
        } else if (carModel == 'ford') {
          carsListDataFord.add(carData);
        }
      });

      emit(AppGetCarsListDataSuccessState());
    }).catchError((error) {
      emit(AppGetCarsListDataErrorState(error.toString()));
    });
  }
}
