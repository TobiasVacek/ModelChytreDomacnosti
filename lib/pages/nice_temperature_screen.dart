import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class NiceTemperatureScreen extends StatefulWidget {
  const NiceTemperatureScreen({Key? key}) : super(key: key);

  @override
  _NiceTemperatureScreenState createState() => _NiceTemperatureScreenState();
}

class _NiceTemperatureScreenState extends State<NiceTemperatureScreen> {
  double desiredTemp = 0.0;
  bool regulace = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color(0xfff7f6f2),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffe9e6e1),
                            offset: Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Color(0xffe9e6e1),
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(234, 230, 221, 1),
                            Color(0xfffdfaf5)
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (Rect bounds) =>
                                const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xfff0d7a4),
                                Color(0xfff7849b),
                              ],
                            ).createShader(bounds),
                            child: const Icon(
                              Icons.living_outlined,
                              size: 45,
                            ),
                          ),
                          Text(
                            "0.0°C",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textScaleFactor: 1.2,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xffe9e6e1),
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Color(0xffe9e6e1),
                              offset: Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(234, 230, 221, 1),
                                Color(0xfffdfaf5)
                              ]),
                          borderRadius: BorderRadius.circular(55)),
                      child: Center(
                        child: SleekCircularSlider(
                          min: 10.0,
                          max: 30.0,
                          initialValue: 20.0,
                          onChange: (value) {
                            desiredTemp = value;
                          },
                          appearance: CircularSliderAppearance(
                            size: 90,
                            infoProperties: InfoProperties(
                              mainLabelStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 19),
                              modifier: (value) {
                                String inDegrees = value.toStringAsFixed(1);
                                return '$inDegrees °C';
                              },
                            ),
                            customWidths: CustomSliderWidths(
                                trackWidth: 10, handlerSize: 5),
                            customColors: CustomSliderColors(
                                trackColors: [
                                  Color.fromRGBO(234, 230, 221, 1),
                                  Color(0xfffdfaf5)
                                ],
                                dynamicGradient: true,
                                hideShadow: true,
                                progressBarColors: [
                                  Color(0xfff0d7a4),
                                  Color(0xfff7849b),
                                ]),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  width: 200,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xffe9e6e1),
                        offset: Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Color(0xffe9e6e1),
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(234, 230, 221, 1),
                        Color(0xfffdfaf5)
                      ],
                    ),
                  ),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: const Text(
                            "Regulace:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            regulace = !regulace;
                          });
                        },
                        child: Stack(
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.only(right: 10),
                              height: 20,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xffe9e6e1),
                                    offset: Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: Color(0xffe9e6e1),
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ],
                                gradient: LinearGradient(
                                  begin: regulace
                                      ? Alignment.centerLeft
                                      : Alignment.topCenter,
                                  end: regulace
                                      ? Alignment.centerRight
                                      : Alignment.bottomCenter,
                                  colors: [
                                    regulace
                                        ? Color(0xfff0ece0)
                                        : Color(0xfff7849b),
                                    regulace
                                        ? Color(0xffddcbb5)
                                        : Color(0xfff0d7a4),
                                  ],
                                ),
                              ),
                            ),
                            AnimatedPositioned(
                              width: 14,
                              height: 14,
                              duration: const Duration(milliseconds: 300),
                              left: regulace ? 5 : 30,
                              top: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
