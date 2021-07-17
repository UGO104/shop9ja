import 'package:flutter/material.dart';
import 'MenuProperties.dart';

class Menu extends StatelessWidget{
  final List<PopupMenuItem<String>> menuitems;
  Menu.addItems({required this.menuitems});
  @override
  Widget build(BuildContext context) {
    return _MenuProperties(menuitems).buttonMenu(
        offset: Offset(0, 55)
    );
  }
}

class _MenuProperties extends MenuProperties<String> {
  final List<PopupMenuItem<String>> _menuitems;
  _MenuProperties(this._menuitems);

  @override
  List<PopupMenuItem<String>> get menuItems => _menuitems;

  @override
  void onSelection(String value) {
    switch(value){
      case 'settings': _MenuActions.settings();
      break;
      case 'location': _MenuActions.location();
      break;
      case 'becomeAgent': _MenuActions.becomeAnAgent();
      break;
    }
  }
}

class _MenuActions {

  static settings(){
    print('settings menu clicked');
  }

  static location(){
    print('location menu clicked');
  }

  static becomeAnAgent(){
    print('becomeAnAgent menu clicked');
  }

}