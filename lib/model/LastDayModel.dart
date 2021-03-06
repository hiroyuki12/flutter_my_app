import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class LastDay {
  String id;
  String title;
  DateTime lastDate;
  String note;

  LastDay({this.id, @required this.title, @required this.lastDate, @required this.note});
  LastDay.newLastDay() {
    title = "";
    lastDate = DateTime.now();
    note = "";
  }

  assignUUID() {
    id = Uuid().v4();
  }

  // staticでも同じ？
  factory LastDay.fromMap(Map<String, dynamic> json) => LastDay(
    id: json["id"],
    title: json["title"],
    // DateTime型は文字列で保存されているため、DateTime型に変換し直す
    lastDate: DateTime.parse(json["lastDate"]).toLocal(), 
    note: json["note"]
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    // sqliteではDate型は直接保存できないため、文字列形式で保存する
    // "lastDate": lastDate.toUtc().toIso8601String(),
    "lastDate": lastDate.toString(),
    "note": note
  };
}