import 'package:bashir/main.dart';
import 'package:bashir/src/General%20Cubit/SliderCubit/slider_cubit.dart';
import 'package:bashir/src/General%20Cubit/UnPinnedNewsCubit/unPinned_News_cubit.dart';
import 'package:bashir/src/UI/MainWidgets/app_error.dart';
import 'package:bashir/src/UI/MainWidgets/app_loader.dart';
import 'package:bashir/src/UI/MainWidgets/customCard.dart';
import 'package:bashir/src/UI/MainWidgets/customDrawer.dart';
import 'package:bashir/src/UI/MainWidgets/customWidgetBody.dart';
import 'package:bashir/src/UI/MainWidgets/list_animator.dart';
import 'package:bashir/src/UI/Notifications/notifications.dart';
import 'package:bashir/src/UI/SupScreens/News/newsDetails.dart';
import 'package:bashir/src/models/unPinNewsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Widgets/customCircleBtn.dart';
import 'Widgets/slider.dart';
import 'Widgets/unPinNewsScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
ScrollController _scrollController = ScrollController();
class _HomePageState extends State<HomePage> {
  List<Category> _list = [
    Category(label: 'عن القرية', img: 'assets/about.png', type: 0),
    Category(label: 'لحظة بلحظة', img: 'assets/timer.png', type: 5),
    Category(label: 'معرض الصور', img: 'assets/photo.png', type: 3),
    Category(label: 'معرض الفيديو', img: 'assets/video.png', type: 4),
    Category(label: 'ارسال خبر', img: 'assets/whatsapp.png', type: 1)
  ];
  int page = 1;
  bool canLoad = true;

  List<News> unpinnedNews = [];




  @override
  void initState() {
    UnPinnedNewsCubit.get(navigator.currentContext).getUnPinnedNews(page:  page);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent &&
          canLoad) {
        page++;
        UnPinnedNewsCubit.get(navigator.currentContext).getUnPinnedNews(page:  page);
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("قرية بشير"),
          centerTitle: true,
          leading: InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => Notifications())),
            child: Icon(Icons.notifications),
          ),
        ),
        endDrawer: CustomDrawer(),
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          onRefresh: () {
            // monitor network fetch
            canLoad = true;

            // if failed,use refreshFailed()
            page = 1;

            SliderCubit.get(context).getPinNews();
            return UnPinnedNewsCubit.get(context).getUnPinnedNews(page:  page);
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                // Container(
                //     color: Theme.of(context).primaryColor,
                //     height: 240,
                //     child: SliderWidget()),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    height: 100,
                    child: Center(
                        child: ListAnimator(
                      physics: false,
                      scrollDirection: Axis.horizontal,
                      data: _list,
                      child: (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomCircleBtn(
                            title: _list[index].label,
                            img: _list[index].img,
                            type: _list[index].type,
                          ),
                        );
                      },
                    )),
                  ),
                ),
                BlocConsumer<UnPinnedNewsCubit, UnPinnedNewsState>(
                    listener:(context, state){
                      if(state is UnPinnedNewsSuccessState){
                        if(state.model.data.data != null){
                          if(state.model.data.data.length < 10){
                            canLoad = false;
                          }
                        }

                        if (page == 1) {
                          unpinnedNews = state.model.data.data;
                        }else{
                          unpinnedNews.addAll(state.model.data.data);
                        }

                      }

                    } ,
                    builder: (context, state) {
                      // var cubit = UnPinnedNewsCubit.get(context);
                      return (state is UnPinnedNewsLoadingState)
                          ? AppLoader(
                        height: MediaQuery.of(context).size.height * .3,
                      )
                          : (state is UnPinnedNewsErrorState)
                          ? AppError(
                        height:
                        MediaQuery.of(context).size.height * .3,
                        text: state.error,
                      )
                      //     : unpinnedNews.length == 0 ?
                      // AppError(
                      //   height:
                      //   MediaQuery.of(context).size.height * .3,
                      // )
                      : ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          ListAnimator(
                            physics: false,
                            data: unpinnedNews,
                            child: (index) {
                              return CustomCard(
                                image: unpinnedNews[index]
                                    .photos
                                    .length ==
                                    0
                                    ? ""
                                    : unpinnedNews[index]
                                    .photos[0].photo,
                                title: unpinnedNews[index]
                                    .title,
                                createdAt:
                                unpinnedNews[index]
                                    .createdAt,
                                numComment: unpinnedNews[index]
                                    .comments.length,
                                seen: unpinnedNews[index]
                                    .seen,
                                newsId: unpinnedNews[index]
                                    .id,
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

                                            videosLinks: unpinnedNews[index]
                                                .videoLinks
                                            ,
                                            phones: unpinnedNews[index]
                                                .phones,
                                            createAt:
                                            DateTime.now(),
                                            comments: unpinnedNews[index]
                                                .comments,
                                            newsId: unpinnedNews[index]
                                                .id,
                                            seen: unpinnedNews[index]
                                                .seen,
                                          )));
                                  // .then((val) =>
                                  // val ? _getData() : _getData());
                                },
                              );
                            },
                          ),

                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (c) =>
                                          UnPinNewsScreen()));
                            },
                            child: Container(
                              color: Colors.grey[100],
                              height: 50,
                              child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "رؤية المزيد من الاخبار",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700]),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 15,
                                        color: Colors.grey[700],
                                      )
                                    ],
                                  )),
                            ),
                          )
                        ],
                      );
                    })
              ],
            ),
          ),
        ));
  }
}

class Category {
  String label;
  String img;
  int type;

  Category({this.label, this.img, this.type});
}
