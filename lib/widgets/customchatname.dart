import 'package:chatapp/constant.dart';
import 'package:flutter/material.dart';

class CustomChatName extends StatelessWidget {
  const CustomChatName({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Text(
      kChatName,
      style: TextStyle(
        fontFamily: kPacifico,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
