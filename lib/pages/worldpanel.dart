import 'package:gruharaksha/data/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorldPanel extends StatelessWidget {
  final Map worldData;

  const WorldPanel({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 2),
            children: <Widget>[
              StatusPanel(
                title: 'CONFIRMED',
                panelColor: Colors.red[100],
                textColor: kInfectedColor,
                count: worldData['cases'].toString(),
              ),
              StatusPanel(
                title: 'ACTIVE',
                panelColor: Colors.blue[100],
                textColor: Colors.blue[800],
                count: worldData['active'].toString(),
              ),
              StatusPanel(
                title: 'RECOVERED',
                panelColor: Colors.green[100],
                textColor: Colors.green,
                count: worldData['recovered'].toString(),
              ),
              StatusPanel(
                title: 'DEATHS',
                panelColor: Colors.grey[400],
                textColor: Colors.grey[800],
                count: worldData['deaths'].toString(),
              ),
            ],
          ),

          Container(
            padding: EdgeInsets.only(right: 20, top: 10),
              alignment: Alignment.centerRight,
              child: Text('* TOTAL IMPACTED COUNTRIES: '+worldData['affectedCountries'].toString(),style: kUnderDataTextStyle.copyWith(fontWeight: FontWeight.w500)))
        ],
      ),

    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({this.panelColor, this.textColor, this.title, this.count});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Card(
      elevation:3,
      margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: panelColor,
          borderRadius: BorderRadius.circular(5),
          ),
        height: 80,
        width: width / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor)),
            Text(count,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor)),
          ],
        ),
      ),
    );
  }
}
