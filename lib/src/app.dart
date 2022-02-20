import 'package:bashir/main.dart';
import 'package:bashir/src/General%20Cubit/AboutVillageCubit/about_village_cubit.dart';
import 'package:bashir/src/General%20Cubit/AddToFavCubit/add_toFav_cubit.dart';
import 'package:bashir/src/General%20Cubit/AdminPhoneCubit/admin_phone_cubit.dart';
import 'package:bashir/src/General%20Cubit/BlocUserCubit/blocUser_cubit.dart';
import 'package:bashir/src/General%20Cubit/ChangePasswordCubit/change_password_cubit.dart';
import 'package:bashir/src/General%20Cubit/CommentsCubit/comments_cubit.dart';
import 'package:bashir/src/General%20Cubit/ContactUsCubit/contactUs_cubit.dart';
import 'package:bashir/src/General%20Cubit/EditProfileCubit/editProfile_cubit.dart';
import 'package:bashir/src/General%20Cubit/FavouriteNewsCubit/fav_News_cubit.dart';
import 'package:bashir/src/General%20Cubit/LogOutCubit/logOut_cubit.dart';
import 'package:bashir/src/General%20Cubit/MomentByMomentGalleryCubit/moment_by_moment_cubit.dart';
import 'package:bashir/src/General%20Cubit/NotificationsCubit/notifications_cubit.dart';
import 'package:bashir/src/General%20Cubit/PhotoGalleryCubit/photo_gallery_cubit.dart';
import 'package:bashir/src/General%20Cubit/ReportNewsCubit/reportNews_cubit.dart';
import 'package:bashir/src/General%20Cubit/SeenCubit/seen_cubit.dart';
import 'package:bashir/src/General%20Cubit/SliderCubit/slider_cubit.dart';
import 'package:bashir/src/General%20Cubit/TermsCubit/terms_cubit.dart';
import 'package:bashir/src/General%20Cubit/UnPinnedNewsCubit/unPinned_News_cubit.dart';
import 'package:bashir/src/General%20Cubit/VideoGalleryCubit/video_gallery_cubit.dart';
import 'package:bashir/src/General%20Cubit/VillageWelcomeCubit/village_welcome_cubit.dart';
import 'package:bashir/src/UI/Basics/Register/Login/loginCubit/login_cubit.dart';
import 'package:bashir/src/UI/Basics/Register/SignUp/signUpCubit/sign_up_cubit.dart';
import 'package:bashir/src/UI/Basics/Register/confirmCode/confirmCodeCubit/confirm_code_cubit.dart';
import 'package:bashir/src/UI/Basics/Register/forgetPassword/forgetPasswordCubit/forget_password_cubit.dart';
import 'package:bashir/src/provider/addCommenProvider.dart';
import 'package:bashir/src/provider/addToFavProvider.dart';
import 'package:bashir/src/provider/deletFavProvider.dart';
import 'package:bashir/src/provider/deletNotificationProvider.dart';
import 'package:bashir/src/provider/getCommentByIdProvider.dart';
import 'package:bashir/src/provider/getFavProvider.dart';
import 'package:bashir/src/provider/getNewsByIdProvider.dart';
import 'package:bashir/src/provider/seenProvider.dart';
import 'package:bashir/src/provider/unPinNews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'UI/Intro/splash.dart';
import 'UI/Notifications/notificationDetails.dart';


class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String newsId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>LoginCubit()),
        BlocProvider(create: (_)=>SignUpCubit()),
        BlocProvider(create: (_)=>ForgetPasswordCubit()),
        BlocProvider(create: (_)=>ConfirmCodeCubit()),
        BlocProvider(create: (_)=>ForgetPasswordCubit()),
        BlocProvider(create: (_)=>LogOutCubit()),



        BlocProvider(create: (_)=>SliderCubit()),
        BlocProvider(create: (_)=>UnPinnedNewsCubit()),
        BlocProvider(create: (_)=>ContactUsCubit()),
        BlocProvider(create: (_)=>NotificationsCubit()),
        BlocProvider(create: (_)=>FavNewsCubit()),
        BlocProvider(create: (_)=>EditProfileCubit()),
        BlocProvider(create: (_)=>AboutVillageCubit()),
        BlocProvider(create: (_)=>VillageWelcomeCubit()),
        BlocProvider(create: (_)=>AdminPhoneCubit()),
        BlocProvider(create: (_)=>ChangePasswordCubit()),
        BlocProvider(create: (_)=>SeenCubit()),
        BlocProvider(create: (_)=>AddToFavCubit()),
        BlocProvider(create: (_)=>PhotoGalleryCubit()),
        BlocProvider(create: (_)=>VideoGalleryCubit()),
        BlocProvider(create: (_)=>MomentByMomentCubit()),
        BlocProvider(create: (_)=>CommentsCubit()),
        BlocProvider(create: (_)=>ReportNewsCubit()),
        BlocProvider(create: (_)=>BlocUserCubit()),
        BlocProvider(create: (_)=>TermsCubit()),




        // BlocProvider(create: (_)=>NewNotificationCubit()..getNewNotifications(context: context)),


      ],
      child: MultiProvider(
        providers: [

          ChangeNotifierProvider.value(value: UnPinNewsProvider()),
          ChangeNotifierProvider.value(value: AddToFavProvider()),
          ChangeNotifierProvider.value(value: AddCommentProvider()),
          ChangeNotifierProvider.value(value: GetNewsByIdProvider()),
          ChangeNotifierProvider.value(value: SeenProvider()),
          ChangeNotifierProvider.value(value: DeletNotificationProvider()),
          ChangeNotifierProvider.value(value: GetCommentsByIdProvider()),
          ChangeNotifierProvider.value(value: GetFavProvider()),
          ChangeNotifierProvider.value(value: DeletFavProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigator,
          theme: ThemeData(primaryColor: Color.fromRGBO(52, 128, 90, 1)),
          routes: <String, WidgetBuilder>{
            '/': (BuildContext context) => SplashScreen(),
            '/news': (BuildContext context) =>
                NotificationDetails(
                  id: int.parse(newsId),
                ),
          },
          title: "قرية البشير",
        ),
      ),
    );
  }
}
