import 'package:flutter/material.dart';
import 'package:coincap_flutter/services/lineChart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:charts_flutter/flutter.dart' as charts;



class ThirtyDay extends StatefulWidget {
  
  final String id;
  final int day;

  const ThirtyDay(this.id, this.day);

  @override
  _ThirtyDayState createState() => _ThirtyDayState();
}

class _ThirtyDayState extends State<ThirtyDay> {

  @override
  void initState() {
    super.initState();
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

    static const spinkit = SpinKitRipple(color: Colors.redAccent, size: 50);

    Container _getContainer(data) {
      return Container(
        height: 500,
        padding:EdgeInsets.all(10),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  'Price over 30 days',
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
      List<charts.Series<CurrencyHistory, int>> series = [
        charts.Series(
          id: "Thirty Day Price",
          data: data,
          domainFn: (CurrencyHistory series, _) =>  series.index,
          measureFn: (CurrencyHistory series, _) => series.price,
          colorFn: (CurrencyHistory series, _) => charts.MaterialPalette.blue.shadeDefault
          )
      ];
      return series;
    }
}


