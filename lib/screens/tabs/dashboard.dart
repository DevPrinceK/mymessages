import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:mymessages/constants/colors.dart';
import 'package:mymessages/constants/widgets/filterbutton.dart';
import 'package:mymessages/constants/widgets/mediabox.dart';
import 'package:mymessages/constants/widgets/searchbox.dart';
import 'package:mymessages/models/data_model.dart';
import 'package:mymessages/screens/pages/audio_playing.dart';
import 'package:mymessages/screens/pages/home.dart';
import 'package:mymessages/screens/pages/notifications.dart';
import 'package:mymessages/screens/pages/text_details.dart';
import 'package:mymessages/screens/pages/video_player.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<VideoModel> topVideos = List.generate(
    5,
    (index) => VideoModel(
      title: loremIpsum(words: 5, paragraphs: 1),
      thumbnail: "assets/imgs/video.jpg",
      videoUrl: "https://www.youtube.com/watch?v=6JYIGclVQdw",
      preacher: "Professor Yaokumah",
    ),
  );

  List<AudioModel> topAudios = List.generate(
    5,
    (index) => AudioModel(
      title: loremIpsum(words: 5, paragraphs: 1),
      audioUrl:
          "https://filesamples.com/samples/audio/mp3/Symphony%20No.6%20(1st%20movement).mp3",
      preacher: "Prof. Yaokuma",
    ),
  );

  List<TextModel> topTexts = List.generate(
    5,
    (index) => TextModel(
      title: loremIpsum(words: 5, paragraphs: 1),
      message: loremIpsum(words: 500, paragraphs: 1),
      preacher: "Prof. Yaokuma",
    ),
  );

  var selectedButtonIndx = 10;

  void filterContent(filterIndx) {
    setState(() {
      selectedButtonIndx = filterIndx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor900,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.person_pin, size: 40),
        title: const Text(
          "Home",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationScreen(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(
                Icons.notifications,
                size: 30.0,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        primaryColor900,
                        primaryColor300,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          "Welcome!",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        searchBox(null),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Files",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  filterContent(0);
                                },
                                child: filterButton(
                                  context,
                                  "Video",
                                  Icons.video_call,
                                  selectedButtonIndx == 0,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  filterContent(1);
                                },
                                child: filterButton(
                                  context,
                                  "Audio",
                                  Icons.my_library_music_rounded,
                                  selectedButtonIndx == 1,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  filterContent(2);
                                },
                                child: filterButton(
                                  context,
                                  "Text",
                                  Icons.text_snippet_rounded,
                                  selectedButtonIndx == 2,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Top Videos",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HomeScreen(currentIndex: 1),
                                    ),
                                  );
                                },
                                child: const Text("See all"),
                              )
                            ],
                          ),
                          // top videos
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                topVideos.length,
                                (index) => InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            VideoMessagePlayer(
                                                video: topVideos[index]),
                                      ),
                                    );
                                  },
                                  child: mediaBox(
                                    context,
                                    "video",
                                    topVideos[index].title,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Top Audios",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HomeScreen(currentIndex: 2),
                                    ),
                                  );
                                },
                                child: const Text("See all"),
                              )
                            ],
                          ),
                          // top Audios
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                topAudios.length,
                                (index) => InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PlayAudioScreen(
                                          title: topAudios[index].title,
                                          audio: topAudios[index].audioUrl,
                                          preacher: topAudios[index].preacher,
                                        ),
                                      ),
                                    );
                                  },
                                  child: mediaBox(
                                    context,
                                    "audio",
                                    topAudios[index].title,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Top Texts",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HomeScreen(currentIndex: 3),
                                    ),
                                  );
                                },
                                child: const Text("See all"),
                              )
                            ],
                          ),

                          // top Texts
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                topTexts.length,
                                (index) => InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TextDetailScreen(
                                          title: topTexts[index].title,
                                          message: topTexts[index].message,
                                          preacher: topTexts[index].preacher,
                                        ),
                                      ),
                                    );
                                  },
                                  child: mediaBox(
                                    context,
                                    "text",
                                    topTexts[index].title,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 150),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
