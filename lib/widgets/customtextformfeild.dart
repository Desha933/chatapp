import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  CustomTextFormFeild(
      {super.key, required this.hinttext, required this.onchange});
  Function(String)? onchange;
  String hinttext;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
      },
      onChanged: onchange,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: '$hinttext',
      ),
    );
  }
}
