// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

BlocModel welcomeFromJson(String str) => BlocModel.fromJson(json.decode(str));

String welcomeToJson(BlocModel data) => json.encode(data.toJson());

class BlocModel {
    BlocModel({
        this.mainCode,
        this.code,
        this.data,
        this.error,
    });

    int mainCode;
    int code;
    Data data;
    List<Error> error;

    factory BlocModel.fromJson(Map<String, dynamic> json) => BlocModel(
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
        this.message,
    });

    String message;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
    };
}

class Error {
    Error({
        this.message,
    });

    String message;

    factory Error.fromJson(Map<String, dynamic> json) => Error(
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
    };
}
