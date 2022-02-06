import 'dart:convert';

import 'package:bashir/src/models/customError.dart';

LogoutModel welcomeFromJson(String str) => LogoutModel.fromJson(json.decode(str));

String welcomeToJson(LogoutModel data) => json.encode(data.toJson());

class LogoutModel {
    LogoutModel({
        this.mainCode,
        this.code,
        this.data,
        this.error,
    });

    int mainCode;
    int code;
    List<dynamic> data;
    List<CustomError> error;

    factory LogoutModel.fromJson(Map<String, dynamic> json) => LogoutModel(
        mainCode: json["mainCode"] == null ? null : json["mainCode"],
        code: json["code"] == null ? null : json["code"],
        data: json["data"] == null
            ? null
            : List<dynamic>.from(json["data"].map((x) => x)),
        error: json["error"] == null
            ? null
            : List<CustomError>.from(
            json["error"].map((x) => CustomError.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "mainCode": mainCode == null ? null : mainCode,
        "code": code == null ? null : code,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x)),
        "error": error,
    };
}
