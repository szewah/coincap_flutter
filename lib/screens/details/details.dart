import 'package:coincap_flutter/services/currency.dart';
import 'package:flutter/material.dart';


class CryptoDetail extends StatelessWidget {

  final Currency coin;

  CryptoDetail({Key key, @required this.coin}): super(key:key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Column(
            children: [
              FlatButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                }, 
                icon: Icon(
                  Icons.arrow_back_sharp
                ), 
                label: Text(coin.name),
              )
            ],)
        ),
      )
    );
  }
}