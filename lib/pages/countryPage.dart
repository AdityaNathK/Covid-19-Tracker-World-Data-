import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gruharaksha/data/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  final String urlCountry = 'https://corona.lmao.ninja/v2/countries';
  List countryData;

  fetchCountryData() async {
    http.Response httpResponse = await http.get(urlCountry);
    setState(() {
      countryData = json.decode(httpResponse.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF3383CD),
                Color(0xFF11249F),
              ],
            ),
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text('COUNTRY STATS', style: kAppBarTextStyle),
      ),
      body: countryData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(itemBuilder: (context, index) {
//      return Container();
              return Container(
                height: 150,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[100],
                    boxShadow: [
                      BoxShadow(
                          color: kTextLightColor,
                          blurRadius: 30,
                          offset: Offset(0, 10))
                    ]),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              countryData[index]['country'],
                              style: kCountryTextStyle.copyWith(fontWeight: FontWeight.w600,),
                            ),
                            Image.network(
                              countryData[index]['countryInfo']['flag'],
                              height: 60,
                              width: 80,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'TESTED : ' +
                                  countryData[index]['tests'].toString(),
                              style: kDataTextStyle.copyWith(
                                  color: kTestedColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'CONFIRMED : ' +
                                        countryData[index]['cases'].toString(),
                                    style: kDataTextStyle.copyWith(
                                        color: kInfectedColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(' [ +${countryData[index]['todayCases']} ]',
                                    style: kDataTextStyle.copyWith(
                                        color: kInfectedColorLight,
                                        fontWeight: FontWeight.w800),
                                  ),
                                )
                              ],
                            ),
                            Text(
                              'ACTIVE : ' +
                                  countryData[index]['active'].toString(),
                              style: kDataTextStyle.copyWith(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'RECOVERED : ' +
                                  countryData[index]['recovered'].toString(),
                              style: kDataTextStyle.copyWith(
                                  color: kRecoverColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'DEATHS : ' +
                                        countryData[index]['deaths'].toString(),
                                    style: kDataTextStyle.copyWith(
                                        color: kDeathColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(' [ +${countryData[index]['todayDeaths']} ]',
                                    style: kDataTextStyle.copyWith(
                                        color: kDeathColorLight,
                                        fontWeight: FontWeight.w800),
                                  ),
                                )

                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
    );
  }
}
