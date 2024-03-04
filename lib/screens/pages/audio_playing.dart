// ignore_for_file: must_be_immutable

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:mymessages/constants/colors.dart';

class PlayAudioScreen extends StatefulWidget {
  String title;
  // ignore: prefer_typing_uninitialized_variables
  var audio;
  String preacher;
  PlayAudioScreen({
    super.key,
    required this.title,
    required this.audio,
    required this.preacher,
  });

  @override
  State<PlayAudioScreen> createState() => _PlayAudioScreenState();
}

class _PlayAudioScreenState extends State<PlayAudioScreen> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    // Listen for changes for isPlaying
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });

    // Listen for changes for duration
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    // Listen for changes for position
    audioPlayer.onPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor900,
        foregroundColor: Colors.white,
        title: const Text(
          "Audio Message",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(
              Icons.favorite,
              size: 30.0,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/imgs/microphone.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "-- ${widget.preacher}",
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 10),
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                await audioPlayer.seek(Duration(seconds: value.toInt()));
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(position)),
                  Text(formatTime(duration - position)),
                ],
              ),
            ),
            const SizedBox(height: 5),
            CircleAvatar(
              radius: 35,
              backgroundColor: primaryColor300,
              child: IconButton(
                onPressed: () async {
                  if (isPlaying) {
                    await audioPlayer.pause();
                    setState(() {
                      isPlaying = false;
                    });
                  } else {
                    var url = widget.audio;
                    await audioPlayer.play(UrlSource(url));
                    setState(() {
                      isPlaying = true;
                    });
                  }
                },
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor500,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(Icons.share),
      ),
    );
  }
}

String formatTime(Duration position) {
  int minutes = position.inMinutes;
  int seconds = position.inSeconds.remainder(60);
  return "$minutes:$seconds";
}
