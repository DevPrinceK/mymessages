// ignore_for_file: must_be_immutable

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:mymessages/constants/colors.dart';
import 'package:mymessages/models/data_model.dart';

class VideoMessagePlayer extends StatefulWidget {
  VideoModel video;
  VideoMessagePlayer({super.key, required this.video});

  @override
  State<VideoMessagePlayer> createState() => _VideoMessagePlayerState();
}

class _VideoMessagePlayerState extends State<VideoMessagePlayer> {
  late CustomVideoPlayerController _customVideoPlayerController;

  String videoUrl =
      "https://file-examples.com/storage/fe7b7e0dc465e22bc9e6da8/2017/04/file_example_MP4_480_1_5MG.mp4";

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.video.title),
          backgroundColor: primaryColor900,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            CustomVideoPlayer(
              customVideoPlayerController: _customVideoPlayerController,
            ),
            Text(
              widget.video.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Preacher: ${widget.video.preacher}",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          backgroundColor: primaryColor700,
          foregroundColor: Colors.white,
          child: const Icon(Icons.share),
        ));
  }

  void initializeVideoPlayer() {
    CachedVideoPlayerController videoPlayerController;
    videoPlayerController = CachedVideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });

    _customVideoPlayerController = CustomVideoPlayerController(
      videoPlayerController: videoPlayerController,
      customVideoPlayerSettings: const CustomVideoPlayerSettings(
        customAspectRatio: 16 / 9,
        customVideoPlayerProgressBarSettings:
            CustomVideoPlayerProgressBarSettings(
          bufferedColor: primaryColor300,
          backgroundColor: Colors.white,
        ),
      ),
      context: context,
    );
  }
}
