import 'package:shop9ja/configWidget.dart';
import 'package:shop9ja/pages/appbar/MenuProperties.dart';
import 'package:shop9ja/global.dart';
import 'package:flutter/material.dart';
import 'VendorInfo.dart';

class Vendor extends StatelessWidget {

  final VendorInfo _vendorInfo; // class property
  Vendor(this._vendorInfo); // constructor

  @override
  Widget build(BuildContext context) {
    return ListTile(
        tileColor: Theme.of(context).primaryColor,
        horizontalTitleGap: 1,
        title: text(_vendorInfo.name, fontSize: 16),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            text(_vendorInfo.location, fontSize: 10),
            Icon(
              Icons.location_on_outlined,
              color: Theme.of(context).accentColor,
              size: 18,
            ),
            text(_vendorInfo.perKG, fontSize: 10)
          ],
        ),
        trailing: Wrap(
          spacing: 10,
          children: <Widget>[
            TextButton(
              child: text(
                'BUY NOW',
                fontSize: 16,
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.w600
              ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                shape: StadiumBorder(
                  side: BorderSide(
                    width: 2.0,
                    color: Theme.of(context).accentColor)
                )
              ),
              onPressed: _isOpen() ? ()=>_orderGas() : null,
            ),
          ],
          crossAxisAlignment: WrapCrossAlignment.center,
        ),
        // tileColor: ,
    );
  }

  Color _getStatus() {
    if (_vendorInfo.status == "open")
      return Colors.lightGreen.shade400;
    else return Colors.red.shade500;
  }

  // click to order for gas refill
  dynamic _orderGas(){
    print('Preparing to Order from ${_vendorInfo.name} ${_vendorInfo.status}');
  }

  // check is vendor is open/closed for the day
  bool _isOpen() => _vendorInfo.status == "open";

}