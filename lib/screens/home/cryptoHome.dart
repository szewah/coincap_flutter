import 'package:coincap_flutter/services/currency.dart';
import 'package:flutter/material.dart';


class CryptoHome extends StatefulWidget {
  @override
  _CryptoHomeState createState() => _CryptoHomeState();
}

class _CryptoHomeState extends State<CryptoHome> {

  // Future<List<Currency>> futureCurrency;
  

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
          // if (snapshot.data == null) return CircularProgressIndicator();
          if (snapshot.hasData) {
            List<Currency> data = snapshot.data;
            return _jobsListView(data);
            // return Text('Hello');
          }
        }
      )
      // Center(
      //   child: Text('Hello this is a placeholder'),
      // )
    );
  }

  ListView _jobsListView(data) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return _tile(data[index].name);
          // return _tile(data[index].name, data[index].price);
        });
  }

  ListTile _tile(String title) => ListTile(
  // ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
    onTap: (){print('I was tapped');},
    title: Text(title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    // subtitle: Text(subtitle),
  );
}