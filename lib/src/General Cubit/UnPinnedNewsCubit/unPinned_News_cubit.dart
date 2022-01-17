
import 'dart:convert';

import 'package:bashir/src/models/unPinNewsModel.dart';
import 'package:bashir/src/network/azmyNetworkUtlis.dart';
import 'package:bloc/bloc.dart';
// import 'package:easycard/src/Models/get/cardsAdvantagesModel.dart';
// import 'package:easycard/src/Repository/appLocalization.dart';
// import 'package:easycard/src/Repository/networkUtlis.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'unPinned_News_state.dart';

class UnPinnedNewsCubit extends Cubit<UnPinnedNewsState> {
  UnPinnedNewsCubit() : super(UnPinnedNewsInitial());

  static UnPinnedNewsCubit get(context) => BlocProvider.of(context);

  NewNetworkUtil _utils = NewNetworkUtil();

  UnPinNewsModel model ;
  getUnPinnedNews({String status,int page}) async {
    if (page == 1) {
      emit(UnPinnedNewsLoadingState());
    } else {
      emit(UnPinnedNewsMoreLoadingState());
    }
    // _utils.get('un_pinned_news', body: {
    _utils.get('un_pinned_newsPaginate', body: {
    'page': page
    }
    ).then((value) {
      if (value.statusCode == 200) {
        print('un_pinned_news=====Success');
        print('0000000000000000=====${value.data}');




        model = UnPinNewsModel.fromJson(value.data);






        emit(UnPinnedNewsSuccessState(model: model));

      } else {
        print('un_pinned_news=====Failed');
        model = UnPinNewsModel.fromJson(value.data);
        emit(UnPinnedNewsErrorState(error: model.error[0].value));
      }
    }).catchError((error) {
      print("catchError : $error");
      emit(UnPinnedNewsErrorState(error:"حدث خطأ ما ... يرجي اعادة المحاولة"));
    });
  }

}
