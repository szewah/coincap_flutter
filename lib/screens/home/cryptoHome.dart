import 'package:coincap_flutter/services/currency.dart';
import 'package:coincap_flutter/screens/details/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class CryptoHome extends StatefulWidget {
  @override
  _CryptoHomeState createState() => _CryptoHomeState();
}

class _CryptoHomeState extends State<CryptoHome> {


  @override
  void initState() {
    super.initState();
    //hits the CMC api as soon as it loads
    fetchCurrencies();
    print('init state function ran');
  }

  @override
  Widget build(BuildContext context) {
    
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Choose a coin'),
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
              return _jobsListView(data);
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

  ListView _jobsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _card(
            data[index].id, 
            data[index].name, 
            data[index].symbol,
            data[index].slug, 
            data[index].price, 
            data,
            index
          );
        });
  }


  Card _card(int id, String name, String symbol, String slug, double price, data, index) => Card(
    child: ListTile(
      leading: Image.asset('assets/$slug.png', height: 23, width: 23),
      onTap: () {
        print('Testing $index and $name');
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

