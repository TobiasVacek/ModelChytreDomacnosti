import 'package:app_for_smart_home/pages/nice_temperature_screen.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:app_for_smart_home/pages/components/bottomNavBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void changePage(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(child: NiceTemperatureScreen()),
              BottomNavBar(changeCallback: changePage)
            ],
          ),
        ),
      ),
    );
  }
}
