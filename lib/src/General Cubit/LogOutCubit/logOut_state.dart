part of 'logOut_cubit.dart';


abstract class LogOutState {}

class LogOutInitial extends LogOutState {}
class LogOutLoadingState extends LogOutState {}
class LogOutSuccessState extends LogOutState {
  LogoutModel model;
  LogOutSuccessState({this.model});
}
class LogOutErrorState extends LogOutState {
  final String error;
  LogOutErrorState({this.error});
}

