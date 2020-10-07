import 'package:coincap_flutter/services/currency.dart';
import 'package:coincap_flutter/screens/details/details.dart';
import 'package:flutter/material.dart';


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
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[400],
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
            } else if (snapshot.hasError) {
              return Text('This is the error message ${snapshot.error}');
            }
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
            data[index].slug, 
            data[index].price, 
            data,
            index
          );
        });
  }


  Card _card(int id, String name, String slug, double price, data, index) => Card(
    child: ListTile(
      leading: Image.asset('assets/$slug.png', height: 23, width: 23),
      onTap: () {
        print('Testing $index');
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => CryptoDetail(coin: data[index]))
          );
      },
      title: Text(name,
        style: TextStyle(
          fontSize: 20,
        )),
        subtitle: Text('$price'),
    )
  );
}

