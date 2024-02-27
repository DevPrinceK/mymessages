import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mymessages/constants.dart/colors.dart';
import 'package:mymessages/constants.dart/widgets/searchbox.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: const BoxDecoration(
                    // color: Colors.blue,
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
                Container(
                  // color: Colors.yellow,
                  height: MediaQuery.of(context).size.height * 0.8,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
