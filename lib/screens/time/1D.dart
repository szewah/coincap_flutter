import 'package:flutter/material.dart';
import 'package:coincap_flutter/services/lineChart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class OneDay extends StatefulWidget {
  
  final String id;
  final int day;

  const OneDay(this.id, this.day);

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
    print('this is working');
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        height: 500,
        width: 500,
        color: Colors.red,
        child: Center(
          child: FutureBuilder<List<CurrencyHistory>>(
            future: fetchCurrencyHistory(widget.id, widget.day),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                List<CurrencyHistory> data = snapshot.data;
                return _oneDayListView(data);
              }
              if(snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return spinkit;
            }
           )
          )
        )
      );
    }

    static const spinkit = SpinKitRipple(color: Colors.redAccent, size: 50);

    ListView _oneDayListView(data) {
      return ListView.builder(
          itemCount: 3,
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
          "$price", 
          style: TextStyle(
            fontSize: 14,
          )),
        tileColor: Colors.green,
      )
    );
}


