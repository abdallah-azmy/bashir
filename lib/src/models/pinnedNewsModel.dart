// To parse this JSON data, do
//
//     final unPinNewsModel = unPinNewsModelFromJson(jsonString);

import 'dart:convert';

PinnedNewsModel unPinNewsModelFromJson(String str) =>
    PinnedNewsModel.fromJson(json.decode(str));

String unPinNewsModelToJson(PinnedNewsModel data) => json.encode(data.toJson());

class PinnedNewsModel {
  int mainCode;
  int code;
  List<UnPinnedNews> data;
  dynamic error;

  PinnedNewsModel({
    this.mainCode,
    this.code,
    this.data,
    this.error,
  });

  factory PinnedNewsModel.fromJson(Map<String, dynamic> json) => PinnedNewsModel(
        mainCode: json["mainCode"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<UnPinnedNews>.from(json["data"].map((x) => UnPinnedNews.fromJson(x))),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "mainCode": mainCode,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error,
      };
}

class UnPinnedNews {
  int id;
  int categoryId;
  String category;
  String title;
  String content;
  List<Photo> photos;
  List<Video> videos;
  List<VideoLink> videoLinks;
  List<Phone> phones;
  List<Comment> comments;
  int seen;
  DateTime createdAt;

  UnPinnedNews({
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

  factory UnPinnedNews.fromJson(Map<String, dynamic> json) => UnPinnedNews(
        id: json["id"],
        categoryId: json["category_id"],
        category: json["category"],
        title: json["title"],
        content: json["content"],
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
    videoLinks: json["video_links"] == null ? null : List<VideoLink>.from(json["video_links"].map((x) => VideoLink.fromJson(x))),
    phones: json["phones"] == null ? null : List<Phone>.from(json["phones"].map((x) => Phone.fromJson(x))),
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
        seen: json["seen"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "category": category,
        "title": title,
        "content": content,
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
    "video_links": videoLinks == null ? null : List<dynamic>.from(videoLinks.map((x) => x.toJson())),
    "phones": phones == null ? null : List<dynamic>.from(phones.map((x) => x.toJson())),
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
        "seen": seen,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
      };
}

class Comment {
  int id;
  int userId;
  String user;
  String comment;
  DateTime createdAt;

  Comment({
    this.id,
    this.userId,
    this.user,
    this.comment,
    this.createdAt,
  });

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

class Video {
  String video;

  Video({
    this.video,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    video: json["video"],
  );

  Map<String, dynamic> toJson() => {
    "video": video,
  };
}

class VideoLink {
  String videoLink;

  VideoLink({
    this.videoLink,
  });

  factory VideoLink.fromJson(Map<String, dynamic> json) => VideoLink(
    videoLink: json["video_link"],
  );

  Map<String, dynamic> toJson() => {
    "video_link": videoLink,
  };
}

class Photo {
  String photo;

  Photo({
    this.photo,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "photo": photo,
      };
}
class Phone {
  Phone({
    this.name,
    this.phone,
  });

  String name;
  String phone;

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
    name: json["name"] == null ? null : json["name"],
    phone: json["phone"] == null ? null : json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "phone": phone == null ? null : phone,
  };
}
