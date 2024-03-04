// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mymessages/constants/colors.dart';
import 'package:mymessages/models/data_model.dart';

class NotificationDetails extends StatelessWidget {
  NotificationModel notification;
  NotificationDetails({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(notification.title),
        backgroundColor: primaryColor900,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 60,
                    color: primaryColor900,
                    child: const Column(
                      children: [
                        SizedBox(height: 20),
                        Icon(
                          Icons.notifications_active,
                          color: Colors.white,
                          size: 50,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(''),
                        const Text(
                          "Hello, there!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                        Text(
                          notification.message,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Divider(
                            color: primaryColor500,
                            thickness: 1,
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Date: ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              notification.date.toString().substring(0, 10),
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
