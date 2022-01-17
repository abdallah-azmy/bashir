import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';





class CustomNetworkImage extends StatelessWidget {
  final String image;
  final  fit;

  const CustomNetworkImage({Key key, @required this.image,this.fit}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (image == null || image == "https://easy-card.site/uploads/users/default.png") {
      return
        Container(
          color: Colors.white,
          child: Center(
            child:
                //"assets/logoFinal.png"
            Image.asset("assets/logoFinal.png",fit:BoxFit.fitWidth ,)
            // Lottie.asset(
            //   'assets/lolitJson/errorNotFound.json',
            //   fit: BoxFit.cover,
            //
            // ),
          ),
        );
    }
    try {
      return FadeInImage.assetNetwork(
       image: image,
        fit: fit ?? BoxFit.cover,

        imageErrorBuilder:
            (BuildContext context, Object exception, StackTrace stackTrace) {
          print('Error Handler getting CustomNetworkImage');
          return  Container(
            color: Colors.white,
            child: Center(
              child:
              Image.asset("assets/logoFinal.png",fit:BoxFit.fitWidth ,)
              // Lottie.asset(
              //   'assets/lolitJson/errorNotFound.json',
              //   fit: BoxFit.cover,
              //
              // ),
            ),
          );
        },
        fadeInDuration: Duration(milliseconds: 500),
        // placeholder: "assets/appleLoading.gif",
        placeholder: "assets/placeholder.png",


        // loadingBuilder: (BuildContext context, Widget child,
        //     ImageChunkEvent loadingProgress) {
        //   if (loadingProgress == null) return child;
        //   return Center(
        //     child: CircularProgressIndicator(
        //       color: MyColors.blueBlack2,
        //       value: loadingProgress.expectedTotalBytes != null
        //           ? loadingProgress.cumulativeBytesLoaded /
        //               loadingProgress.expectedTotalBytes
        //           : null,
        //     ),
        //   );
        // },
      );
    } catch (e) {
      print(e);
      return  Container(
        color: Colors.white,
        child: Center(
          child:
          Image.asset("assets/logoFinal.png",fit:BoxFit.fitWidth ,)
          // Lottie.asset(
          //   'assets/lolitJson/errorNotFound.json',
          //   fit: BoxFit.cover,
          //
          // ),
        ),
      );
    }
  }
}