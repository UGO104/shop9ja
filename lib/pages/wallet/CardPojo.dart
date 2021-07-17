import 'dart:convert';
import 'package:flutter/material.dart';

class CardPojo {
  final String fname;
  final String lname;
  final String email;

  CardPojo({required this.fname, required this.lname, required this.email});

  static CardPojo fromJson(Map<String, dynamic> json) => CardPojo(
    fname: json['fname'], lname: json['lname'], email: json['email']
  );

}

class CardPojoApi {
  static Future<List<CardPojo>> getCardSuggestions(context, String _query, _case) async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/fake_cards.json");
    if(data.isNotEmpty) {
      List cards = json.decode(data);
      var iterable = cards.map((json){
        return CardPojo.fromJson(json);
      }).where((card){ switch(_case){
        case 0:
          final fname = card.fname.toLowerCase();
          final query = _query.toLowerCase();
          return fname.contains(query);
        case 1:
          final lname = card.lname.toLowerCase();
          final query = _query.toLowerCase();
          return lname.contains(query);
        case 2:
          final email = card.email.toLowerCase();
          final query = _query.toLowerCase();
          return email.contains(query);
      }
      return false;
      });
      return iterable.toList();
    }

    throw Exception();

  }

}