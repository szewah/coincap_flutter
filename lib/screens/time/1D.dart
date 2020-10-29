import 'package:flutter/material.dart';
import 'package:coincap_flutter/services/currencyHistoryChart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:charts_flutter/flutter.dart' as charts;


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
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    print('this is working');
    return Scaffold(
      body: Container(
        height: 500,
        width: 500,
        color: Colors.white,
        child: Center(
          child: FutureBuilder<List<CurrencyHistory>>(
            future: fetchCurrencyHistory(widget.id, widget.day),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                List<CurrencyHistory> data = snapshot.data;
                // return Container();
                return _getContainer(data);
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

    static const spinkit = SpinKitRipple(color: Colors.orangeAccent, size: 50);

    Container _getContainer(data) {
      return Container(
        height: 500,
        padding:EdgeInsets.all(10),
        child: Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  'Price over the last 24 hours',
                  style: TextStyle(
                    fontWeight: FontWeight.normal
                  )
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: new charts.LineChart(_getSeriesData(data), animate: true,)
                )
              ]
            ))
        )
        );
    }



    _getSeriesData(data) {
      // return Container();
      print(data[0].index);

      List<charts.Series<CurrencyHistory, num>> series = [
        charts.Series(
          id: "24 Price",
          data: data,
          domainFn: (CurrencyHistory series, _) =>  series.index / 12,
          measureFn: (CurrencyHistory series, _) => series.price,
          colorFn: (CurrencyHistory series, _) => charts.MaterialPalette.blue.shadeDefault
          )
      ];
      return series;
    }
}


