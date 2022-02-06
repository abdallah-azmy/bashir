import 'package:bashir/main.dart';
import 'package:bashir/src/Helpers/consts.dart';
import 'package:bashir/src/Helpers/route.dart';
import 'package:bashir/src/UI/Intro/splash.dart';
import 'package:bashir/src/UI/MainWidgets/toast.dart';
import 'package:bashir/src/models/logOutModel.dart';
import 'package:bashir/src/network/azmyNetworkUtlis.dart';
import 'package:bashir/src/network/cachHelper.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'logOut_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit() : super(LogOutInitial());

  static LogOutCubit get(context) => BlocProvider.of(context);

  NewNetworkUtil _utils = NewNetworkUtil();
  LogoutModel logOutModel;

  String message = "";

  logOut() async {
    emit(LogOutLoadingState());
    FormData formData = FormData.fromMap({
      "device_token": deviceToken,
    });
    _utils
        .post(
      'logout',
      body: formData,
    )
        .then((value) {
      if (value.statusCode == 200) {
        print('logout=====Success');
        logOutModel = LogoutModel.fromJson(value.data);

        emit(LogOutSuccessState(model: logOutModel));
        CacheHelper.removeData(key: "token");
        CacheHelper.removeData(key: "userData");
        showToast(msg: "تم تسجيل الخروج بنجاح", state: ToastStates.ERROR);
        pushAndRemoveUntil(navigator.currentContext, SplashScreen());

      } else {
        print('logout=====Failed');
        logOutModel = LogoutModel.fromJson(value.data);
        showToast(msg: logOutModel.error[0].value, state: ToastStates.ERROR);
        emit(LogOutErrorState(error: logOutModel.error[0].value));
      }
    }).catchError((error) {
      print("catchError : $error");
      emit(LogOutErrorState(error: "حدث خطأ ما"));
    });
  }
}
