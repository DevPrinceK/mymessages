import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:mymessages/constants/colors.dart';
import 'package:mymessages/constants/widgets/searchbox.dart';
import 'package:mymessages/models/data_model.dart';
import 'package:mymessages/screens/pages/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  List<VideoModel> videos = List.generate(
    20,
    (index) => VideoModel(
      title: loremIpsum(words: 5, paragraphs: 1),
      thumbnail: "assets/imgs/video.jpg",
      videoUrl: "https://www.youtube.com/watch?v=6JYIGclVQdw",
      preacher: "Professor Yaokumah",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor900,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.person_pin, size: 40),
        title: const Text(
          "Visual Gospel",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
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
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "Search Video",
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
              const SizedBox(height: 10),
              const Text(
                "Videos",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                VideoMessagePlayer(video: videos[index]),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 3,
                        shadowColor: primaryColor900,
                        child: Container(
                          color: Colors.white,
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.2 -
                                        35,
                                width: MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(videos[index].thumbnail),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                videos[index].title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: videos.length,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
