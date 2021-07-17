import 'package:shop9ja/pages/order/vendors/VendorInfo.dart';
import 'package:flutter/material.dart';

const String appName = 'Shop9ja'; // squirrel (in spanish)

List<VendorInfo> vendors = []; // list of pages.vendors

List<PopupMenuItem<String>> optionalMenuItems = []; // appBar Menu.items list

List<Widget> optionalAppBarAction = <Widget>[]; // appBar optional actions

int selectedNavIndex = 0; // selected BottomNavigationBarItem index

int? notificationBadge; // appBar NotificationBadge number

double? availBalance = 0.00; // e-wallet available balance

const String PayStack_TestSecret = 'sk_test_0bc077d64af6234c07b296b887fdc45c075c64ab';

int Ref_Id = DateTime.now().millisecondsSinceEpoch; // payment ref id number
// textCard 5060 6666 6666 6666 666; cvv 123