import 'package:flutter/material.dart';


class NotificationBadge extends StatelessWidget{
  NotificationBadge();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Icon(Icons.notifications_none_outlined, size: 30,),
        new Positioned(
          top: 10,
          right: 0,
          child: new Container(
            padding: EdgeInsets.all(2),
            decoration: new BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: BoxConstraints(
              minWidth: 18,
              minHeight: 18,
            ),
            child: new Text(
              '3',
              style: new TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }

}