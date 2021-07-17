import 'package:shop9ja/pages/order/vendors/VendorsManager.dart';

// import '../../global.dart' as global;
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key? key});

  @override
  State<StatefulWidget> createState() {
    return _OrderPageState._();
  }
}

class _OrderPageState extends State<OrderPage> {
  _OrderPageState._();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: ColoredBox(
            color: Colors.black38,
            child: Stack(
              children: <Widget>[],
            ),
          ),
          color: Colors.white,
          width: double.infinity,
          height: 0,
        ),
        SizedBox(height: 1),
        VendorsManager(),
      ],
    );
  }
}
