import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'notificationservice.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late TimeOfDay time;
  late TimeOfDay picked;

  @override
  void initState() {
    super.initState();

    tz.initializeTimeZones();
    time = TimeOfDay.now();
  }

  Future<void> selectTime(BuildContext context) async {
    picked = (await showTimePicker(context: context, initialTime: time))!;

    setState(() {
      time = picked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                NotificationService().cancelAllNotifications();
              },
              child: Container(
                margin: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
                height: 40,
                width: 200,
                color: Colors.red,
                child: const Center(
                  child: Text(
                    "Cancel All Notifications",
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                selectTime(context);
              },
              child: Container(
                margin: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
                height: 40,
                width: 200,
                color: Colors.deepPurple,
                child: const Center(
                  child: Text(
                    "Set up Notification",
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                NotificationService().showNotification(1, "title of notification", "body of notification", 1);
              },
              child: Container(
                margin: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
                height: 40,
                width: 200,
                color: Colors.green,
                child: const Center(
                  child: Text("Show Notification"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}