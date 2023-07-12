import 'package:flutter/material.dart';

class NoteModel {
  final String title;
  final String subTitle;
  final String date;
  final int color;

  NoteModel(
      {required this.title,
      required this.subTitle,
      required this.date,
      required this.color});
  factory NoteModel.fromMap(Map<dynamic, dynamic> data) {
    return NoteModel(
        title: data["title"],
        subTitle: data["subTitle"],
        date: data["date"],
        color: data["color"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "subTitle": subTitle,
      "date": date,
      "color": color,
    };
  }
}
