import 'package:chatapp/screens/chatapp.dart';
import 'package:chatapp/screens/loginscreen.dart';
import 'package:chatapp/screens/registerscreen.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xfffdfcef);
const klogo = 'assets/icons8-messages-100.png';
const kBottomcolor = Color.fromARGB(255, 62, 66, 96);
const kMassagesCollection = 'massages';
const kPacifico = 'Pacifico';
const kChatName = 'Chating...';
const kmassage = 'massages';
const kCreatedAt = 'CreatedAt';
Map<String, WidgetBuilder> kRoutes = {
  LoginScreen.id: (context) => LoginScreen(),
  RegisterScreen.id: (context) => RegisterScreen(),
  ChatApp.id: (context) => ChatApp()
};
