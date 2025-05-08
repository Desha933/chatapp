import 'package:chatapp/constant.dart';
import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  CustomBotton({required this.ontap, required this.operation, super.key});
  VoidCallback ontap;
  String operation;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 40,
        width: 30,
        decoration: BoxDecoration(
            color: kBottomcolor, borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          '$operation',
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
