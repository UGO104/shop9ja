import 'package:shop9ja/utils/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../configWidget.dart';
import '../global.dart';

class BottomNavBar extends StatelessWidget {

  final void Function(int index)? _onSelected;
  final int? _selectedIndex;
  BottomNavBar.init({
    required Function(int index)? onSelected,
    required int? selectedIndex
  }):
    this._onSelected = onSelected,
    this._selectedIndex = selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: _selectedNavDecorator(
              context,
              FontAwesomeIcons.shoppingCart,
              'Buy Now', 0
            ),
            label: 'not used'
        ),
        BottomNavigationBarItem(
          icon:  _selectedNavDecorator(
            context,
            FontAwesomeIcons.taxi,
            'Near By', 1
          ),
          label: 'not used',
        ),
        BottomNavigationBarItem(
          icon:  _selectedNavDecorator(
            context,
            Icons.account_balance_wallet,
            'eWallet', 2
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: _selectedNavDecorator(
            context,
            Icons.school,
            'School', 3
          ),
          label: 'not used',
        ),
        BottomNavigationBarItem(
          icon: _selectedNavDecorator(
            context,
            Icons.more_vert_sharp,
            'More', 4
          ),
          label: 'not used',
        )
      ],
      selectedFontSize: 0,
      currentIndex: _selectedIndex!,
    );
  }

  Widget _selectedNavDecorator(context, iconData, data, index){
    Color?
    fg1 = Theme.of(context).accentColor,
        fg2 = Theme.of(context).textTheme.headline5?.color,
        bg1 = Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        bg2 = Theme.of(context).bottomNavigationBarTheme.unselectedItemColor;
    List<Color?> bg_color = <Color?>[bg1, bg2], f_color = <Color?>[fg1, fg2];

    return Container(
      width: double.infinity,
      height: kBottomNavigationBarHeight,
      child: Material(
        color: _selectedIndex == index ?
        bg_color.elementAt(0):bg_color.elementAt(1),
        child: InkWell(
          child: Column(
            children: <Widget>[
              SizedBox(height: 8),
              Icon(
                iconData,
                size: 20,
                color: _selectedIndex == index ?
                f_color.elementAt(0):f_color.elementAt(1),
              ),
              SizedBox(height: 7),
              text(
                data,
                fontSize: 10,
                color: _selectedIndex == index ?
                            f_color.elementAt(0):f_color.elementAt(1),
              ),
            ],
          ),
          onTap: () => _onSelected!(index),
        ),
      ),
    );
  }
}