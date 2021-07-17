import 'package:flutter/material.dart';
import '../configWidget.dart';
import '../global.dart';

class School extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SchoolState();
  }

}

class _SchoolState extends State<School> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        text('School'),
      ],
    );
  }

}