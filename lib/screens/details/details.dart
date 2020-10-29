import 'package:coincap_flutter/services/currency.dart';
import 'package:flutter/material.dart';
import 'package:coincap_flutter/screens/time/1D.dart';
import 'package:coincap_flutter/screens/time/5D.dart';
import 'package:coincap_flutter/screens/time/30D.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class CryptoDetail extends StatelessWidget {

  final Currency coin;

  CryptoDetail({Key key, @required this.coin}): super(key:key);

  //clear cache
  Future<void> _deleteCacheContents() async {
    final cacheDir = await getTemporaryDirectory();
    var cache1 = '${coin.id}' + '1CacheData.json';
    var cache5 ='${coin.id}' + '5CacheData.json';
    var cache30 = '${coin.id}' + '30CacheData.json';
    if (await File(cacheDir.path + '/' + cache1).exists()) {
      cacheDir.delete(recursive: true);
      print("Deleted $cacheDir file!!");
    }
    if (await File(cacheDir.path + '/' + cache5).exists()) {
      cacheDir.delete(recursive: true);
      print("Deleted $cacheDir file!!");
    }
    if (await File(cacheDir.path + '/' + cache30).exists()) {
      cacheDir.delete(recursive: true);
      print("Deleted $cacheDir file!!");
    }
  }


  @override
  Widget build(BuildContext context) {
      _deleteCacheContents();
      
      return Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.orange[800],
          title: Text('Back'),
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
                      color: Colors.grey[800]
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
              SizedBox(height:10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '24hr',
                    style: TextStyle(
                      fontSize: 20,
                    )
                  ),
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
                      color: coin.change_24hr > 0 ? Colors.green : Colors.red,
                      )
                    ),
                  Text(
                    ' (${coin.change_24hrPercent}%)',
                    style: TextStyle(
                      fontSize:20,
                      letterSpacing: 1,
                      color: coin.change_24hr > 0 ? Colors.green : Colors.red,
                    )
                  ),
                ],
              ),
              SizedBox(height:30),
              Container(
                height: 380, 
                child: DefaultTabController(
                  length: 3, 
                  child: Column(                 
                    children: [
                      TabBar(
                        labelColor: Colors.black12,
                        indicatorColor: Colors.orange[500],
                        tabs: [
                          Tab(text: '1D'),
                          Tab(text: '5D'),
                          Tab(text: '30D'),
                        ],
                    ),
                    Container(
                      height: 332.0,
                      child: TabBarView(
                        children: [
                          OneDay('${coin.id}', 1),
                          FiveDay('${coin.id}', 5),
                          ThirtyDay('${coin.id}', 30)
                        ],
                      )
                    )
                  ]
                )
              )
            )
          ],
        )
      )
    ); 
  }
}