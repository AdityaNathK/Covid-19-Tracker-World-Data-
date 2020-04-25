import 'package:gruharaksha/data/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class MyHeader extends StatefulWidget {
  @override
  _MyHeaderState createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {



  final DateTime _currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String _formattedDate = DateFormat.yMMMMEEEEd().format(_currentDate);
    return Container(
      color: Colors.deepPurple,
      height: 200,
      width: double.infinity,
      child: Center(child: Text('$_formattedDate',style: kDataTextStyle.copyWith(color: kBackgroundColor),)),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.height, size.width, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

