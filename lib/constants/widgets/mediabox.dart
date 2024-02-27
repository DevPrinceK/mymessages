import 'package:flutter/material.dart';
import 'package:mymessages/constants/colors.dart';

Widget mediaBox(BuildContext context, String type, String title) {
  return Card(
    elevation: 3,
    shadowColor: primaryColor900,
    child: Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.45,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2 - 35,
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: type == 'video'
                    ? const AssetImage('assets/imgs/video.jpg')
                    : type == "audio"
                        ? const AssetImage('assets/imgs/microphone.jpg')
                        : const AssetImage('assets/imgs/scripture.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );
}
