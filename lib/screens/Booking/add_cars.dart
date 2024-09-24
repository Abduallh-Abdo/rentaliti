import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:rentaliti/components/components.dart';

class AddCart extends StatefulWidget {
  AddCart({
    Key? key,
  }) : super(key: key);

  @override
  _AddCartState createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
  String cardNumber = '';
  String cardHolderName = '';
  String expiryDate = '';
  String cvv = '';
  bool showBack = false;

  late FocusNode _focusNode;
  TextEditingController cardNumbersCrial = TextEditingController();
  TextEditingController expiryFieldDate = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0x00ffffff),
                Color(0xFFFF733B),
              ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              CreditCard(
                cardNumber: cardNumber,
                cardExpiry: expiryDate,
                cardHolderName: cardHolderName,
                cvv: cvv,
                bankName: 'Axis Bank',
                showBackSide: showBack,
                frontBackground: CardBackgrounds.MaxColor,
                backBackground: CardBackgrounds.white,
                showShadow: true,
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      controller: cardNumbersCrial,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        labelText: 'Card Number',
                      ),
                      maxLength: 16,
                      onChanged: (value) {
                        final newCardNumber = value.trim();
                        var newStr = '';
                        const step = 4;

                        for (var i = 0; i < newCardNumber.length; i += step) {
                          newStr += newCardNumber.substring(
                              i, math.min(i + step, newCardNumber.length));
                          if (i + step < newCardNumber.length) newStr += ' ';
                        }
                        setState(() {
                          cardNumber = newStr;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      controller: expiryFieldDate,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        labelText: 'Card Expiry',
                      ),
                      maxLength: 5,
                      onChanged: (value) {
                        var newDateValue = value.trim();
                        final isPressingBackspace =
                            expiryDate.length > newDateValue.length;
                        final containsSlash = newDateValue.contains('/');
                        if (newDateValue.length >= 2 &&
                            !containsSlash &&
                            !isPressingBackspace) {
                          newDateValue = newDateValue.substring(0, 2) +
                              '/' +
                              newDateValue.substring(2);
                        }
                        setState(() {
                          expiryFieldDate.text = newDateValue;
                          expiryFieldDate.selection =
                              TextSelection.fromPosition(
                                  TextPosition(offset: newDateValue.length));
                          expiryDate = newDateValue;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        labelText: 'Card Holder Name',
                      ),
                      onChanged: (value) {
                        setState(() {
                          cardHolderName = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        labelText: 'CVV',
                      ),
                      maxLength: 3,
                      onChanged: (value) {
                        setState(() {
                          cvv = value;
                        });
                      },
                      focusNode: _focusNode,
                    ),
                  ),
                  Center(
                    child: defaultButton(
                        isUppercase: true,
                        height: 50,
                        radius: 10,
                        width: 250,
                        textColor: Colors.white,
                        color: const Color(0xFFFF733B),
                        text: 'Confirm',
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
