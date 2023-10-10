import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final changeCallback;
  const BottomNavBar({required this.changeCallback, Key? key})
      : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<bool> panelSelected = [true, false, false];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double widthMainBar = screenWidth - screenWidth / 4;

    return Container(
      height: 36,
      width: widthMainBar,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color.fromARGB(255, 211, 215, 216), Color(0xfffdfaf5)],
        ),
      ),
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            width: widthMainBar / panelSelected.length,
            height: 36,
            left: selectedIndex * (widthMainBar / panelSelected.length),
            duration: const Duration(milliseconds: 750),
            curve: Curves.linearToEaseOut,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xfff6d0a3),
                    Color(0xfff7849b),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Container(
                    height: 36,
                    width: widthMainBar / panelSelected.length,
                    color: Colors.transparent,
                    child: Icon(Icons.thermostat,
                        color: panelSelected[0]
                            ? const Color.fromARGB(255, 158, 103, 93)
                            : Colors.blueGrey),
                  ),
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                      for (int i = 0; i < panelSelected.length; i++) {
                        panelSelected[i] = false;
                      }
                      panelSelected[0] = true;
                    });
                    widget.changeCallback(selectedIndex);
                  },
                ),
                GestureDetector(
                  child: Container(
                    height: 36,
                    width: widthMainBar / panelSelected.length,
                    color: Colors.transparent,
                    child: Icon(Icons.lightbulb,
                        color: panelSelected[1]
                            ? Color.fromARGB(255, 158, 103, 93)
                            : Colors.blueGrey),
                  ),
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;

                      for (int i = 0; i < panelSelected.length; i++) {
                        panelSelected[i] = false;
                      }
                      panelSelected[1] = true;
                      print(panelSelected);
                    });
                  },
                ),
                GestureDetector(
                  child: Container(
                      height: 36,
                      width: widthMainBar / panelSelected.length,
                      color: Colors.transparent,
                      child: Icon(Icons.curtains,
                          color: panelSelected[2]
                              ? const Color.fromARGB(255, 158, 103, 93)
                              : Colors.blueGrey)),
                  onTap: () {
                    setState(() {
                      selectedIndex = 2;

                      for (int i = 0; i < panelSelected.length; i++) {
                        panelSelected[i] = false;
                      }
                      panelSelected[2] = true;
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
