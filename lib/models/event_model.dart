import 'package:flutter/material.dart';

class EventModel {
  final String title;
  final DateTime date;
  final Color color;
  final bool isBirthday;

  const EventModel({
    required this.title,
    required this.date,
    required this.color,
    this.isBirthday = false,
  });
}
