import 'package:flutter/material.dart';

Widget searchBox(controller) {
  return Container(
    padding: const EdgeInsets.all(5),
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: Colors.white,
        width: 1,
      ),
    ),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              hintText: "Search...",
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.white),
            ),
            controller: controller,
          ),
        ),
        const Icon(
          Icons.dashboard,
          color: Colors.white,
        ),
      ],
    ),
  );
}
