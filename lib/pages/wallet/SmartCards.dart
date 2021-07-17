import 'dart:math';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';

class SmartCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      loop: true,
      itemCount: 3,
      itemBuilder:(context, index) {
        return card();
      },
      pagination: SwiperPagination(
        alignment: Alignment.topCenter,
        builder: DotSwiperPaginationBuilder(
          color: Colors.grey,
          activeColor: Colors.red,
        ),
      ),
      controller: SwiperController(),
      itemWidth: MediaQuery.of(context).size.width,
      itemHeight: 230,
      scrollDirection:Axis.horizontal,
      layout: SwiperLayout.STACK
    );
  }

  Widget card() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromRGBO(35, 60, 103, 1),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Color.fromRGBO(50, 172, 121, 1),
                  child: Icon(Icons.check, color: Colors.white, size: 24,),
                ),

                Text("VISA", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 28, color: Colors.white, fontWeight: FontWeight.w900),)
              ],
            ),
            SizedBox(height: 32,),

            Text("**** **** **** 5647", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700, letterSpacing: 2.0),),

            SizedBox(height: 32,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("CARD HOLDER", style: TextStyle(fontSize: 12, color: Colors.blue[100], fontWeight: FontWeight.w700, letterSpacing: 2.0),),
                    Text("Maaz Aftab", style: TextStyle(fontSize: 16, color: Colors.grey[100], fontWeight: FontWeight.w700, letterSpacing: 2.0),),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("EXPIRES", style: TextStyle(fontSize: 12, color: Colors.blue[100], fontWeight: FontWeight.w700, letterSpacing: 2.0),),
                    Text("8/22", style: TextStyle(fontSize: 16, color: Colors.grey[100], fontWeight: FontWeight.w700, letterSpacing: 2.0),),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("CVV", style: TextStyle(fontSize: 12, color: Colors.blue[100], fontWeight: FontWeight.w700, letterSpacing: 2.0),),
                    Text("845", style: TextStyle(fontSize: 16, color: Colors.grey[100], fontWeight: FontWeight.w700, letterSpacing: 2.0),),
                  ],
                )
              ],
            )
          ],
        )
    );
  }

}