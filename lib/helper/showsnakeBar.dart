import 'package:flutter/material.dart';

void showsnakeBarmassage(BuildContext context, String massage) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(massage)));
}
