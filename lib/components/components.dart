import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


void navigateTo({
  required BuildContext context,
  required Widget widget,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}
void navigateAndFinish({
  required BuildContext context,
  required Widget widget,
}) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false, // This ensures all previous routes are removed
  );
}

Future<bool?> defaultToast({
  required msg,
  required ToastStates state,
}) async {
  return await Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: changeToastState(state: state),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

enum ToastStates {
  success,
  error,
  warning,
}

Color changeToastState({required ToastStates state}) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = Colors.lightGreen;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget defaultFormField({
  required TextEditingController controller,
  required dynamic validate,
  required IconData prefix,
  required TextInputType type,
  String? hintText, 
  String? labelText, 
  IconData? suffix,
  Color color = Colors.black,
  Color iconColor = Colors.black,
  Color textColor = Colors.black,
  InputBorder? border = const UnderlineInputBorder(),
  InputBorder? focusedBorder = const UnderlineInputBorder(
    borderSide: BorderSide.none,
  ),
  bool obscureText = false,
  Function()? suffixPressed,
  Function(String)? onSubmit,
  Function(String)? onChanged,
}) {
  return TextFormField(
    style: TextStyle(
      color: textColor,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
    ),
    controller: controller,
    keyboardType: type,
    obscureText: obscureText,
    validator: validate,
    onFieldSubmitted: onSubmit,
    onChanged: onChanged,
    decoration: InputDecoration(
      focusedBorder: focusedBorder,
      labelText: labelText,

      labelStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
      ),
      hintText: hintText, 
      hintStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
      ),
      prefixIcon: Icon(
       
        prefix,
        color: iconColor,
      ),
      suffixIcon: suffix != null 
          ? IconButton(
              onPressed: suffixPressed,
              icon: Icon(
                suffix,
              ),
            )
          : null,
      border: border,
    ),
  );
}

Widget defaultButton({
  required String text,
  required VoidCallback onPressed,
  Color color = Colors.blueAccent,
  Color textColor = Colors.white,
  double width = double.infinity,
  double height = 40,
  double radius = 0,
  bool isUppercase = true,

}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        radius,
      ),
      color: color,
    ),
    child: MaterialButton(
      onPressed: onPressed,
      child: Text(
        isUppercase ? text.toUpperCase() : text,
        style: TextStyle(
          color: textColor,
          fontFamily: 'poppins',
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    ),
  );
}

Widget defaultTextButton({
  required String text,
  required VoidCallback onPressed,
  Color color = Colors.black,
}) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    ),
  );
}
