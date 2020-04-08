import 'package:flutter/material.dart';

class MyPage {
  int id;
  int page;
  int perPage;

  MyPage({this.id, @required this.page, @required this.perPage});
  MyPage.newPage() {
    page = 1;
    perPage = 10;
  }

  assignUUID() {
    id = 1;
  }

  // staticでも同じ？
  factory MyPage.fromMap(Map<String, dynamic> json) => MyPage(
    id: json["id"],
    page: json["page"],
    perPage: json["perPage"]
  );

  Map<String, dynamic> toMap() => {
    "id": 1,
    "page": page,
    "perPage": perPage
  };
}