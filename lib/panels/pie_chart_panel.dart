import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';


class PieChartPanel extends StatelessWidget {

  final Map worldData;

  const PieChartPanel({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: {
        'Confirmed': worldData['cases'].toDouble(),
        'Active': worldData['active'].toDouble(),
        'Recovered': worldData['recovered'].toDouble(),
        'Deaths': worldData['deaths'].toDouble(),
      },
      colorList: [

      ],
    );
  }
}
