import 'package:chatapp/bloc/bloc/auth_bloc.dart';
import 'package:chatapp/constant.dart';
import 'package:chatapp/helper/showsnakeBar.dart';
import 'package:chatapp/screens/chatapp.dart';
import 'package:chatapp/screens/loginscreen.dart';
import 'package:chatapp/widgets/custombotton.dart';
import 'package:chatapp/widgets/customchatname.dart';
import 'package:chatapp/widgets/customtext.dart';
import 'package:chatapp/widgets/customtextformfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});
  static String id = 'registerid';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formkey = GlobalKey();

  String? email;

  String? password;

  bool isloading = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isloading = true;
        } else if (state is RegisterSuccess) {
          isloading = false;
          showsnakeBarmassage(context, 'Acount createdn success ');
          Navigator.pushNamed(context, ChatApp.id);
        } else if (state is RegisterFailure) {
          isloading = false;
          showsnakeBarmassage(context, state.errmassage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
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
                        operations: ' Register',
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
                        operation: 'Register',
                        ontap: () async {
                          if (formkey.currentState!.validate()) {
                            isloading = true;
                            BlocProvider.of<AuthBloc>(context).add(
                                RegisterEvent(
                                    email: email!, password: password!));
                          }
                        },
                      ),
                      Row(
                        children: [
                          Text('if you already register ? click here'),
                          Column(
                            children: [
                              SizedBox(
                                height: 30,
                                width: 10,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, LoginScreen.id);
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.blue),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
