import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rentaliti/screens/Booking/add_cars.dart';
import 'package:rentaliti/screens/Booking/payment_model.dart';
import 'package:rentaliti/screens/Booking/time_date_model.dart';
import 'package:rentaliti/screens/Home/homeScreen.dart';

class BookScreen extends StatefulWidget {
  String? name;
  String? cardNumber;
  BookScreen({super.key, this.name, this.cardNumber});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  bool colorIcon = false;
  bool showCardInfo = false;
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2 = DateTime.now();

  bool credit = true;
  bool debit = false;
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
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Address',
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Rakkas',
                    ),
                    hintText: 'Enter your address',
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Rakkas',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hoverColor: const Color(0xff495E57),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff495E57),
                      ),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  Container(
                    height: 290,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: const Color(0xff3DA7E1),
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
                      color: Colors.white,
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
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
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
                              DateFormat('EEEE').format(selectedDate),
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              '${DateFormat('d MMM ,').format(selectedDate)} ${DateFormat('h:mm a').format(selectedDate)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            trailing:
                                CalenderButtonDep(onDateSelected: (newDate) {
                              setState(() {
                                selectedDate = newDate;
                              });
                            }),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Arrival',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Rakkas',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
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
                              DateFormat('EEEE').format(selectedDate2),
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              '${DateFormat('d MMM ,').format(selectedDate2)} ${DateFormat('h:mm a').format(selectedDate2)}',
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
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddNewCardScreen(),
                    ),
                  ).then((value) {
                    // This callback runs when returning from AddNewCard_Screen
                    if (value != null && value) {
                      // If a new card is added, show the card info
                      setState(() {
                        showCardInfo = true;
                      });
                    }
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
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
                ),
              ),
              // if name = null
              if (showCardInfo ||
                  (widget.cardNumber != null && widget.name != null))
                ListTile(
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  leading: const Icon(Icons.credit_card),
                  title: Text(
                    widget.name ?? 'Name not available',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '************${widget.cardNumber ?? 'Card number not available'}',
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        colorIcon = !colorIcon; // Toggle the colorIcon variable
                      });
                    },
                    icon: const Icon(Icons
                        .check_circle), // Change the icon as per your requirement
                    color: colorIcon ? const Color(0xff3DA7E1) : null,
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
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
                        builder: (context) => Homescreen(),
                      ),
                    );
                  });
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xffF4CE14)),
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size(400, 50),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Book Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Rakkas',
                      ),
                    ),
                    Text(
                      '150 \$',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Rakkas',
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
