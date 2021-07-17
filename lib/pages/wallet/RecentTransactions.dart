import 'package:shop9ja/configWidget.dart';
import 'package:shop9ja/pages/appbar/MenuProperties.dart';
import 'package:flutter/material.dart';

class RecentTransactions extends StatelessWidget {

  RecentTransactions();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (context, scrollController){
        return Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(243, 245, 248, 1),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
          ),
          margin: EdgeInsets.only(top: 20),
          child: CustomScrollView(
            controller: scrollController,
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                elevation: 1,
                collapsedHeight: 140,
                shadowColor: Colors.white,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
                ),
                flexibleSpace: Column(
                  children: <Widget>[
                    SizedBox(height: 24,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Recent Transactions", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Colors.black),),
                          Text("See all", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.grey[800]),)
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 32),
                    ),
                    SizedBox(height: 20),

                    //Container for buttons
                    Container(
                      padding: EdgeInsets.only(left: 3, right: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Text("All", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.grey[900]),),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10.0, spreadRadius: 1)]
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          ),
                          SizedBox(width: 16,),
                          Container(
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor: Colors.green,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text("Top Up", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.grey[900]),),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10.0, spreadRadius: 1)]
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          ),

                          SizedBox(width: 16,),
                          Container(
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor: Colors.orange,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text("Purchases", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.grey[900]),),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10.0, spreadRadius: 1)]
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: text("TODAY", fontSize: 15, fontWeight: FontWeight.w700, color: Colors.grey[500]),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  margin: EdgeInsets.only(top: 15, bottom: 10),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Container(
                        margin: EdgeInsets.only(left: 32, right: 32, bottom: 10),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.all(Radius.circular(18))
                              ),
                              child: Icon(Icons.date_range, color: Colors.lightBlue[900],),
                              padding: EdgeInsets.all(12),
                            ),

                            SizedBox(width: 16,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Payment", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.grey[900]),),
                                  Text("Payment from Saad", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.grey[500]),),
                                ],
                              ),
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text("+\$500.5", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.lightGreen),),
                                Text("26 Jan", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.grey[500]),),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  childCount: 2,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: text("YESTERDAY", fontSize: 15, fontWeight: FontWeight.w700, color: Colors.grey[500]),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  margin: EdgeInsets.only(top: 15, bottom: 10),
                ),
              ),
              SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 32, right: 32, bottom: 10),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.all(Radius.circular(18))
                            ),
                            child: Icon(Icons.directions_car, color: Colors.lightBlue[900],),
                            padding: EdgeInsets.all(12),
                          ),

                          SizedBox(width: 16,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Petrol", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.grey[900]),),
                                Text("Payment from Saad", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.grey[500]),),
                              ],
                            ),
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text("-\$500.5", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.orange),),
                              Text("26 Jan", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.grey[500]),),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                childCount: 6
                )
              )
            ],
          ),
        );
      },
      initialChildSize: 0.65,
      minChildSize: 0.65,
      maxChildSize: 1,
    );
  }

}