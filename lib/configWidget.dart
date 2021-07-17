import 'package:flutter/material.dart';

Widget text(String data, {
  Key? key,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  String? fontFamily}) {
  return Builder(builder: (context) =>
      Text(
        data,
        style: TextStyle(
          color: color ?? Theme.of(context).textTheme.headline5?.color,
          fontSize: fontSize ?? 12,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontFamily: fontFamily ?? '',
        ),
      )
  );
}