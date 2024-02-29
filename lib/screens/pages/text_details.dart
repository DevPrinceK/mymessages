import 'package:flutter/material.dart';

import 'package:mymessages/constants/colors.dart';

class TextDetailScreen extends StatelessWidget {
  String title;
  String message;
  String preacher;
  TextDetailScreen({
    super.key,
    required this.title,
    required this.message,
    required this.preacher,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor900,
        foregroundColor: Colors.white,
        title: const Text(
          "Textual Gospel",
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
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                message,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              Text(
                "-- $preacher",
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 50),
            ],
          ),
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
