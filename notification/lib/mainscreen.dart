import 'package:flutter/material.dart';
import 'package:notification/screens/alarms.dart';
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
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                NotificationService().cancelAllNotifications();
              },
              child: Container(
                margin: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
                height: 40,
                width: 200,
                color: Colors.lightBlue,
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
      drawer: getNavDrawer(context),
    );
  }

  Drawer getNavDrawer(BuildContext context) {
    var headerChild = DrawerHeader(child: Text("Header"));
    var aboutChild = AboutListTile(
        child: Text("About"),
        applicationName: "Application Name",
        applicationVersion: "v1.0.0",
        applicationIcon: Icon(Icons.adb),
        icon: Icon(Icons.info));

    ListTile getNavItem(var icon, String s, String routeName) {
      return ListTile(
        leading: Icon(icon),
        title: Text(s),
        onTap: () {
          setState(() {
            // pop closes the drawer
            Navigator.of(context).pop();
            // navigate to the route
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var myNavChildren = [
      headerChild,
      getNavItem(Icons.settings, "Alarms", AlarmsScreen.routeName),
      getNavItem(Icons.home, "Home", "/"),
      aboutChild
    ];

    ListView listView = ListView(children: myNavChildren);

    return Drawer(
      child: listView,
    );
  }

}