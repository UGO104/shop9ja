import 'dart:convert';
import 'package:shop9ja/pages/order/vendors/VendorInfo.dart';

import './global.dart' as global;

import 'package:shop9ja/theme.dart';
import 'package:flutter/material.dart';
import 'package:shop9ja/pages/MainBody.dart';

void main() => runApp(const MyApp());

//This is the main application widget.
class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    fakeVendors(context);
    return MaterialApp(
      title: global.appName,
      theme: Themes.light,
      home: MyStatefulWidget(),
    );
  }

  void fakeVendors(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/fake_vendors.json");
    List<dynamic> vendors = json.decode(data);
    for(Map<String, dynamic> vendor in vendors){
      global.vendors.add(VendorInfo.fromJson(vendor));
    }
  }

}

