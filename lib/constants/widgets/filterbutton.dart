import 'package:flutter/material.dart';
import 'package:mymessages/constants/colors.dart';

Widget filterButton(
    BuildContext context, String text, IconData icon, bool active) {
  return Container(
    decoration: BoxDecoration(
      color: active ? Colors.blue : primaryColor50,
      borderRadius: BorderRadius.circular(10),
    ),
    height: 40,
    width: MediaQuery.of(context).size.width * 0.28,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: active ? Colors.white : primaryColor300,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              color: active ? Colors.white : primaryColor300,
            ),
          ),
        ],
      ),
    ),
  );
}
