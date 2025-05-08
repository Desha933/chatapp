import 'package:chatapp/bloc/bloc/auth_bloc.dart';
import 'package:chatapp/constant.dart';
import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/screens/cubit/login_cubit.dart';
import 'package:chatapp/screens/cubit/register_cubit.dart';
import 'package:chatapp/screens/loginscreen.dart';
import 'package:chatapp/screens/registerscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/chatapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: kRoutes,
        initialRoute: RegisterScreen.id,
      ),
    );
  }
}
