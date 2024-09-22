import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rentaliti/components/components.dart';
import 'package:rentaliti/screens/Booking/booking_screen.dart';
import 'package:rentaliti/components/custom_button.dart';

class AddNewCardScreen extends StatefulWidget {
  GlobalKey<FormState> fkey = GlobalKey<FormState>();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController vailThruController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController personNameController = TextEditingController();
  AddNewCardScreen({super.key});
  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ADD CARD',
          style: TextStyle(
            fontFamily: 'Rakkas',
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: widget.fkey,
        child: Center(
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            children: [
              const SizedBox(
                height: 150,
              ),
              defaultFormField(
                validate: (value) {},
                border: const OutlineInputBorder(),
                type: TextInputType.number,
                prefix: Icons.credit_card,
                controller: widget.cardNumberController,
                labelText: 'Card Number',
              ),
              const SizedBox(
                height: 15,
              ),
              defaultFormField(
                type: TextInputType.visiblePassword,
                controller: widget.passController,
                border: const OutlineInputBorder(),
                labelText: 'Password',
                validate: (value) {},
                prefix: Icons.lock,
                suffix: Icons.remove_red_eye_outlined,
                obscureText: true,
              ),
              const SizedBox(
                height: 15,
              ),
              defaultFormField(
                border: const OutlineInputBorder(),
                controller: widget.personNameController,
                labelText: ' Name',
                validate: (value) {},
                type: TextInputType.name,
                prefix: Icons.person,
              ),
              const SizedBox(
                height: 15,
              ),
              defaultFormField(
                border: const OutlineInputBorder(),
                type: TextInputType.number,
                prefix: Icons.credit_card,
                controller: widget.vailThruController,
                labelText: 'VAILD THRU',
                validate: (value) {},
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: CustomButton(
                  buttonText: 'Done',
                  fontSize: 28,
                  onPressed: () {
                    if (widget.fkey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BookScreen(
                            cardNumber: widget.cardNumberController.text,
                            name: widget.personNameController.text,
                          ),
                        ),
                      );
                    }
                    // Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
