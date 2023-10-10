import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app_for_smart_home/utils/server_utils.dart';
import 'package:app_for_smart_home/utils/colorScheme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

List<_SalesData> data = [
  _SalesData('Jan', 35),
  _SalesData('Feb', 28),
  _SalesData('Mar', 34),
  _SalesData('Apr', 32),
  _SalesData('May', 40)
];
const themeData = darkColorScheme;

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({Key? key}) : super(key: key);

  @override
  _TemperatureScreenState createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  bool stav = true;
  double temperature = 0.0;
  List light = [0, 0, 0];
  int curtains = 0;
  double desiredTemperature = 20.0;
  void sliderCallback(double value) {
    desiredTemperature = value;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: themeData.primary,
        appBar: AppBar(
          backgroundColor: themeData.primaryContainer,
          centerTitle: true,
          title: Text(
            "Teplota",
            style: TextStyle(
                color: themeData.onSecondary, fontWeight: FontWeight.bold),
            textScaleFactor: 1.5,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: themeData.outlineVariant),
                  borderRadius: BorderRadius.circular(7),
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                    colors: [
                      themeData.primaryContainer,
                      themeData.secondaryContainer
                    ],
                  ),
                ),
                child: Text(
                  'Aktuální teplota: $temperature°C',
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.3,
                  style: TextStyle(
                      color: themeData.onSecondary,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    /* gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        themeData.primaryContainer,
                        themeData.secondaryContainer
                      ],
                    ), */
                    color: Color.fromARGB(255, 183, 105, 195)),
                child: Text(
                  'Požadovaná teplota: ${desiredTemperature.toStringAsFixed(1)}°C',
                  textScaleFactor: 1.3,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: themeData.onSecondary,
                      fontWeight: FontWeight.bold),
                ),
              ),
              /* SleekCircularSlider(
                  min: 10.0,
                  max: 30.0,
                  initialValue: 20.0,
                  appearance: CircularSliderAppearance(
                    infoProperties: InfoProperties(
                      modifier: (value) {
                        String inDegrees = value.toStringAsFixed(1);
                        return '$inDegrees °C';
                      },
                      mainLabelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    customColors: CustomSliderColors(
                        trackColor: Colors.white,
                        progressBarColors: [
                          const Color.fromARGB(255, 253, 29, 29),
                          Colors.white,
                          const Color.fromARGB(255, 1, 139, 252)
                        ]),
                  ),
                  onChange: (double endValue) {
                    setState(() {
                      desiredTemperature = endValue;
                    });
                  }) */
              SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: 'Half yearly sales analysis'),
                  // Enable legend
                  legend: Legend(isVisible: true),
                  // Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<_SalesData, String>>[
                    LineSeries<_SalesData, String>(
                        dataSource: data,
                        xValueMapper: (_SalesData sales, _) => sales.year,
                        yValueMapper: (_SalesData sales, _) => sales.sales,
                        name: 'Sales',
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(isVisible: true))
                  ]),
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          height: 35,
          width: 35,
          child: FloatingActionButton(
            backgroundColor: themeData.primaryContainer,
            onPressed: () async {
              try {
                fetchAlbum().then(
                  (album) {
                    if (album != null) {
                      setState(
                        () {
                          temperature = album.temperature;
                        },
                      );
                    }
                  },
                );
              } catch (e) {
                print('Error: $e');
              }
            },
            child: const Icon(Icons.refresh),
          ),
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
