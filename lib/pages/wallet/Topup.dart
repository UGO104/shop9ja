import 'package:shop9ja/pages/appbar/MenuProperties.dart';
import 'package:shop9ja/pages/appbar/MoreOptions.dart';
import 'package:shop9ja/pages/wallet/PaymentForm.dart';
import 'package:flutter/cupertino.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shop9ja/configWidget.dart';
import 'package:flutter/material.dart';

class Topup extends StatefulWidget {
  Topup.screen();
  @override
  State<StatefulWidget> createState() {
    return _TopupState();
  }

}

class _TopupState extends State<Topup> {
  final ScrollController sAppbarCtrl = ScrollController();

  bool get isShrinked => (
    sAppbarCtrl.hasClients &&
    sAppbarCtrl.offset > (200 - kToolbarHeight)
  );

  @override
  void initState() {
    sAppbarCtrl.addListener(() {
      if(isShrinked) setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: sAppbarCtrl,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            elevation: 2,
            floating: true,
            expandedHeight: 200, // @important
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              collapseMode: CollapseMode.pin,
              title: text(
                'Your Wallet', fontWeight: FontWeight.bold,
                fontSize: 20, color: isShrinked ? Colors.black : Colors.white
              ),
              background: Swiper(
                itemCount: 3,
                autoplay: true,
                autoplayDelay: 10000,
                pagination: SwiperPagination(
                  alignment: Alignment.topCenter,
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.grey,
                    activeColor: Colors.amberAccent,
                  ),
                ),
                itemBuilder:(context, index) {
                  return Image.asset(
                    'assets/images/wallet_${index + 1}.jpg',
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            actions: <Widget>[
              Menu.addItems(
                menuitems: <PopupMenuItem<String>>[

                ],
              )
            ],
          ),
          SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10, top:10, bottom: 282),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: .5,
                              spreadRadius: 1.0,
                              color: Colors.black.withOpacity(.12))
                        ],
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20)
                        )
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: text(
                                    'Caution: All fields are required. Only the first and last name'
                                        ' on the smart card or bank account should be provided.'
                                        ' Any valid email can be provided.',
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                )
                              ),
                              IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.close, color: Colors.white,),
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    PaymentForm(),
                  ],
                ),
              )
          ),
        ],
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      ),
    );
  }
}