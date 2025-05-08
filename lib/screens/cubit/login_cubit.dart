// import 'package:bloc/bloc.dart';
// import 'package:chatapp/helper/showsnakeBar.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// part 'login_state.dart';

// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit() : super(LoginInitial());

//   emit(LoginInitial);

//   Future<void> loginuser(
//       {required String email, required String password}) async {
//     emit(Loginloading());
//     try {
//       UserCredential user = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//       emit(LoginSccuss());
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         emit(LoginFailure(errmassage: e.toString()));
//       } else if (e.code ==
//           'FirebaseAuthException ([firebase_auth/invalid-credential] The supplied auth credential is incorrect, malformed or has expired') {
//         emit(LoginFailure(errmassage: e.toString()));
//       } else {
//         emit(LoginFailure(errmassage: 'some thing went wrong'));
//       }
//     } on Exception catch (e) {
//       emit(LoginFailure(errmassage: 'some thing wrong'));
//     }
//   }
// }
