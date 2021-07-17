import 'package:flutter/material.dart';
import '../configWidget.dart';
import '../global.dart';

class More extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MoreState();
  }

}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        text('More'),
      ],
    );
  }

}