import 'package:gruharaksha/data/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MostEffectedData extends StatelessWidget {
  final List countryData;

  const MostEffectedData({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, right: 10),
                  child: Text(
                    'COUNTRY',
                    style: kHeadTextStyle,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: Text(
                    'ACTIVE',
                    style: kHeadTextStyle,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: Text(
                    'DEATHS',
                    style: kHeadTextStyle,
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                padding:
                    EdgeInsets.only(left: 20, top: 8, bottom: 8, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Image.network(
                          countryData[index]['countryInfo']['flag'],
                          height: 30,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                            child: Text(countryData[index]['country'],
                                style: kDataTextStyle.copyWith(
                                    fontWeight: FontWeight.w600))),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(countryData[index]['active'].toString(),
                            style: kDataTextStyle.copyWith(
                                color: kDeathColor,
                                fontWeight: FontWeight.w600),),),

                    Expanded(
                        flex: 2,
                        child: Text(countryData[index]['deaths'].toString(),
                            style: kDataTextStyle.copyWith(
                                color: kDeathColor,
                                fontWeight: FontWeight.w600),),),
                  ],
                ),
              );
            },
            itemCount: 5,
          ),
        ],
      ),
    );
  }
}

//v2/countries
//[
//  {
//    "country": "string",
//    "countryInfo": {
//      "_id": 0,
//      "iso2": "string",
//      "iso3": "string",
//      "country": "string",
//      "lat": 0,
//      "long": 0,
//      "flag": "string"
//    },
//    "cases": 0,
//    "todayCases": 0,
//    "deaths": 0,
//    "todayDeaths": 0,
//    "recovered": 0,
//    "active": 0,
//    "critical": 0,
//    "casesPerOneMillion": 0,
//    "deathsPerOneMillion": 0,
//    "updated": 0
//  }
//]
