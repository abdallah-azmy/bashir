part of 'reportNews_cubit.dart';


abstract class ReportNewsState {}

class ReportNewsInitial extends ReportNewsState {}
class ReportNewsLoadingState extends ReportNewsState {}
class ReportNewsSuccessState extends ReportNewsState {
  ReportModel model;
  ReportNewsSuccessState({this.model});
}
class ReportNewsErrorState extends ReportNewsState {
  final String error;
  ReportNewsErrorState({this.error});
}

