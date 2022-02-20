part of 'blocUser_cubit.dart';


abstract class BlocUserState {}

class BlocUserInitial extends BlocUserState {}
class BlocUserLoadingState extends BlocUserState {}
class BlocUserSuccessState extends BlocUserState {
  BlocModel model;
  BlocUserSuccessState({this.model});
}
class BlocUserErrorState extends BlocUserState {
  final String error;
  BlocUserErrorState({this.error});
}

