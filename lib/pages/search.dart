import 'package:flutter/material.dart';
import 'package:gruharaksha/data/constant.dart';
class Search extends SearchDelegate {
  final List countryList;

  Search(this.countryList);

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? countryList
        : countryList.where((element) =>
            element['country'].toString().toLowerCase().startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
        itemBuilder: (context, index) {
      return Container(
        height: 150,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[100],
            boxShadow: [
              BoxShadow(
                  color: kTextLightColor, blurRadius: 30, offset: Offset(0, 10))
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
                      suggestionList[index]['country'].toString(),
                      style: kCountryTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Image.network(
                      suggestionList[index]['countryInfo']['flag'],
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
                      'TESTED : ' + suggestionList[index]['tests'].toString(),
                      style: kDataTextStyle.copyWith(
                          color: kTestedColor, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text(
                            'CONFIRMED : ' +
                                suggestionList[index]['cases'].toString(),
                            style: kDataTextStyle.copyWith(
                                color: kInfectedColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            ' [ +${suggestionList[index]['todayCases']} ]',
                            style: kDataTextStyle.copyWith(
                                color: kInfectedColorLight,
                                fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    ),
                    Text(
                      'ACTIVE : ' + suggestionList[index]['active'].toString(),
                      style: kDataTextStyle.copyWith(
                          color: kPrimaryColor, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'RECOVERED : ' +
                          suggestionList[index]['recovered'].toString(),
                      style: kDataTextStyle.copyWith(
                          color: kRecoverColor, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text(
                            'DEATHS : ' +
                                suggestionList[index]['deaths'].toString(),
                            style: kDataTextStyle.copyWith(
                                color: kDeathColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            ' [ +${suggestionList[index]['todayDeaths']} ]',
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
    });
  }
}
