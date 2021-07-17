import 'package:shop9ja/pages/wallet/CardScreen.dart';
import 'package:shop9ja/utils/alert_box.dart';
import 'package:flutter/material.dart';
import '../../configWidget.dart';
import '../../global.dart'as global;
import 'RecentTransactions.dart';
import 'Topup.dart';

class E$Wallet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _E$WalletState();
  }

}

class _E$WalletState extends State<E$Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      text(
                        "\u20a6${global.availBalance}",
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).textTheme.headline6!.color,
                        fontSize: 36,
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: ClipOval(
                                child: Image.asset("assets/dp.jpg", fit: BoxFit.contain,),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),

                  Text("Available Balance", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.blue[100]),),

                  SizedBox(height : 24,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Topup.screen(),
                          ));
                        },
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(243, 245, 248, 1),
                                    borderRadius: BorderRadius.all(Radius.circular(18))
                                ),
                                child: Icon(Icons.trending_down, color: Colors.blue[900], size: 30,),
                                padding: EdgeInsets.all(12),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text("Topup", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.blue[100]),),
                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          AlertBox.screen(
                            context,
                            title: 'Title',
                            content: 'Your wallet balance is \u20a6 200.36 Your wallet balance is \u20a6 200.36 Your wallet balance is \u20a6 200.36 Your wallet balance is \u20a6 200.36'
                          );
                        },
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(243, 245, 248, 1),
                                    borderRadius: BorderRadius.all(Radius.circular(18))
                                ),
                                child: Icon(IconData(0x20a6), color: Colors.blue[900], size: 30,),
                                padding: EdgeInsets.all(12),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text("Buy Now", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.blue[100]),),
                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(243, 245, 248, 1),
                                    borderRadius: BorderRadius.all(Radius.circular(18))
                                ),
                                child: Icon(Icons.date_range, color: Colors.blue[900], size: 30,),
                                padding: EdgeInsets.all(12),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text("Receipt", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.blue[100]),),
                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(243, 245, 248, 1),
                                    borderRadius: BorderRadius.all(Radius.circular(18))
                                ),
                                child: Icon(Icons.public, color: Colors.blue[900], size: 30,),
                                padding: EdgeInsets.all(12),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text("Reservation", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.blue[100]),),
                            ],
                          ),
                        ),
                      )

                    ],
                  ),
                ],
              ),
            ),
            RecentTransactions(),
          ],
        ),
      )
    );
  }

  List<Widget> _buildList(int count) {
    List<Widget> listItems = List.generate(count, (index) {
      return Padding(padding: new EdgeInsets.all(20.0),
          child: new Text(
              'Item ${index.toString()}',
              style: new TextStyle(fontSize: 25.0)
          )
      );
    });
    return listItems;

  }

}