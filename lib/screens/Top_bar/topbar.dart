import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  String username;
  TopBar({Key? key,  required this.username});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      margin: const EdgeInsets.symmetric(vertical: 25),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xffF1F1F2),
        border: Border.all(
          width: 2,
          color: Color(0xff495E57),
        ),
        borderRadius: BorderRadius.circular(501),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // InkWell(
          //   onTap: () {},
          //   child: const CircleAvatar(
          //     radius: 35,
          //     backgroundImage: AssetImage('assets/images/ergo_proxy.jpg'),
          //   ),
          // ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
               Text(
                      'Welcome,$username',
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Rakkas',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                Text(
                  'Egypt-cairo',
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Rakkas',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
