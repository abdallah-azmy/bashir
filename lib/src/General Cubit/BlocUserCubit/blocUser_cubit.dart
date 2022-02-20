import 'package:bashir/src/UI/MainWidgets/toast.dart';
import 'package:bashir/src/models/blocModel.dart';
import 'package:bashir/src/models/reportModel.dart';
import 'package:bashir/src/network/azmyNetworkUtlis.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'blocUser_state.dart';

class BlocUserCubit extends Cubit<BlocUserState> {
  BlocUserCubit() : super(BlocUserInitial());

  static BlocUserCubit get(context) => BlocProvider.of(context);

  NewNetworkUtil _utils = NewNetworkUtil();
  BlocModel model;


  blocUser(int userId,int newsId,var fun ) async {
    emit(BlocUserLoadingState());
    FormData formData = FormData.fromMap({
      "user_id": userId,
      "news_id": newsId,
    });
    _utils.post('block_user', body: formData, ).then((value) {
      if (value.statusCode == 200) {
        print('block_user=====Success');
        model = BlocModel.fromJson(value.data);

        fun();
        showToast(
            msg: model.data.message,
            state: ToastStates.SUCCESS);

        emit(BlocUserSuccessState(model: model));
      } else {
        print('block_user=====Failed');
        model = BlocModel.fromJson(value.data);
        fun();
        showToast(msg: model.error[0].message, state: ToastStates.ERROR);

        emit(BlocUserErrorState(error: model.error[0].message));
      }
    }).catchError((error) {
      print("catchError : $error");
      emit(BlocUserErrorState(error: "حدث خطأ ما يرجي اعادة المحاولة"));
    });
  }
}
