// import 'package:bloc/bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:meta/meta.dart';

// part 'register_state.dart';

// class RegisterCubit extends Cubit<RegisterState> {
//   RegisterCubit() : super(RegisterInitial());

//   Future<void> createuser(
//       {required String email, required String password}) async {
//     emit(RegisterInitial());

//     try {
//       UserCredential user = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       emit(RegisterSuccess());
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         emit(RegisterFailure(errmassage: e.toString()));
//       } else if (e.code == 'email-already-in-use') {
//         emit(RegisterFailure(errmassage: e.toString()));
//       }
//     } on Exception catch (e) {
//       emit(RegisterFailure(errmassage: e.toString()));
//     }
//   }
// }
