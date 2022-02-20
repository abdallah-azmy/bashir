

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

TermsModel welcomeFromJson(String str) => TermsModel.fromJson(json.decode(str));

String welcomeToJson(TermsModel data) => json.encode(data.toJson());

class TermsModel {
    TermsModel({
        this.mainCode,
        this.code,
        this.data,
        this.error,
    });

    int mainCode;
    int code;
    Data data;
    List<Error> error;

    factory TermsModel.fromJson(Map<String, dynamic> json) => TermsModel(
        mainCode: json["mainCode"] == null ? null : json["mainCode"],
        code: json["code"] == null ? null : json["code"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        error: json["error"] == null ? null : List<Error>.from(json["error"].map((x) => Error.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "mainCode": mainCode == null ? null : mainCode,
        "code": code == null ? null : code,
        "data": data == null ? null : data.toJson(),
        "error": error == null ? null : List<dynamic>.from(error.map((x) => x.toJson())),
    };
}

class Data {
    Data({
        this.title,
        this.content,
    });

    String title;
    String content;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"] == null ? null : json["title"],
        content: json["content"] == null ? null : json["content"],
    );

    Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "content": content == null ? null : content,
    };
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
