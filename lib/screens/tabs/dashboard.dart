import 'package:flutter/material.dart';
import 'package:mymessages/constants/colors.dart';
import 'package:mymessages/constants/widgets/filterbutton.dart';
import 'package:mymessages/constants/widgets/mediabox.dart';
import 'package:mymessages/constants/widgets/searchbox.dart';
import 'package:mymessages/screens/pages/home.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
          "King Prince",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(
              Icons.notifications,
              size: 30.0,
              // color: Colors.white,
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
                              children: [
                                mediaBox(
                                    context, "video", "The Power of Prayer"),
                                const SizedBox(width: 10),
                                mediaBox(
                                    context, "video", "Christ's saving grace"),
                                const SizedBox(width: 10),
                                mediaBox(context, "video",
                                    "The Gifts of the Holy Spirit"),
                                const SizedBox(width: 10),
                                mediaBox(context, "video",
                                    "The Power of the Holy Spirit"),
                              ],
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
                              children: [
                                mediaBox(
                                    context, "audio", "The Power of Prayer"),
                                const SizedBox(width: 10),
                                mediaBox(
                                    context, "audio", "Christ's saving grace"),
                                const SizedBox(width: 10),
                                mediaBox(context, "audio",
                                    "The Gifts of the Holy Spirit"),
                                const SizedBox(width: 10),
                                mediaBox(context, "audio",
                                    "The Power of the Holy Spirit"),
                              ],
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
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(
                                          currentIndex: 3,
                                        ),
                                      ),
                                    );
                                  },
                                  child: mediaBox(
                                      context, "text", "The Power of Prayer"),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(
                                          currentIndex: 3,
                                        ),
                                      ),
                                    );
                                  },
                                  child: mediaBox(
                                      context, "text", "Christ's saving grace"),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(
                                          currentIndex: 3,
                                        ),
                                      ),
                                    );
                                  },
                                  child: mediaBox(
                                      context, "text", "The Gifts of the Holy"),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(
                                          currentIndex: 3,
                                        ),
                                      ),
                                    );
                                  },
                                  child: mediaBox(
                                      context, "text", "The Power of the Holy"),
                                ),
                              ],
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
          // bottom space
        ],
      ),
    );
  }
}
