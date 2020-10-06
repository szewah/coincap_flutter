import 'package:flutter/material.dart';

class CryptoDetail extends StatefulWidget {
  @override
  _CryptoDetailState createState() => _CryptoDetailState();
}

class _CryptoDetailState extends State<CryptoDetail> {


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
                label: Text('Previous'),
              )
            ],)
        )
      )
    );
  }
}