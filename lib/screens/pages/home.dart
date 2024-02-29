import 'package:flutter/material.dart';
import 'package:mymessages/constants/colors.dart';
import 'package:mymessages/screens/tabs/audios.dart';
import 'package:mymessages/screens/tabs/dashboard.dart';
import 'package:mymessages/screens/tabs/text.dart';
import 'package:mymessages/screens/tabs/videos.dart';

class HomeScreen extends StatefulWidget {
  int currentIndex;
  HomeScreen({super.key, this.currentIndex = 0});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // dynamic body
      body: _buildBody(
        widget.currentIndex,
      ),

      // bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primaryColor700,
        // fixedColor: primaryColor300,
        unselectedItemColor: primaryColor300,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            widget.currentIndex = index;
          });
        },
        currentIndex: widget.currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: primaryColor700,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_camera_back_outlined),
            activeIcon: Icon(Icons.video_camera_back),
            label: 'Videos',
            backgroundColor: primaryColor700,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.audiotrack_outlined),
            activeIcon: Icon(Icons.audiotrack),
            label: 'Audios',
            backgroundColor: primaryColor700,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_snippet_outlined),
            activeIcon: Icon(Icons.text_snippet),
            label: 'Text',
            backgroundColor: primaryColor700,
          ),
        ],
      ),
    );
  }

  // build screen
  Widget _buildBody(currentIndex) {
    switch (currentIndex) {
      case 0:
        return const DashboardScreen();
      case 1:
        return const VideoScreen();
      case 2:
        return const AudioScreen();
      case 3:
        return TextScreen();
      default:
        return const DashboardScreen();
    }
  }
}
