import 'package:shop9ja/configWidget.dart';
import 'package:shop9ja/custom/Autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop9ja/global.dart' as global;
import 'CardPojo.dart';
import 'PayStack.dart';

class PaymentForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm>{
  // text controllers
  final TextEditingController sFirstnameCtrl = TextEditingController();
  final TextEditingController firstnameCtrl = TextEditingController();
  final TextEditingController lastnameCtrl = TextEditingController();
  final TextEditingController amountCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  // form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // text hints
  String hAmount = 'Amount';
  String hFirstname = 'First name';
  String hLastname = 'Last name';
  String hEmail = 'Email';

  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          SizedBox(height: 5),

          TypeAheadFormField<CardPojo?>(
            onSuggestionSelected: (CardPojo? cardfname) {
              firstnameCtrl.text = cardfname!.fname;
            },
            suggestionsCallback: (query) =>
                CardPojoApi.getCardSuggestions(context, query, 0),

            itemBuilder: (context, CardPojo? cardPojo) {
              return ListTile(title: text(cardPojo!.fname));
            },

            noItemsFoundBuilder: (context) => Container(height: 0),

            debounceDuration: Duration(milliseconds: 500),

            validator: (text) => PaymentInfo.validateName(text, 0),

            textFieldConfiguration: TextFieldConfiguration(
              controller: firstnameCtrl,
              decoration: InputDecoration(
                border: outlineBorder,
                labelText: hFirstname,
                focusedBorder: outlineBorder,
                labelStyle: TextStyle(color: Colors.blue),
                contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                suffixIcon: Icon(FontAwesomeIcons.userAlt, size: 18, color: Colors.blue),
              ),
            ),
          ),

          SizedBox(height: 10),

          TypeAheadFormField<CardPojo?>(
            onSuggestionSelected: (CardPojo? cardlname) {
              lastnameCtrl.text = cardlname!.lname;
            },
            suggestionsCallback: (query) =>
                CardPojoApi.getCardSuggestions(context, query, 0),

            itemBuilder: (context, CardPojo? cardPojo) =>
                ListTile(title: text(cardPojo!.lname)),

            noItemsFoundBuilder: (context) => Container(height: 0),

            debounceDuration: Duration(milliseconds: 500),

            validator: (text) => PaymentInfo.validateName(text, 1),

            textFieldConfiguration: TextFieldConfiguration(
              controller: lastnameCtrl,
              decoration: InputDecoration(
                labelText: hLastname,
                border: outlineBorder,
                focusedBorder: outlineBorder,
                labelStyle: TextStyle(color: Colors.blue),
                contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                suffixIcon: Icon(FontAwesomeIcons.userPlus, size: 18, color: Colors.blue),
              ),
            ),
          ),

          SizedBox(height: 10),

          TextFormField(
            controller: amountCtrl,
            decoration: InputDecoration(
              labelText: hAmount,
              border: outlineBorder,
              focusedBorder: outlineBorder,
              labelStyle: TextStyle(color: Colors.blue),
              contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15),
              suffixIcon: Icon(IconData(0x20a6), size: 20, color: Colors.blue),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            validator: (text)=> PaymentInfo.validateAmount(text),
          ),

          SizedBox(height: 10),

          TypeAheadFormField<CardPojo?>(
            onSuggestionSelected: (CardPojo? cardemail) {
              emailCtrl.text = cardemail!.email;
            },
            suggestionsCallback: (query) =>
                CardPojoApi.getCardSuggestions(context, query, 0),

            itemBuilder: (context, CardPojo? cardPojo) =>
                ListTile(title: text(cardPojo!.email)),

            noItemsFoundBuilder: (context) => Container(height: 0),

            debounceDuration: Duration(milliseconds: 500),

            validator: (text) => PaymentInfo.validateEmail(text),

            textFieldConfiguration: TextFieldConfiguration(
              controller: emailCtrl,
              decoration: InputDecoration(
                border: outlineBorder,
                labelText: 'Your email',
                focusedBorder: outlineBorder,
                contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                labelStyle: TextStyle(color: Colors.blue),
                suffixIcon: Icon(Icons.mail_sharp, size: 24, color: Colors.blue,),
              ),
            ),
          ),

          SizedBox(height: 20),

          SizedBox(
            width: deviceWidth,
            child: TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) Payment.initialize(
                  context,
                  firstname: firstnameCtrl.text,
                  lastname: lastnameCtrl.text,
                  amount: amountCtrl.text,
                  email: emailCtrl.text
                );
              },
              child: Padding(
                padding: EdgeInsets.all(5),
                child: text('Next', fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
              ),
              style: TextButton.styleFrom(elevation: 4, backgroundColor: Colors.blue),
            ),
          )
        ],
      ),
    );
  }

  OutlineInputBorder get outlineBorder => OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.zero),
    borderSide: BorderSide(color: Colors.grey.shade400)
  );

}