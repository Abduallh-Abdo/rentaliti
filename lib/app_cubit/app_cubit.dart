
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentaliti/app_cubit/app_state.dart';

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
}
