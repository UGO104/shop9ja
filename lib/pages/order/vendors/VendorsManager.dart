import '../../../global.dart' as global;
import 'package:flutter/material.dart';
import 'package:shop9ja/pages/order/vendors/VendorWidget.dart';

double _listMargin = 0; // global property

class VendorsManager extends StatefulWidget {
  VendorsManager({Key? key});

  @override
  State<StatefulWidget> createState() {
    return _VendorsManagerState._();
  }
}

class _VendorsManagerState extends State<VendorsManager> {
  _VendorsManagerState._();

  @override
  Widget build(BuildContext context) {
    return listView;
  }
}

Widget get listView =>
    Expanded(
        child:Padding(
          padding: EdgeInsets.all(_listMargin),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: global.vendors.length ,
            itemBuilder: (BuildContext context, int index) {
              return Vendor(global.vendors[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: _listMargin,);
            },
          ),
        )
    );

