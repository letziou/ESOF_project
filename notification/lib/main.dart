import 'package:flutter/material.dart';
import 'package:notification/screens/tester.dart';
import 'mainscreen.dart';
import 'notificationservice.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        AlarmsScreen.routeName: (BuildContext context) => AlarmsScreen(),
      },
      home: const MainScreen(),
    );
  }
}
