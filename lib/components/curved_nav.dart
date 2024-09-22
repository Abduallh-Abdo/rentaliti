import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentaliti/app_cubit/app_cubit.dart';
import 'package:rentaliti/app_cubit/app_state.dart';

class CurvedNav extends StatelessWidget {
  const CurvedNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit appCubit = AppCubit.get(context);

        return Scaffold(
          body: appCubit.screens[appCubit.currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
            height: 65,
            backgroundColor: Colors.white,
            animationDuration: const Duration(milliseconds: 300),
            color: Colors.black,
            index: appCubit.currentIndex,
            items: appCubit.curvedNavBarItem,
            onTap: (value) => appCubit.changeBottomNavBar(value),
          ),
        );
      },
    );
  }
}
