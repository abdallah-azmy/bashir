import 'package:bashir/src/General%20Cubit/BlocUserCubit/blocUser_cubit.dart';
import 'package:bashir/src/General%20Cubit/CommentsCubit/comments_cubit.dart';
import 'package:bashir/src/Helpers/myColors.dart';
import 'package:bashir/src/UI/Basics/Register/Login/login.dart';
import 'package:bashir/src/UI/MainWidgets/app_error.dart';
import 'package:bashir/src/UI/MainWidgets/commentCard.dart';
import 'package:bashir/src/UI/MainWidgets/customBtn.dart';
import 'package:bashir/src/UI/MainWidgets/customCircularLoading.dart';
import 'package:bashir/src/UI/MainWidgets/list_animator.dart';
import 'package:bashir/src/network/cachHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart' as intl;

class AddComment extends StatefulWidget {
  final int newsId;

  const AddComment({Key key,  this.newsId}) : super(key: key);

  @override
  _AddCommentState createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
 

  @override
  void initState() {
    CommentsCubit.get(context).getComments(id: widget.newsId);
    super.initState();
  }


  String comment;
  String token;
  // bool _load = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("التعليقات"),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context, true);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body:

      RefreshIndicator(
        onRefresh: () {
          return CommentsCubit.get(context).getComments(id: widget.newsId);
        },
        child: BlocBuilder<CommentsCubit, CommentsState>(
          builder: (context, state) {
            var cubit = CommentsCubit.get(context);
            return Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child:
              CacheHelper.getData(key: 'token') == null
                  ? Center(
                child: CustomBtn(
                    text: 'تسجيل الدخول',
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => LoginPage()));
                    },
                    color: Theme.of(context).primaryColor),
              )
                  :
              (state is CommentsLoadingState)
                  ? Center(
                child: SpinKitThreeBounce(
                  size: 25,
                  color: Theme.of(context).primaryColor,
                ),
              )
                  :   Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    (state is CommentsErrorState)
                        ? AppError(
                      height: MediaQuery.of(context).size.height * .7,
                      text: state.error,
                    )
                        :   Flexible(
                      child: ListAnimator(
                        data: cubit.comments,
                        child: (index) {
                          return InkWell(
                            onTap: (){


                              blocUserAlert(user: cubit.comments[index].user,id: cubit.comments[index].userId,newsId:cubit.comments[index].newsPaperId );

                            },
                            child: CommentCard(
                              index: index,
                              comment: cubit.comments[index].comment,
                              name: cubit.comments[index].user,
                              data: intl.DateFormat.yMd()
                                  .format(cubit.comments[index].createdAt),
                              img: cubit.comments[index].userPhoto,
                            ),
                          );
                        },

                      ),
                    ),
                    // Flexible(
                    //   child: ListView.builder(
                    //     physics: ScrollPhysics(),
                    //     shrinkWrap: true,
                    //     itemCount: cubit.comments == null ? 0 : cubit.comments.length,
                    //     itemBuilder: (BuildContext context, int index) {
                    //       return CommentCard(
                    //         index: index,
                    //         comment: cubit.comments[index].comment,
                    //         name: cubit.comments[index].user,
                    //         data: intl.DateFormat.yMd()
                    //             .format(cubit.comments[index].createdAt),
                    //         img: cubit.comments[index].userPhoto,
                    //       );
                    //     },
                    //   ),
                    // ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Directionality(
                              //   textDirection: p.TextDirection.rtl,
                              textDirection: TextDirection.rtl,
                              child: TextField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  maxLength: 200,
                                  decoration: InputDecoration.collapsed(
                                      hintText: "التعليق"),
                                  onChanged: (value) {
                                    setState(() {
                                      comment = value;
                                    });
                                    cubit.comment = value ;
                                  }),
                            ),
                          ),
                        (state is AddCommentLoadingState)
                              ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomCircularLoading()
                          )
                              : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 10,
                              child: InkWell(
                                onTap: () {
                                  cubit.addComment(id: widget.newsId);
                                  // _saveForm();
                                },
                                child: Text(
                                  "ارسال",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                          // IconButton(
                          //   icon: Icon(
                          //     Icons.send,
                          //     color: Theme.of(context).primaryColor,
                          //   ),
                          //   onPressed: () {
                          //  print("${comment}.................");
                          //      print("${widget.newsId}.................");
                          //     _saveForm();

                          //   },
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      )
      
      
    
    
    
    );
  }


  refreshFunc(){
       CommentsCubit.get(context).getComments(id: widget.newsId);
  }

  blocUserAlert({String user, int id, int newsId}) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            backgroundColor: Colors.white,
            content: Container(
                height: 150,
                decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "حظر المستخدم $user",
                        style: MyColors.styleBold1,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Flexible(
                            child: CustomBtn(
                              onTap: () {
                                Navigator.pop(context);
                                BlocUserCubit.get(context).blocUser(id,newsId,refreshFunc);
                              },
                              text: "حظر",
//                              width: 85.0,
                              color: Colors.red,

                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          );
        });
  }

}
