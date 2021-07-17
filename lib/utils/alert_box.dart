import 'dart:ui';

import 'package:shop9ja/configWidget.dart';
import 'package:shop9ja/pages/appbar/MenuProperties.dart';
import 'package:flutter/material.dart';

class AlertBox {
  final List<Widget>? _actions;
  final BuildContext _context;
  final String _content;
  final String? _title;

  AlertBox.screen(context, {title, required content, actions}):
    _content = content, _context = context,
    _actions = actions, _title = title{ show; }

  get show {
    showDialog(
      context: _context,
      builder: (context){
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0))
            ),
            title: _title == null ? null:text(
              _title!,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            titlePadding: EdgeInsets.only(right:20, left:20, top:20, bottom:0),
            contentPadding: EdgeInsets.only(right:15, left:15, top:15),
            actionsPadding: EdgeInsets.only(right:15, top:10),
            content: text(_content, fontSize: 14),
            actions: _actions?? [defaultOkayBtn],
            buttonPadding: EdgeInsets.zero,
          ),
        );
      },
      barrierDismissible: false
    );
  }

  Widget get defaultOkayBtn => TextButton(
    child: text(
      'Cancel',
      fontSize: 14,
      color: Colors.blue,
      fontWeight: FontWeight.w600 ),
    onPressed:(){Navigator.of(_context, rootNavigator: true).pop();},
  );

}