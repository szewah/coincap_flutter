import 'package:coincap_flutter/services/currency.dart';
import 'package:coincap_flutter/screens/details/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
// import 'dart:async';

class CryptoHome extends StatefulWidget {
  @override
  _CryptoHomeState createState() => _CryptoHomeState();
}

class _CryptoHomeState extends State<CryptoHome> {


  //clear cache
  // deleteCacheContents() async {
  //   final cacheDir = await getTemporaryDirectory();
  //   print(cacheDir);
  //   if (await File(cacheDir.path + '/').exists()) {
  //     cacheDir.delete(recursive: true);
  //     print("Deleted $cacheDir file");
  //   }
  // }
  
  @override
  void initState() {
    super.initState();
    // fetchCurrencies();
    // timer = Timer.periodic(Duration(seconds: 15), (Timer t) => _deleteCacheContents());
    print('init state function ran');
  }
  
  // @override
  // void dispose() {
  //   super.dispose();
  //   _deleteCacheContents();
  //   print('this was disposed'); 
  // }

  @override
  Widget build(BuildContext context) {
    // deleteCacheContents(); 
    print('build function ran');
    return Scaffold(
      // backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        title: Text('COIN WATCH'),
        centerTitle: true,
        elevation: 0,
      ),
      body: 
      Center(
        child: FutureBuilder<List<Currency>>(
          //the future to use is fetchCurrencies() services/currency.dart
          future: fetchCurrencies(),
          // ignore: missing_return
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Currency> data = snapshot.data;
              return _coinListView(data);
            } 
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return spinkit;
          }
        ),
      )
    );
  }

  ListView _coinListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _card(
            data[index].id, 
            data[index].name, 
            data[index].symbol,
            data[index].image, 
            data[index].price, 
            data[index].change_24hrPercent,
            data[index].change_24hr,
            data,
            index
          );
        });
  }


  Card _card(String id, String name, String symbol, String image, double price, double change_24hrPercent, double change_24hr, data, index) => Card(
    elevation: 0,
    child: ListTile(
      leading: new Image.network('$image', height: 26, width: 26,),
      onTap: () {
        // _deleteCacheContents();
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => CryptoDetail(coin: data[index]))
          );
      },
      title: Text(name,
        style: TextStyle(
          fontSize: 20,
        )),
        subtitle: Text('\$$price'),
    )
  );

  static const spinkit = SpinKitRipple(color: Colors.redAccent, size: 50);
  

}

