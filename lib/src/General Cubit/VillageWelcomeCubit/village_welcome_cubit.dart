
import 'package:bashir/src/Helpers/consts.dart';
import 'package:bashir/src/models/aboutVilageModel.dart';
import 'package:bashir/src/models/welcomeVillageModel.dart';
import 'package:bashir/src/network/NetworkUtlis.dart';
import 'package:bashir/src/network/azmyNetworkUtlis.dart';
import 'package:bashir/src/network/cachHelper.dart';
import 'package:bloc/bloc.dart';
// import 'package:easycard/src/Models/get/generalDataModel.dart';
// import 'package:easycard/src/Repository/appLocalization.dart';
// import 'package:easycard/src/Repository/cachHelper.dart';
// import 'package:easycard/src/Repository/networkUtlis.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'village_welcome_state.dart';

class VillageWelcomeCubit extends Cubit<VillageWelcomeState> {
  VillageWelcomeCubit() : super(VillageWelcomeInitial());

  static VillageWelcomeCubit get(context) => BlocProvider.of(context);

  NewNetworkUtil _utils = NewNetworkUtil();
  VillageWelcomeModel model ;


  getVillageWelcomeData() async {
    emit(VillageWelcomeLoadingState());

    _utils.get('knowledge_village_welcome',).then((value) {
      if (value.statusCode == 200) {
        print('knowledge_village_welcome=====Success');
        model = VillageWelcomeModel.fromJson(value.data);
        emit(VillageWelcomeSuccessState(model: model));
      } else {
        print('knowledge_village_welcome=====Failed');
        model = VillageWelcomeModel.fromJson(value.data);
        emit(VillageWelcomeErrorState(error: model.error[0].value));
      }
    }).catchError((error) {
      print("catchError : $error");
      emit(VillageWelcomeErrorState(error: customError));
    });
  }

}
