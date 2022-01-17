// // // To parse this JSON data, do
// // //
// // //     final unPinNewsModel = unPinNewsModelFromJson(jsonString);
// //
// // import 'dart:convert';
// //
// // UnPinNewsModel unPinNewsModelFromJson(String str) =>
// //     UnPinNewsModel.fromJson(json.decode(str));
// //
// // String unPinNewsModelToJson(UnPinNewsModel data) => json.encode(data.toJson());
// //
// // class UnPinNewsModel {
// //   int mainCode;
// //   int code;
// //   List<UnPinnedNews> data;
// //   dynamic error;
// //
// //   UnPinNewsModel({
// //     this.mainCode,
// //     this.code,
// //     this.data,
// //     this.error,
// //   });
// //
// //   factory UnPinNewsModel.fromJson(Map<String, dynamic> json) => UnPinNewsModel(
// //         mainCode: json["mainCode"],
// //         code: json["code"],
// //         data: json["data"] == null
// //             ? null
// //             : List<UnPinnedNews>.from(json["data"].map((x) => UnPinnedNews.fromJson(x))),
// //         error: json["error"],
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "mainCode": mainCode,
// //         "code": code,
// //         "data": List<dynamic>.from(data.map((x) => x.toJson())),
// //         "error": error,
// //       };
// // }
// //
// // class UnPinnedNews {
// //   int id;
// //   int categoryId;
// //   String category;
// //   String title;
// //   String content;
// //   List<Photo> photos;
// //   List<Video> videos;
// //   List<VideoLink> videoLinks;
// //   List<Phone> phones;
// //   List<Comment> comments;
// //   int seen;
// //   DateTime createdAt;
// //
// //   UnPinnedNews({
// //     this.id,
// //     this.categoryId,
// //     this.category,
// //     this.title,
// //     this.content,
// //     this.photos,
// //     this.videos,
// //     this.videoLinks,
// //     this.phones,
// //     this.comments,
// //     this.seen,
// //     this.createdAt,
// //   });
// //
// //   factory UnPinnedNews.fromJson(Map<String, dynamic> json) => UnPinnedNews(
// //         id: json["id"],
// //         categoryId: json["category_id"],
// //         category: json["category"],
// //         title: json["title"],
// //         content: json["content"],
// //         photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
// //         videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
// //     videoLinks: json["video_links"] == null ? null : List<VideoLink>.from(json["video_links"].map((x) => VideoLink.fromJson(x))),
// //     phones: json["phones"] == null ? null : List<Phone>.from(json["phones"].map((x) => Phone.fromJson(x))),
// //         comments: List<Comment>.from(
// //             json["comments"].map((x) => Comment.fromJson(x))),
// //         seen: json["seen"],
// //         createdAt: DateTime.parse(json["created_at"]),
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "category_id": categoryId,
// //         "category": category,
// //         "title": title,
// //         "content": content,
// //         "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
// //         "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
// //     "video_links": videoLinks == null ? null : List<dynamic>.from(videoLinks.map((x) => x.toJson())),
// //     "phones": phones == null ? null : List<dynamic>.from(phones.map((x) => x.toJson())),
// //         "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
// //         "seen": seen,
// //         "created_at":
// //             "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
// //       };
// // }
// //
// // class Comment {
// //   int id;
// //   int userId;
// //   String user;
// //   String comment;
// //   DateTime createdAt;
// //
// //   Comment({
// //     this.id,
// //     this.userId,
// //     this.user,
// //     this.comment,
// //     this.createdAt,
// //   });
// //
// //   factory Comment.fromJson(Map<String, dynamic> json) => Comment(
// //         id: json["id"],
// //         userId: json["user_id"],
// //         user: json["user"],
// //         comment: json["comment"],
// //         createdAt: DateTime.parse(json["created_at"]),
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "user_id": userId,
// //         "user": user,
// //         "comment": comment,
// //         "created_at":
// //             "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
// //       };
// // }
// //
// // class Video {
// //   String video;
// //
// //   Video({
// //     this.video,
// //   });
// //
// //   factory Video.fromJson(Map<String, dynamic> json) => Video(
// //     video: json["video"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "video": video,
// //   };
// // }
// //
// // class VideoLink {
// //   String videoLink;
// //
// //   VideoLink({
// //     this.videoLink,
// //   });
// //
// //   factory VideoLink.fromJson(Map<String, dynamic> json) => VideoLink(
// //     videoLink: json["video_link"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "video_link": videoLink,
// //   };
// // }
// //
// // class Photo {
// //   String photo;
// //
// //   Photo({
// //     this.photo,
// //   });
// //
// //   factory Photo.fromJson(Map<String, dynamic> json) => Photo(
// //         photo: json["photo"],
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "photo": photo,
// //       };
// // }
// // class Phone {
// //   Phone({
// //     this.name,
// //     this.phone,
// //   });
// //
// //   String name;
// //   String phone;
// //
// //   factory Phone.fromJson(Map<String, dynamic> json) => Phone(
// //     name: json["name"] == null ? null : json["name"],
// //     phone: json["phone"] == null ? null : json["phone"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "name": name == null ? null : name,
// //     "phone": phone == null ? null : phone,
// //   };
// // }
//
//
//
// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);
//
// import 'dart:convert';
//
// UnPinNewsModel welcomeFromJson(String str) => UnPinNewsModel.fromJson(json.decode(str));
//
// String welcomeToJson(UnPinNewsModel data) => json.encode(data.toJson());
//
// class UnPinNewsModel {
//   UnPinNewsModel({
//     this.mainCode,
//     this.code,
//     this.data,
//     this.error,
//   });
//
//   int mainCode;
//   int code;
//   Data data;
//   List<Error> error;
//
//   factory UnPinNewsModel.fromJson(Map<String, dynamic> json) => UnPinNewsModel(
//     mainCode: json["mainCode"] == null ? null : json["mainCode"],
//     code: json["code"] == null ? null : json["code"],
//     data: json["data"] == null ? null : Data.fromJson(json["data"]),
//     error: json["error"] == null ? null : List<Error>.from(json["error"].map((x) => Error.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "mainCode": mainCode == null ? null : mainCode,
//     "code": code == null ? null : code,
//     "data": data == null ? null : data.toJson(),
//     "error": error == null ? null : List<dynamic>.from(error.map((x) => x.toJson())),
//   };
// }
//
// class Data {
//   Data({
//     this.currentPage,
//     this.data,
//     this.firstPageUrl,
//     this.from,
//     this.lastPage,
//     this.lastPageUrl,
//     this.nextPageUrl,
//     this.path,
//     this.perPage,
//     this.prevPageUrl,
//     this.to,
//     this.total,
//   });
//
//   int currentPage;
//   List<UnPinnedNews> data;
//   String firstPageUrl;
//   int from;
//   int lastPage;
//   String lastPageUrl;
//   String nextPageUrl;
//   String path;
//   int perPage;
//   dynamic prevPageUrl;
//   int to;
//   int total;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     currentPage: json["current_page"] == null ? null : json["current_page"],
//     data: json["data"] == null ? null : List<UnPinnedNews>.from(json["data"].map((x) => UnPinnedNews.fromJson(x))),
//     firstPageUrl: json["first_page_url"] == null ? null : json["first_page_url"],
//     from: json["from"] == null ? null : json["from"],
//     lastPage: json["last_page"] == null ? null : json["last_page"],
//     lastPageUrl: json["last_page_url"] == null ? null : json["last_page_url"],
//     nextPageUrl: json["next_page_url"] == null ? null : json["next_page_url"],
//     path: json["path"] == null ? null : json["path"],
//     perPage: json["per_page"] == null ? null : json["per_page"],
//     prevPageUrl: json["prev_page_url"],
//     to: json["to"] == null ? null : json["to"],
//     total: json["total"] == null ? null : json["total"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "current_page": currentPage == null ? null : currentPage,
//     "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
//     "first_page_url": firstPageUrl == null ? null : firstPageUrl,
//     "from": from == null ? null : from,
//     "last_page": lastPage == null ? null : lastPage,
//     "last_page_url": lastPageUrl == null ? null : lastPageUrl,
//     "next_page_url": nextPageUrl == null ? null : nextPageUrl,
//     "path": path == null ? null : path,
//     "per_page": perPage == null ? null : perPage,
//     "prev_page_url": prevPageUrl,
//     "to": to == null ? null : to,
//     "total": total == null ? null : total,
//   };
// }
//
// class UnPinnedNews {
//   UnPinnedNews({
//     this.id,
//     this.categoryId,
//     this.category,
//     this.title,
//     this.content,
//     this.photos,
//     this.videos,
//     this.videoLinks,
//     this.phones,
//     this.comments,
//     this.seen,
//     this.createdAt,
//   });
//
//   int id;
//   int categoryId;
//   Category category;
//   String title;
//   String content;
//   List<Photo> photos;
//   List<dynamic> videos;
//   List<dynamic> videoLinks;
//   List<dynamic> phones;
//   List<Comment> comments;
//   int seen;
//   DateTime createdAt;
//
//   factory UnPinnedNews.fromJson(Map<String, dynamic> json) => UnPinnedNews(
//     id: json["id"] == null ? null : json["id"],
//     categoryId: json["category_id"] == null ? null : json["category_id"],
//     category: json["category"] == null ? null : categoryValues.map[json["category"]],
//     title: json["title"] == null ? null : json["title"],
//     content: json["content"] == null ? null : json["content"],
//     photos: json["photos"] == null ? null : List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
//     videos: json["videos"] == null ? null : List<dynamic>.from(json["videos"].map((x) => x)),
//     videoLinks: json["video_links"] == null ? null : List<dynamic>.from(json["video_links"].map((x) => x)),
//     phones: json["phones"] == null ? null : List<dynamic>.from(json["phones"].map((x) => x)),
//     comments: json["comments"] == null ? null : List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
//     seen: json["seen"] == null ? null : json["seen"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id == null ? null : id,
//     "category_id": categoryId == null ? null : categoryId,
//     "category": category == null ? null : categoryValues.reverse[category],
//     "title": title == null ? null : title,
//     "content": content == null ? null : content,
//     "photos": photos == null ? null : List<dynamic>.from(photos.map((x) => x.toJson())),
//     "videos": videos == null ? null : List<dynamic>.from(videos.map((x) => x)),
//     "video_links": videoLinks == null ? null : List<dynamic>.from(videoLinks.map((x) => x)),
//     "phones": phones == null ? null : List<dynamic>.from(phones.map((x) => x)),
//     "comments": comments == null ? null : List<dynamic>.from(comments.map((x) => x.toJson())),
//     "seen": seen == null ? null : seen,
//     "created_at": createdAt == null ? null : "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
//   };
// }
//
// enum Category { EMPTY }
//
// final categoryValues = EnumValues({
//   "الاخبار": Category.EMPTY
// });
//
// class Comment {
//   Comment({
//     this.id,
//     this.userId,
//     this.user,
//     this.comment,
//     this.createdAt,
//   });
//
//   int id;
//   int userId;
//   String user;
//   String comment;
//   DateTime createdAt;
//
//   factory Comment.fromJson(Map<String, dynamic> json) => Comment(
//     id: json["id"] == null ? null : json["id"],
//     userId: json["user_id"] == null ? null : json["user_id"],
//     user: json["user"] == null ? null : json["user"],
//     comment: json["comment"] == null ? null : json["comment"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id == null ? null : id,
//     "user_id": userId == null ? null : userId,
//     "user": user == null ? null : user,
//     "comment": comment == null ? null : comment,
//     "created_at": createdAt == null ? null : "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
//   };
// }
//
// class Photo {
//   Photo({
//     this.photo,
//   });
//
//   String photo;
//
//   factory Photo.fromJson(Map<String, dynamic> json) => Photo(
//     photo: json["photo"] == null ? null : json["photo"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "photo": photo == null ? null : photo,
//   };
// }
//
// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }

// class UnPinNewsModel {
// To parse this JSON data, do
//
//     final unPinNewsModel = unPinNewsModelFromJson(jsonString);

import 'dart:convert';

UnPinNewsModel unPinNewsModelFromJson(String str) =>
    UnPinNewsModel.fromJson(json.decode(str));

String unPinNewsModelToJson(UnPinNewsModel data) => json.encode(data.toJson());

class UnPinNewsModel {
  UnPinNewsModel({
    this.mainCode,
    this.code,
    this.data,
    this.error,
  });

  int mainCode;
  int code;
  Data data;
  dynamic error;

  factory UnPinNewsModel.fromJson(Map<String, dynamic> json) => UnPinNewsModel(
        mainCode: json["mainCode"],
        code: json["code"],
        // data: Data.fromJson(json["data"]),
        data: Data.fromJson(json["data"]),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "mainCode": mainCode,
        "code": code,
        "data": data.toJson(),
        "error": error,
      };
}

class Data {
  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int currentPage;
  List<News> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<News>.from(json["data"].map((x) => News.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class News {
  News({
    this.id,
    this.categoryId,
    this.category,
    this.title,
    this.content,
    this.photos,
    this.videos,
    this.videoLinks,
    this.phones,
    this.comments,
    this.seen,
    this.createdAt,
  });

  int id;
  int categoryId;
  Category category;
  String title;
  String content;
  List<Photo> photos;
  List<dynamic> videos;
  List<dynamic> videoLinks;
  List<dynamic> phones;
  List<Comment> comments;
  int seen;
  DateTime createdAt;

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json["id"],
        categoryId: json["category_id"],
        category: categoryValues.map[json["category"]],
        title: json["title"],
        content: json["content"],
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        videos: List<dynamic>.from(json["videos"].map((x) => x)),
        videoLinks: List<dynamic>.from(json["video_links"].map((x) => x)),
        phones: List<dynamic>.from(json["phones"].map((x) => x)),
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
        seen: json["seen"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "category": categoryValues.reverse[category],
        "title": title,
        "content": content,
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "videos": List<dynamic>.from(videos.map((x) => x)),
        "video_links": List<dynamic>.from(videoLinks.map((x) => x)),
        "phones": List<dynamic>.from(phones.map((x) => x)),
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
        "seen": seen,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
      };
}

enum Category { EMPTY }

final categoryValues = EnumValues({"الاخبار": Category.EMPTY});

class Comment {
  Comment({
    this.id,
    this.userId,
    this.user,
    this.comment,
    this.createdAt,
  });

  int id;
  int userId;
  String user;
  String comment;
  DateTime createdAt;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        userId: json["user_id"],
        user: json["user"],
        comment: json["comment"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "user": user,
        "comment": comment,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
      };
}

class Photo {
  Photo({
    this.photo,
  });

  String photo;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "photo": photo,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

class Error {
  String key;
  String value;

  Error({
    this.key,
    this.value,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    key: json["key"] == null ? null : json["key"],
    value: json["value"] == null ? null : json["value"],
  );

  Map<String, dynamic> toJson() => {
    "key": key == null ? null : key,
    "value": value == null ? null : value,
  };
}