//import 'package:flutter/material.dart';

class NoteModel {
  String title;
  String subtitle;
  final String date;
  int color;

  NoteModel(
      {required this.title,
      required this.subtitle,
      required this.date,
      required this.color});
  factory NoteModel.fromMap(Map<String, dynamic> data) {
    return NoteModel(
        title: data["title"],
        subtitle: data["subtitle"],
        date: data["date"],
        color: data["color"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "subtitle": subtitle,
      "date": date,
      "color": color,
    };
  }
}
