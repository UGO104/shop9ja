import 'package:shop9ja/pages/order/BuyNow.dart';
import 'package:shop9ja/pages/NearBy.dart';
import 'package:shop9ja/pages/School.dart';
import 'package:shop9ja/pages/wallet/eWallet.dart';

import 'BottomNavWidget.dart';
import '../global.dart' as global;

import 'package:flutter/material.dart';
import 'More.dart';
import 'PageAppBar.dart';
import 'appbar/MoreOptions.dart';
import 'appbar/NotificationBadge.dart';

//
// This is the stateful widget that the main application instantiates.
//
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

//
// This is the private State class that goes with MyStatefulWidget.
//
class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  _MyStatefulWidgetState() {
    MainAppBar.update(global.selectedNavIndex);
  }

  List<Widget> _widgetOptions = <Widget>[
    OrderPage(),
    NearBy(),
    E$Wallet(),
    School(),
    More()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: Key('mainAppBar'),
        centerTitle: false,
        title: Text(global.appName),
        actions: [
          ...global.optionalAppBarAction,
          NotificationBadge(),
          Menu.addItems(menuitems: [
            ...global.optionalMenuItems,
            PopupMenuItem(
              value: 'settings',
              child: Text('Settings'),
            )
          ]),
        ]
      ),
      body: SafeArea(
        child: Center(
          child: _widgetOptions.elementAt(global.selectedNavIndex),
        ),
      ),
      bottomNavigationBar: BottomNavBar.init(
          onSelected: (index){
            setState(() {
              global.optionalAppBarAction.clear();
              global.optionalMenuItems.clear();
              MainAppBar.update(index);
              global.selectedNavIndex = index;
            });
          },
          selectedIndex: global.selectedNavIndex
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
