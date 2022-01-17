import 'package:bashir/main.dart';
import 'package:bashir/src/General%20Cubit/UnPinnedNewsCubit/unPinned_News_cubit.dart';
import 'package:bashir/src/UI/MainWidgets/app_error.dart';
import 'package:bashir/src/UI/MainWidgets/app_loader.dart';
import 'package:bashir/src/UI/MainWidgets/customCard.dart';
import 'package:bashir/src/UI/MainWidgets/customWidgetBody.dart';
import 'package:bashir/src/UI/MainWidgets/list_animator.dart';
import 'package:bashir/src/UI/SupScreens/News/newsDetails.dart';
import 'package:bashir/src/models/unPinNewsModel.dart';
import 'package:bashir/src/provider/unPinNews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class UnPinNewsScreen extends StatefulWidget {
  @override
  _UnPinNewsScreenState createState() => _UnPinNewsScreenState();
}

class _UnPinNewsScreenState extends State<UnPinNewsScreen> {
  ScrollController _scrollController = ScrollController();
  int page = 1;
  bool canLoad = true;

  List<News> unpinnedNews = [];
  bool _enabled = true;

  @override
  void initState() {
    UnPinnedNewsCubit.get(navigator.currentContext).getUnPinnedNews(page: page);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          canLoad) {
        page++;

        UnPinnedNewsCubit.get(navigator.currentContext)
            .getUnPinnedNews(page: page);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: () {
              setState(() {
                _enabled = !_enabled;
              });
            },
            child: Text('جميع الاخبار')),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocConsumer<UnPinnedNewsCubit, UnPinnedNewsState>(
          listener: (context, state) {
        if (state is UnPinnedNewsSuccessState) {
          if (state.model.data.data != null) {
            if (state.model.data.data.length < 10) {
              canLoad = false;
            }
          }

          if (page == 1) {
            unpinnedNews = state.model.data.data;
          } else {
            unpinnedNews.addAll(state.model.data.data);
          }
        }
      }, builder: (context, state) {
        // var cubit = UnPinnedNewsCubit.get(context);
        return (state is UnPinnedNewsLoadingState)
            ? AppLoader(
                height: MediaQuery.of(context).size.height * .7,
              )
            : (state is UnPinnedNewsErrorState)
                ? AppError(
                    height: MediaQuery.of(context).size.height * .7,
                    text: state.error,
                  )
                //     : unpinnedNews.length == 0 ?
                // AppError(
                //   height:
                //   MediaQuery.of(context).size.height * .3,
                // )
                : ListView(
                    shrinkWrap: true,
                    controller: _scrollController,
                    children: [
                      (state is UnPinnedNewsMoreLoadingState)
                          ? Shimmer.fromColors(
                              baseColor: Colors.grey[300],
                              highlightColor: Colors.grey[100],
                              enabled: _enabled,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: unpinnedNews.length,
                                itemBuilder: (BuildContext context, index) {
                                  return CustomCard(
                                    image: unpinnedNews[index].photos.length ==
                                            0
                                        ? ""
                                        : unpinnedNews[index].photos[0].photo,
                                    title: unpinnedNews[index].title,
                                    createdAt: unpinnedNews[index].createdAt,
                                    numComment:
                                        unpinnedNews[index].comments.length,
                                    seen: unpinnedNews[index].seen,
                                    newsId: unpinnedNews[index].id,
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => NewsDetails(
                                                    title: unpinnedNews[index]
                                                        .title,
                                                    content: unpinnedNews[index]
                                                        .content,
                                                    images: unpinnedNews[index]
                                                        .photos,
                                                    videos: unpinnedNews[index]
                                                        .videos,
                                                    videosLinks:
                                                        unpinnedNews[index]
                                                            .videoLinks,
                                                    phones: unpinnedNews[index]
                                                        .phones,
                                                    createAt: DateTime.now(),
                                                    comments:
                                                        unpinnedNews[index]
                                                            .comments,
                                                    newsId:
                                                        unpinnedNews[index].id,
                                                    seen: unpinnedNews[index]
                                                        .seen,
                                                  )));
                                      // .then((val) =>
                                      // val ? _getData() : _getData());
                                    },
                                  );
                                },
                              ),
                            )
                          : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: unpinnedNews.length,
                        itemBuilder: (BuildContext context, index) {
                          return CustomCard(
                            image: unpinnedNews[index].photos.length ==
                                0
                                ? ""
                                : unpinnedNews[index].photos[0].photo,
                            title: unpinnedNews[index].title,
                            createdAt: unpinnedNews[index].createdAt,
                            numComment:
                            unpinnedNews[index].comments.length,
                            seen: unpinnedNews[index].seen,
                            newsId: unpinnedNews[index].id,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => NewsDetails(
                                        title: unpinnedNews[index]
                                            .title,
                                        content: unpinnedNews[index]
                                            .content,
                                        images: unpinnedNews[index]
                                            .photos,
                                        videos: unpinnedNews[index]
                                            .videos,
                                        videosLinks:
                                        unpinnedNews[index]
                                            .videoLinks,
                                        phones: unpinnedNews[index]
                                            .phones,
                                        createAt: DateTime.now(),
                                        comments:
                                        unpinnedNews[index]
                                            .comments,
                                        newsId:
                                        unpinnedNews[index].id,
                                        seen: unpinnedNews[index]
                                            .seen,
                                      )));
                              // .then((val) =>
                              // val ? _getData() : _getData());
                            },
                          );
                        },
                      ),

                      // InkWell(
                      //   onTap: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (c) =>
                      //                 UnPinNewsScreen()));
                      //   },
                      //   child: Container(
                      //     color: Colors.grey[100],
                      //     height: 50,
                      //     child: Center(
                      //         child: Row(
                      //           mainAxisAlignment:
                      //           MainAxisAlignment.center,
                      //           children: <Widget>[
                      //             Text(
                      //               "رؤية المزيد من الاخبار",
                      //               style: TextStyle(
                      //                   fontSize: 15,
                      //                   fontWeight: FontWeight.bold,
                      //                   color: Colors.grey[700]),
                      //             ),
                      //             Icon(
                      //               Icons.arrow_forward_ios,
                      //               size: 15,
                      //               color: Colors.grey[700],
                      //             )
                      //           ],
                      //         )),
                      //   ),
                      // )
                    ],
                  );
      }),
    );
  }
}
