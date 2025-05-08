import 'package:chatapp/constant.dart';
import 'package:chatapp/models/massage.dart';
import 'package:flutter/material.dart';

class CustomBubble extends StatelessWidget {
  const CustomBubble({super.key, required this.massage});
  final Massage massage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            color: kBottomcolor),
        child: Text(
          massage.massagetext,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
