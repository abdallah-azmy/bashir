part of 'terms_cubit.dart';


abstract class TermsState {}

class TermsInitial extends TermsState {}
class TermsLoadingState extends TermsState {}
class TermsSuccessState extends TermsState {
  TermsModel model;
  TermsSuccessState({this.model});
}
class TermsErrorState extends TermsState {
  final String error;
  TermsErrorState({this.error});
}

