import 'package:flutter/material.dart';
import '../configWidget.dart';
import '../global.dart';

class NearBy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NearByState();
  }

}

class _NearByState extends State<NearBy> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        text('NearBy'),
      ],
    );
  }

}