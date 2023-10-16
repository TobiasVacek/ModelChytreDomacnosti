import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:app_for_smart_home/utils/colorScheme.dart';

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
    ColorScheme light = lightColorScheme;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: light.background,
        body: Container(
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
                        boxShadow: [
                          BoxShadow(
                            color: light.shadow,
                            offset: Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: light.shadow,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            light.primaryContainer,
                            light.secondaryContainer
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (Rect bounds) => LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                light.primary,
                                light.secondary,
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
                          boxShadow: [
                            BoxShadow(
                              color: light.shadow,
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: light.shadow,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                light.primaryContainer,
                                light.secondaryContainer
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
                                  light.primaryContainer,
                                  light.secondaryContainer
                                ],
                                dynamicGradient: true,
                                hideShadow: true,
                                progressBarColors: [
                                  light.primary,
                                  light.secondary,
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
                    boxShadow: [
                      BoxShadow(
                        color: light.shadow,
                        offset: Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: light.shadow,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        light.primaryContainer,
                        light.secondaryContainer
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
                                boxShadow: [
                                  BoxShadow(
                                    color: light.shadow,
                                    offset: Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: light.shadow,
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
                                        : light.secondary,
                                    regulace
                                        ? Color(0xffddcbb5)
                                        : light.primary,
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
