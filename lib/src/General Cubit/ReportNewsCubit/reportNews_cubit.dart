import 'package:bashir/src/UI/MainWidgets/toast.dart';
import 'package:bashir/src/models/reportModel.dart';
import 'package:bashir/src/network/azmyNetworkUtlis.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'reportNews_state.dart';

class ReportNewsCubit extends Cubit<ReportNewsState> {
  ReportNewsCubit() : super(ReportNewsInitial());

  static ReportNewsCubit get(context) => BlocProvider.of(context);

  NewNetworkUtil _utils = NewNetworkUtil();
  ReportModel model;


  reportNews(int newsId ,String message) async {
    emit(ReportNewsLoadingState());
    FormData formData = FormData.fromMap({
      "news_id": newsId,
      "report": message,
    });
    _utils.post('report_news', body: formData, ).then((value) {
      if (value.statusCode == 200) {
        print('report_news=====Success');
        model = ReportModel.fromJson(value.data);
        showToast(
            msg: model.data.message,
            state: ToastStates.SUCCESS);

        emit(ReportNewsSuccessState(model: model));
      } else {
        print('report_news=====Failed');
        model = ReportModel.fromJson(value.data);
        showToast(msg: model.error[0].value, state: ToastStates.ERROR);

        emit(ReportNewsErrorState(error: model.error[0].value));
      }
    }).catchError((error) {
      print("catchError : $error");
      emit(ReportNewsErrorState(error: "حدث خطأ ما يرجي اعادة المحاولة"));
    });
  }
}
