import 'package:flutter/material.dart';

class LightsScreen extends StatefulWidget {
  const LightsScreen({Key? key}) : super(key: key);

  @override
  _LightsScreenState createState() => _LightsScreenState();
}

class _LightsScreenState extends State<LightsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffffffff),
      ),
    );
  }
}
