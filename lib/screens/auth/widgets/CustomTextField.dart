import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.hintText,
    required this.iconData,
    this.textEditingController,
    this.validator,
    this.obscureText = false,
  });

  final String? hintText;
  final IconData iconData;
  final TextEditingController? textEditingController;
  final Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 20,
      ),
      child: TextFormField(
        obscureText: obscureText,
        controller: textEditingController,
        validator: validator == null ? null : (value) => validator!(value),
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(
            iconData,
            color: Colors.grey,
          ),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: Colors.greenAccent,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: Colors.grey.shade800,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
