import 'dart:convert';
import 'package:gruharaksha/data/constant.dart';
import 'package:gruharaksha/pages/countryPage.dart';
import 'package:gruharaksha/pages/worldpanel.dart';
import 'package:gruharaksha/panels/infopanel.dart';
import 'package:gruharaksha/panels/mosteffected.dart';
import 'package:gruharaksha/panels/pie_chart_panel.dart';
import 'package:gruharaksha/widgets/my_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String urlAll = 'https://corona.lmao.ninja/v2/all';
  final String urlCountry =
      'https://corona.lmao.ninja/v2/countries?sort=deaths';
  final controller = ScrollController();
  double offset = 0;

  Map worldData;

  fetchWorldData() async {
    http.Response httpResponse = await http.get(urlAll);
    setState(() {
      worldData = json.decode(httpResponse.body);
    });
  }

  List countryData;

  fetchCountryData() async {
    http.Response httpResponse = await http.get(urlCountry);
    setState(() {
      countryData = json.decode(httpResponse.body);
    });
  }

  Future fetchData()async{
    fetchWorldData();
    fetchCountryData();
  }
  @override
  void initState() {
    fetchData();
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
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
        title: Text('COVID-19 TRACKER',style: kAppBarTextStyle.copyWith(color: kBackgroundColor),),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
          controller: controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyHeader(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'WE STAND TOGETHER',
                    style: kDataTextStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Worldwide Data',
                      style: kHeadingTextStyle,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: ((context)=> CountryPage())));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: kTitleTextColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Regional',
                          style: kDataTextStyle.copyWith(
                              color: kBackgroundColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              worldData == null
                  ? CircularProgressIndicator()
                  : Container(
                padding: EdgeInsets.all(10),
                color: kShadowColor,
                    child: WorldPanel(
                        worldData: worldData,
                      ),
                  ),
              PieChartPanel(worldData: worldData),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 20, right: 10, bottom: 5),
                child: Text(
                  'Most Effected Countries',
                  style: kHeadingTextStyle,
                ),
              ),
              countryData == null
                  ? CircularProgressIndicator()
                  : Container(
                      color: Colors.red[50],
                      child: MostEffectedData(
                        countryData: countryData,
                      ),
                    ),
              SizedBox(height: 20),
              InfoPanel(),
              SizedBox(height: 20),
              Center(child: Text('2020 \u00a9 Aditya Nath')),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
