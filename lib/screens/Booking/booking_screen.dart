import 'package:flutter/material.dart';
import 'package:rentaliti/screens/Booking/add_cars.dart';
import 'package:rentaliti/screens/Booking/payment_model.dart';
import 'package:rentaliti/screens/Booking/time_date_model.dart';
import 'package:rentaliti/screens/Home/homeScreen.dart';
import 'package:intl/intl.dart';

class BookScreen extends StatefulWidget {
  final Map<String, dynamic> car;
  const BookScreen({
    super.key,
    required this.car,
  });

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  bool colorIcon = false;
  bool showCardInfo = false;
  DateTime? selectedDate;
  DateTime? selectedDate2;
  bool credit = true;
  bool debit = false;
  String? cardNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Booking',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Rakkas',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Stack(
              children: [
                Container(
                  height: 290,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.01),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 280,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0x00ffffff),
                          Color(0xFFFF733B),
                        ]),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Depart',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Rakkas',
                            fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: ListTile(
                          title: Text(
                            selectedDate != null
                                ? DateFormat('EEEE').format(selectedDate!)
                                : 'Select Date',
                            style: const TextStyle(color: Colors.black),
                          ),
                          subtitle: Text(
                            selectedDate != null
                                ? '${DateFormat('d MMM ,').format(selectedDate!)} ${DateFormat('h:mm a').format(selectedDate!)}'
                                : '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          trailing: CalenderButtonDep(
                            onDateSelected: (newDate) {
                              setState(() {
                                selectedDate = newDate;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Arrival',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Rakkas',
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xff495E57),
                            width: 1,
                          ),
                        ),
                        child: ListTile(
                          title: Text(
                            selectedDate2 != null
                                ? DateFormat('EEEE').format(selectedDate2!)
                                : 'Select Date',
                            style: const TextStyle(color: Colors.black),
                          ),
                          subtitle: Text(
                            selectedDate2 != null
                                ? '${DateFormat('d MMM ,').format(selectedDate2!)} ${DateFormat('h:mm a').format(selectedDate2!)}'
                                : '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          trailing: CalenderButtonDep(
                            onDateSelected: (newDate) {
                              setState(() {
                                selectedDate2 = newDate;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PaymentModel(
                  title: 'Credit Card',
                  onTap: () {
                    setState(() {
                      credit = true;
                      debit = false;
                    });
                  },
                  isSelected: credit,
                ),
                PaymentModel(
                  title: 'Debit',
                  onTap: () {
                    setState(() {
                      credit = false;
                      debit = true;
                    });
                  },
                  isSelected: debit,
                ),
              ],
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: credit
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddCart(),
                        ),
                      ).then((value) {
                        if (value != null && value is String) {
                          setState(() {
                            showCardInfo = true;
                            cardNumber = value;
                          });
                        }
                      });
                    }
                  : null,
              child: credit
                  ? Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color(0x00ffffff).withOpacity(0.5),
                              const Color(0xFFFF733B).withOpacity(0.1),
                            ]),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(width: 1),
                      ),
                      child: const Text(
                        '+      Add New Card',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'Rakkas',
                        ),
                      ),
                    )
                  : const SizedBox(
                      height: 70,
                    ),
            ),
            if (showCardInfo)
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Card:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      cardNumber != null ? cardNumber! : '**** **** **** 1234',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 20),
            Container(
              width: 350,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFFFF733B),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(
                onPressed: () {
                  if (selectedDate == null || selectedDate2 == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please select valid dates!',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                    return;
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Color.fromARGB(208, 255, 255, 255),
                      showCloseIcon: true,
                      closeIconColor: Colors.black,
                      duration: Duration(seconds: 2),
                      content: Text(
                        'Booking confirmed!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Rakkas',
                        ),
                      ),
                    ),
                  );
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Book Now Car',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Rakkas',
                      ),
                    ),
                    Text(
                      '${widget.car['price']} \$',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Rakkas',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
