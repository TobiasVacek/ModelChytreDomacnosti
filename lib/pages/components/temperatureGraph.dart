import 'package:app_for_smart_home/utils/colorScheme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TemperatureChart extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  TemperatureChart({Key? key}) : super(key: key);

  @override
  _TemperatureChartState createState() => _TemperatureChartState();
}

class _TemperatureChartState extends State<TemperatureChart> {
  List<_TemperatureHistory> data = [
    _TemperatureHistory("10:00", 20.8),
    _TemperatureHistory("10:10", 21.0),
    _TemperatureHistory("10:20", 21.2),
    _TemperatureHistory("10:30", 21.1),
    _TemperatureHistory("10:40", 21.4),
    _TemperatureHistory("10:50", 22.0),
    _TemperatureHistory("11:00", 21.7),
  ];
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = lightColorScheme;
    double dataMax = data
        .reduce((a, b) => a.temperature > b.temperature ? a : b)
        .temperature;

    double dataMin = data
        .reduce((a, b) => a.temperature < b.temperature ? a : b)
        .temperature;

    return Container(
      height: 150,
      width: 200,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow,
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: colorScheme.shadow,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ], //BoxShadow
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.primaryContainer,
                colorScheme.secondaryContainer
              ])),
      child:

          //Initialize the chart widget
          SfCartesianChart(
        primaryXAxis: CategoryAxis(
            labelStyle: TextStyle(
                fontWeight: FontWeight.bold, color: colorScheme.onPrimary)),
        primaryYAxis: NumericAxis(
            labelStyle: TextStyle(
                fontWeight: FontWeight.bold, color: colorScheme.onPrimary),
            labelFormat: "{value}°C",
            minimum: dataMin.floor() - 2,
            maximum: dataMax.floor() + 2),
        // Chart title

        // Enable legend
        legend: Legend(isVisible: false),
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(enable: true, animationDuration: 2),
        series: <ChartSeries<_TemperatureHistory, String>>[
          SplineRangeAreaSeries<_TemperatureHistory, String>(
              dataSource: data,
              gradient: LinearGradient(
                  colors: [colorScheme.primary, colorScheme.secondary]),
              xValueMapper: (_TemperatureHistory time, _) => time.time,
              highValueMapper: (_TemperatureHistory temperature, _) =>
                  temperature.temperature,
              lowValueMapper: (_TemperatureHistory temperature, _) =>
                  temperature.temperature -
                  ((dataMax.floor() - dataMin.floor()) + 10) / 100,
              name: 'Temprature',
              // Enable data label
              dataLabelSettings: DataLabelSettings(isVisible: false))
        ],
      ),
    );
  }
}

class _TemperatureHistory {
  _TemperatureHistory(this.time, this.temperature);

  final String time;
  final double temperature;
}
