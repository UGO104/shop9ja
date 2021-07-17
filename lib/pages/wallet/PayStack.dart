import 'package:flutter/material.dart';
import 'package:shop9ja/configWidget.dart';
import 'package:shop9ja/utils/alert_box.dart';
import 'package:shop9ja/global.dart' as global;
// ignore: import_of_legacy_library_into_null_safe
import 'package:paystack_manager/paystack_manager.dart';
import 'package:shop9ja/utils/validate_email.dart' show EmailValidator;


class PaymentInfo {

  static String? validateName(String? text, int description){
    String _description = description == 0 ? 'First name':'Last name';
    if(text!.trim().isEmpty) return '$_description must not be empty';
    else return null;
  }

  static String? validateEmail(text){
    if(!EmailValidator.validate(text))
      return 'A valid email should be provided';
    else return null;
  }

  static String? validateAmount(text) {
    try {
      int dAmount = int.parse(text);
      if(text!.trim().isEmpty || dAmount <= 0)
        return 'Amount should be valid, must not be empty or zero';
      else return null;
    }
    catch(error){ return 'Invalid Amount:  could not be converted';}
  }

}

class Payment {

  final int _amount;
  final String _email;
  final String _firstname;
  final String _lastname;
  final BuildContext _context;

  Payment.initialize(
    BuildContext context,{
    required String firstname,
    required String lastname,
    required String amount,
    required String email}):
    _lastname = lastname,
    _firstname = firstname, _amount = int.parse(amount),
    _context = context, _email = email { getManager(_context); }

  void getManager(context){
    try {
      PaystackPayManager manager = PaystackPayManager(context: context);
      manager.setEmail(_email);
      manager.setCompanyAssetImage(Image.asset('assets/dp.jpg'));
      manager.setSecretKey(global.PayStack_TestSecret);
      manager.setReference('${global.Ref_Id}');
      manager.setFirstName(_firstname);
      manager.setLastName(_lastname);
      manager.setAmount(_amount*100);
      manager.setCurrency('NGN');
      manager.setMetadata(
        {
          'custom_fields': {
            'value': global.appName,
            'display_name': 'Payment To',
            'variable_name': 'payment_to'
          }
        }
      );
      manager.onCancel(_onCancel);
      manager.onFailed(_onFailed);
      manager.onPending(_onPending);
      manager.onSuccesful(_onSuccessful);
      manager.initialize();
    }
    catch(e){
      AlertBox.screen(
        context,
        content: 'An error occurred. Check your network settings and try again later.'
      );
    }

  }

  void _onCancel(Transaction transaction) {
    print('_onCancel ${transaction.message}');
  }

  void _onFailed(Transaction transaction) {
    print('_onFailed ${transaction.message}');
  }

  void _onPending(Transaction transaction) {
    print('_onPending ${transaction.message}');
    AlertBox.screen(
        _context,
        title: 'Pending',
        content: "Your request is processing..."
    );
  }

  void _onSuccessful(Transaction transaction) {
    print('_onSuccessful ${transaction.message}');
    String content = 'Your Wallet ${transaction.refrenceNumber} '
                      'Has Been Credited with NGN $_amount On '
                      '${DateTime.now()} By $_firstname $_lastname. '
                      'Avail Balance: ${_amount + 22.23}';
    AlertBox.screen(_context, content: content, title: 'Wallet status');
  }

}