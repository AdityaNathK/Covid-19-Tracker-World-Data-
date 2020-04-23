import 'package:gruharaksha/data/constant.dart';
import 'package:gruharaksha/data/textdatasource.dart';
import 'package:flutter/material.dart';

int counter = 1;

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'FAQ\'S',
          style: kAppBarTextStyle,
        ),
      ),
      body: ListView.builder(
          itemCount: DataSource.questionAnswers.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${index + counter}) ',
                        style: kDataTextStyle.copyWith(
                            fontWeight: FontWeight.w600),
                      ),
                      Expanded(
                        child: Text(
                          DataSource.questionAnswers[index]['question'],
                          style: kDataTextStyle.copyWith(
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                  Divider(),
                ],
              ),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Text(
                    DataSource.questionAnswers[index]['answer'],
                    style: kDataTextStyle,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
