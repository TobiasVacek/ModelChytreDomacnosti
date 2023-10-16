import 'package:app_for_smart_home/pages/lights_screen.dart';
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
  int activePage = 0;
  void changePage(int index) {
    setState(() {
      activePage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xfff7f6f2),
        body: Center(
          child: Column(
            children: [
              Expanded(
                  child: [NiceTemperatureScreen(), LightsScreen()][activePage]),
              BottomNavBar(changeCallback: changePage)
            ],
          ),
        ),
      ),
    );
  }
}
