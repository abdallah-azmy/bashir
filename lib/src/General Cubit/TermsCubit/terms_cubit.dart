
import 'package:bashir/src/Helpers/consts.dart';
import 'package:bashir/src/models/aboutVilageModel.dart';
import 'package:bashir/src/models/termsModel.dart';
import 'package:bashir/src/network/azmyNetworkUtlis.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'terms_state.dart';

class TermsCubit extends Cubit<TermsState> {
  TermsCubit() : super(TermsInitial());

  static TermsCubit get(context) => BlocProvider.of(context);

  NewNetworkUtil _utils = NewNetworkUtil();
  TermsModel model ;


  getTermsData() async {
    emit(TermsLoadingState());

    _utils.get('terms-and-conditions',).then((value) {
      if (value.statusCode == 200) {
        print('terms-and-conditions=====Success');
        model = TermsModel.fromJson(value.data);
        emit(TermsSuccessState(model: model));
      } else {
        print('terms-and-conditions=====Failed');
        model = TermsModel.fromJson(value.data);
        emit(TermsErrorState(error: model.error[0].value));
      }
    }).catchError((error) {
      print("catchError : $error");
      emit(TermsErrorState(error: customError));
    });
  }

}
