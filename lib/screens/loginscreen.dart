import 'dart:math';

import 'package:chatapp/bloc/bloc/auth_bloc.dart';
import 'package:chatapp/constant.dart';
import 'package:chatapp/helper/showsnakeBar.dart';
import 'package:chatapp/screens/chatapp.dart';
import 'package:chatapp/screens/cubit/login_cubit.dart';
import 'package:chatapp/widgets/custombotton.dart';
import 'package:chatapp/widgets/customchatname.dart';
import 'package:chatapp/widgets/customtext.dart';
import 'package:chatapp/widgets/customtextformfeild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static String id = 'loginscreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;

  GlobalKey<FormState> formkey = GlobalKey();

  String? password;

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Loginloading) {
          isloading = true;
        } else if (state is LoginSccuss) {
          isloading = false;

          Navigator.of(context).pushNamed(ChatApp.id);
        } else if (state is LoginFailure) {
          isloading = false;
          showsnakeBarmassage(context, state.errmassage);
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isloading,
        child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formkey,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    CircleAvatar(
                      radius: 50,
                      child: Image.asset('assets/icons8-messages-100.png'),
                    ),
                    Center(child: CustomChatName()),
                    SizedBox(
                      height: 150,
                    ),
                    CustomText(
                      operations: ' Login',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFormFeild(
                      onchange: (data) {
                        email = data;
                      },
                      hinttext: 'Enter Your Email',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextFormFeild(
                      onchange: (data) {
                        password = data;
                      },
                      hinttext: 'Enter Your password',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomBotton(
                        operation: 'Login',
                        ontap: () async {
                          if (formkey.currentState!.validate()) {
                            BlocProvider.of<AuthBloc>(context).add(
                                LoginEvent(email: email!, password: password!));
                          }
                        }),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
