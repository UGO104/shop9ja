import 'package:shop9ja/pages/order/vendors/VendorsManager.dart';
import 'package:shop9ja/global.dart' as global;
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final Map<String, dynamic> constraints;
  SearchButton.show({
    String? searchHint,
    required void Function()? function}):
      constraints = Map<String, dynamic>() {
      constraints['searchHint'] = searchHint;
      constraints['function'] = function;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3),
      child: IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return Search(constraints);
              }
          ));
        },
      ),
    );
  }

}

class Search extends StatefulWidget{
  final Map<String, dynamic> constraints;
  Search(this.constraints);

  @override
  _SearchState createState() => _SearchState(constraints);

}

class _SearchState extends State<Search> {
  final Map<String, dynamic> constraints;
  _SearchState(this.constraints);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: constraints['function'],
              icon: Icon(Icons.search),
            ),
            border: InputBorder.none,
            hintText: constraints['searchHint'] ??= 'Search',
            hintStyle: TextStyle(
              color: Theme.of(context).hintColor
            )
          ),
        ),
      ),
      body: Column(
          children: <Widget>[
            SizedBox(height: 10),
            listView, // from VendorsManager
          ],
      ),
    );
  }
}
