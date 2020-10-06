import 'package:coincap_flutter/services/currency.dart';
import 'package:flutter/material.dart';


class CryptoHome extends StatefulWidget {
  @override
  _CryptoHomeState createState() => _CryptoHomeState();
}

class _CryptoHomeState extends State<CryptoHome> {

  Map data = {};

  @override
  void initState() {
    super.initState();
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
      FutureBuilder<List<Currency>>(
        future: fetchCurrencies(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Currency> data = snapshot.data;
            return _jobsListView(data);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
        }
      )
    );
  }

  ListView _jobsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _card(data[index].id, data[index].name, data[index].slug, data[index].price);
        });
  }


  Card _card(int id, String title, String slug, double price) => Card(
    child: ListTile(
      leading: Image.asset('assets/$slug.png', height: 23, width: 23),
      onTap: () {
        print('$price');
        Navigator.pushNamed(context, '/detail');
      },
      title: Text(title,
        style: TextStyle(
          fontSize: 20,
        )),
        subtitle: Text('$price'),
    )
  );
}