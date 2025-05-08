import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(Loginloading());
        try {
          UserCredential user = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: event.email, password: event.password);
          emit(LoginSccuss());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(LoginFailure(errmassage: e.toString()));
          } else if (e.code ==
              'FirebaseAuthException ([firebase_auth/invalid-credential] The supplied auth credential is incorrect, malformed or has expired') {
            emit(LoginFailure(errmassage: e.toString()));
          } else {
            emit(LoginFailure(errmassage: 'some thing went wrong'));
          }
        } on Exception catch (e) {
          emit(LoginFailure(errmassage: e.toString()));
        }
      } else if (event is RegisterEvent) {
        emit(RegisterInitial());

        try {
          UserCredential user = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: event.email, password: event.password);
          emit(RegisterSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            emit(RegisterFailure(errmassage: e.toString()));
          } else if (e.code == 'email-already-in-use') {
            emit(RegisterFailure(errmassage: e.toString()));
          }
        } on Exception catch (e) {
          emit(RegisterFailure(errmassage: e.toString()));
        }
      }
    });
  }
}
