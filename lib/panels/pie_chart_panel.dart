import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:gruharaksha/data/constant.dart';


class PieChartPanel extends StatelessWidget {

  final Map worldData;

  const PieChartPanel({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          PieChart(
            dataMap: {
//        'Confirmed': worldData['cases'].toDouble(),
              'ACTIVE': worldData['active'].toDouble(),
              'RECOVERED': worldData['recovered'].toDouble(),
              'DEATHS': worldData['deaths'].toDouble(),
            },
            colorList: [
              kInfectedColorLight,
              kRecoverColor,
              kTextLightColor
            ],
          ),
          Container(
              padding: EdgeInsets.only(right: 20, top: 10),
              alignment: Alignment.centerRight,
              child: Text('* TOTAL CONFIRMED CASES: '+worldData['cases'].toString(),style: kUnderDataTextStyle.copyWith(fontWeight: FontWeight.w500)))

        ],
      ),
    );
  }
}
