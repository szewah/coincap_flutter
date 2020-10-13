import 'package:coincap_flutter/services/currency.dart';
import 'package:flutter/material.dart';
import 'package:coincap_flutter/screens/time/1D.dart';
import 'package:coincap_flutter/screens/time/5D.dart';
import 'package:coincap_flutter/screens/time/30D.dart';

class CryptoDetail extends StatelessWidget {

  final Currency coin;

  CryptoDetail({Key key, @required this.coin}): super(key:key);

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Text('Title'),
          ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(1, 50, 0, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                child: 
                Text(
                  '${coin.name}',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      )
                )
              ),
              Container(
                height: 50,
                child: Text(
                '\$${coin.price}',
                style: TextStyle(
                  fontSize: 40,
                  )
                )
              ),
              SizedBox(height:50),
              Container(
                height: 50, 
                child: DefaultTabController(
                  length: 3, 
                  child: Scaffold(
                    appBar: PreferredSize(
                      preferredSize:Size.fromHeight(35),                    
                      child: TabBar(
                        labelColor: Colors.black12,
                        indicatorColor: Colors.amber,
                        tabs: [
                          Tab(text: '1D'),
                          Tab(text: '5D'),
                          Tab(text: '30D'),
                        ],
                      ),
                    ),
                    body: TabBarView(
                      children: [
                        OneDay(),
                        FiveDay(),
                        ThirtyDay()
                      ])
                    )
                  )
                )
              ],
            )
          )
        ); 
       
      
      
      
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.redAccent,
    //     title: Text(coin.name, style: TextStyle(fontSize: 20),),
    //     elevation: 0,
    //   ),
    //   body: SafeArea(
    //     child: Padding(
    //       padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
    //       child: 
    //       Column(
    //         children: [
    //           SizedBox(height: 100,),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Text(
    //                 '${coin.name}',
    //                 style: TextStyle(
    //                     fontSize: 50,
    //                     fontWeight: FontWeight.w500,
    //                     )
    //               )
    //             ],
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Text(
    //                 '\$${coin.price}',
    //                 style: TextStyle(
    //                   fontSize: 50,
    //                   )
    //                 )
    //             ],)
    //           ,
    //           SizedBox(height: 20,),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Text(
    //                 '24hr',
    //                 style: TextStyle(
    //                   fontSize: 20,
    //                 )),
    //               Icon(
    //                 coin.change_24hr > 0 ? Icons.arrow_drop_up: Icons.arrow_drop_down,
    //                 color: coin.change_24hr > 0 ? Colors.green : Colors.red,
    //                 size: 24,
    //               ),
    //               Text(
    //                 '\$${coin.change_24hr}',
    //                 style: TextStyle(
    //                   fontSize:20,
    //                   letterSpacing: 1,
    //                   )
    //                 ),
    //               Text(
    //                 '(${coin.change_24hrPercent})%',
    //                 style: TextStyle(
    //                   fontSize:20,
    //                   letterSpacing: 1,
    //                   )
    //                 ),
    //             ],
    //           ),
    //           SizedBox(height: 10),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
                 
    //             ],
    //           )
    //         ],
    //         )
    //     ),
    //   )
    // );
  }
}