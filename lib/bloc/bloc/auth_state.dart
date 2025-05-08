part of 'auth_bloc.dart';

sealed class AuthState {}

class AuthInitial extends AuthState {}

class LoginInitial extends AuthState {}

class Loginloading extends AuthState {}

class LoginSccuss extends AuthState {}

class LoginFailure extends AuthState {
  String errmassage;
  LoginFailure({required this.errmassage});
}

class RegisterInitial extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterFailure extends AuthState {
  String errmassage;
  RegisterFailure({required this.errmassage});
}
