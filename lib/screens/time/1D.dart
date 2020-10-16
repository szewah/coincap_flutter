import 'package:flutter/material.dart';
import 'package:coincap_flutter/services/lineChart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class OneDay extends StatefulWidget {
  @override
  _OneDayState createState() => _OneDayState();
}

class _OneDayState extends State<OneDay> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Center(
        child: FutureBuilder<List<CurrencyHistory>>(
          //the future to use is fetchCurrencies() services/currency.dart
          future: fetchCurrencyHistory('bitcoin', 1),
          // ignore: missing_return
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<CurrencyHistory> data = snapshot.data;
              return _oneDayListView(data);
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

    static const spinkit = SpinKitRipple(color: Colors.redAccent, size: 50);

    ListView _oneDayListView(data) {
      return ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return _card(
              data[index].price
            );
          });
    }

    Card _card(double price) => Card(
      child: ListTile(
        leading: const Icon(Icons.flight_land),
        title: Text(
          "Text", 
          style: TextStyle(
            fontSize: 140,
            fontWeight: FontWeight.w500,
            color: Colors.black12
          )),
        tileColor: Colors.green,
      )
    );
}


