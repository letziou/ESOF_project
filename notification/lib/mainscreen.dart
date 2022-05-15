import 'package:flutter/material.dart';
import 'package:notification/screens/tester.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:intl/intl.dart';

import 'notificationservice.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  initState() {
    super.initState();
  }

  final List<String> entries = <String>['LTW', 'ES', 'SO', 'LC', 'DA', 'FI'];
  List<bool> active = List.filled(6, false);
  List<int> times = <int>[10, 10, 20, 10, 10, 0];

  Icon unactiveIcon =
      Icon(Icons.notifications, color: Color.fromARGB(50, 110, 33, 14));
  Icon activeIcon =
      Icon(Icons.notifications, color: Color.fromARGB(255, 110, 33, 14));
  Icon notify = Icon(Icons.warning, color: Color.fromARGB(255, 110, 33, 14));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alarms"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.alarm),
            tooltip: 'edit',
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15.0),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 60,
              width: 400,
              margin: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                border: Border.all(
                  color: Colors.grey.shade400,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    entries[index],
                    style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 110, 33, 14),
                        fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                    icon: active[index] ? activeIcon : unactiveIcon,
                    onPressed: () {
                      try {
                        setState(() {
                          active[index] = !active[index];
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                  Text(
                    times[index] != 0
                        ? times[index].toString() + ' min. Before'
                        : 'No alarm',
                    style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 110, 33, 14),
                        fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                    onPressed: () {
                      if (times[index] != 0) {
                        NotificationService().showNotification(
                            1,
                            entries[index],
                            'Starting in ' +
                                times[index].toString() +
                                ' minutes',
                            1);
                        NotificationService().showNotification(
                            1,
                            entries[index],
                            'Your class is about to start in ' +
                                times[index].toString(),
                            times[index]);
                      } else {
                        NotificationService().showNotification(
                            1, entries[index], 'No time set', 1);
                      }
                    },
                    icon: notify,
                  ),
                ],
              ));
        },
      ),
      drawer: getNavDrawer(context),
    );
  }

  Drawer getNavDrawer(BuildContext context) {
    var headerChild = DrawerHeader(child: Text("Menu"));
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
      getNavItem(Icons.settings, "Tester", AlarmsScreen.routeName),
      getNavItem(Icons.home, "Home", "/"),
      aboutChild
    ];

    ListView listView = ListView(children: myNavChildren);

    return Drawer(
      child: listView,
    );
  }
}
