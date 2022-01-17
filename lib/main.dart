import 'package:bashir/src/Helpers/consts.dart';
import 'package:bashir/src/app.dart';
import 'package:bashir/src/network/bloc_observer.dart';
import 'package:bashir/src/network/cachHelper.dart';
import 'package:bashir/src/network/firebaseNotifications.dart';
import 'package:bashir/src/provider/deviceTokenProvider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  await FirebaseMessaging.instance.getToken().then((value) {
    print("fcmToken : $value");
    CacheHelper.saveData(key: 'fcmToken', value: value);
    DeviceTokenProvider().getToken(value);
  });
  deviceToken = CacheHelper.getData(key: 'fcmToken');
  FirebaseNotifications().setUpFirebase();
  runApp(App());
}
