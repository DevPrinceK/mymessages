import 'package:flutter/material.dart';

class VideoModel {
  String title;
  String preacher;
  String videoUrl;
  String thumbnail;

  VideoModel({
    required this.title,
    required this.thumbnail,
    required this.videoUrl,
    required this.preacher,
  });
}

class AudioModel {
  String title;
  String preacher;
  String audioUrl;

  AudioModel({
    required this.title,
    required this.audioUrl,
    required this.preacher,
  });
}

class TextModel {
  String title;
  String message;
  String preacher;

  TextModel({
    required this.title,
    required this.message,
    required this.preacher,
  });
}

class NotificationModel {
  String title;
  String message;
  DateTime date;

  NotificationModel({
    required this.title,
    required this.message,
    required this.date,
  });
}
