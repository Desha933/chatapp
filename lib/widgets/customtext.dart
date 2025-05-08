import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({super.key, required this.operations});
  String operations;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Text(
      '$operations',
      style: TextStyle(
        fontSize: 30,
        color: Colors.black,
      ),
    );
  }
}
