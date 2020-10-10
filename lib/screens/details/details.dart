import 'package:coincap_flutter/services/currency.dart';
import 'package:flutter/material.dart';


class CryptoDetail extends StatelessWidget {

  final Currency coin;

  CryptoDetail({Key key, @required this.coin}): super(key:key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(coin.name, style: TextStyle(fontSize: 20),),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: 
          Column(
            children: [
              SizedBox(height: 100,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${coin.name}',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                        )
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$${coin.price}',
                    style: TextStyle(
                      fontSize: 50,
                      )
                    )
                ],)
              ,
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '24hr',
                    style: TextStyle(
                      fontSize: 20,
                    )),
                  Icon(
                    coin.change_24hr > 0 ? Icons.arrow_drop_up: Icons.arrow_drop_down,
                    color: coin.change_24hr > 0 ? Colors.green : Colors.red,
                    size: 24,
                  ),
                  Text(
                    '\$${coin.change_24hr}',
                    style: TextStyle(
                      fontSize:20,
                      letterSpacing: 1,
                      )
                    ),
                  Text(
                    '(${coin.change_24hrPercent})%',
                    style: TextStyle(
                      fontSize:20,
                      letterSpacing: 1,
                      )
                    ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                ],
              )
            ],
            )
        ),
      )
    );
  }
}