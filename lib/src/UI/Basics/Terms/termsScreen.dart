import 'package:bashir/src/General%20Cubit/AboutVillageCubit/about_village_cubit.dart';
import 'package:bashir/src/General%20Cubit/TermsCubit/terms_cubit.dart';
import 'package:bashir/src/UI/MainWidgets/app_error.dart';
import 'package:bashir/src/UI/MainWidgets/customDrawer.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsScreen extends StatefulWidget {
  @override
  _TermsScreenState createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {


  @override
  void initState() {
    TermsCubit.get(context).getTermsData();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('الشروط و الاحكام', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<TermsCubit,TermsState>(
        builder: (context,state){
          var cubit = TermsCubit.get(context);
          return


          (state is TermsLoadingState)
              ? Center(
            child: SpinKitThreeBounce(
              size: 25,
              color: Theme.of(context).primaryColor,
            ),
          )
              : (state is TermsErrorState)
              ? AppError(
            height: MediaQuery.of(context).size.height * .7,
            text: state.error,
          )

              :

          Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text(
                        cubit.model.data.title,
                        style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text(
                        cubit.model.data.content,
                        style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      )
    );
  }
}
