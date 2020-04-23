import 'package:gruharaksha/data/constant.dart';
import 'package:gruharaksha/pages/faqpage.dart';
import 'package:gruharaksha/pages/info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  String urlString =
      'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InfoScreen()));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: kTitleTextColor,
              ),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'INFORMATION',
                    style: kHeadingTextStyle.copyWith(color: kBackgroundColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.arrow_forward,
                      color: kBackgroundColor,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: ((context)=> FAQPage())));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: kTitleTextColor,
              ),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'FAQ\'s',
                    style: kHeadingTextStyle.copyWith(color: kBackgroundColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.arrow_forward,
                      color: kBackgroundColor,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              launch(urlString);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: kTitleTextColor,
              ),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'MYTH BUSTERS',
                    style: kHeadingTextStyle.copyWith(color: kBackgroundColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.arrow_forward,
                      color: kBackgroundColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
