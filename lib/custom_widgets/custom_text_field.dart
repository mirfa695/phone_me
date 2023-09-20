import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.text,
        required this.con,
        this.val,
        required this.choice,
        this.color1,
        this.icon,
        Key? key})
      : super(key: key);
  final String text;
  final TextEditingController con;

  bool choice;
  Color? color1;
  IconData? icon;
  String? Function(String?)? val;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: color1 ?? Colors.white),
      controller: con,
      validator: val,
      obscureText: choice,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
          filled: true,
          fillColor: Colors.white.withOpacity(.2),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.white)),
          labelText: text,
          labelStyle: TextStyle(color: Colors.white.withOpacity(.5))),
    );
  }
}
