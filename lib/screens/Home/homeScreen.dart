import 'package:flutter/material.dart';
import 'package:rentaliti/list_cars.dart';
import 'package:rentaliti/screens/Home/custom_container.dart';
import 'package:rentaliti/screens/Home/customize_home.dart';
import 'package:rentaliti/screens/Info/Info_screen.dart';
import 'package:rentaliti/screens/Top_bar/topbar.dart';

// ignore: must_be_immutable
class Homescreen extends StatelessWidget {
  Customs custom = Customs();
  Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.blueGrey,
        decoration: const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //  RegisterCubit.get(context).nameController.text ?? ''
                TopBar(
                  username: '',
                ),
                custom.headModels(car_model: 'Alfa'),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: AlfaCars.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => InfoScreen(
                                car: AlfaCars[index],
                              ),
                            ),
                          );
                        },
                        child: CustomContaineHome(
                          image: AlfaCars[index]['image'],
                          name: AlfaCars[index]['name'],
                          year: AlfaCars[index]['year'],
                          speed: AlfaCars[index]['speed'],
                          price: AlfaCars[index]['price'],
                        ),
                      );
                    },
                  ),
                ),
                custom.headModels(car_model: 'BMW'),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: BMWCars.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => InfoScreen(car: BMWCars[index]),
                            ),
                          );
                        },
                        child: CustomContaineHome(
                          image: BMWCars[index]['image'],
                          name: BMWCars[index]['name'],
                          year: BMWCars[index]['year'],
                          speed: BMWCars[index]['speed'],
                          price: BMWCars[index]['price'],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                custom.headModels(car_model: 'Mercedes'),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: MercedesCar.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => InfoScreen(
                                car: MercedesCar[index],
                              ),
                            ),
                          );
                        },
                        child: CustomContaineHome(
                          image: MercedesCar[index]['image'],
                          name: MercedesCar[index]['name'],
                          year: MercedesCar[index]['year'],
                          speed: MercedesCar[index]['speed'],
                          price: MercedesCar[index]['price'],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                custom.headModels(car_model: 'Ford'),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: FordCars.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => InfoScreen(
                                car: FordCars[index],
                              ),
                            ),
                          );
                        },
                        child: CustomContaineHome(
                          image: FordCars[index]['image'],
                          name: FordCars[index]['name'],
                          year: FordCars[index]['year'],
                          speed: FordCars[index]['speed'],
                          price: FordCars[index]['price'],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: const BarButtoms(),
    );
  }
}
