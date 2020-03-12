import 'package:flutter/material.dart';

class Page {
  int id;
  int page;
  int perPage;

  Page({this.id, @required this.page, @required this.perPage});
  Page.newPage() {
    page = 1;
    perPage = 10;
  }

  assignUUID() {
    id = 1;
  }

  // staticでも同じ？
  factory Page.fromMap(Map<String, dynamic> json) => Page(
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