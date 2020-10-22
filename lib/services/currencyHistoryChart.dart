import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';

Future<List<CurrencyHistory>> fetchCurrencyHistory(coin, day) async {

    //api call
    String apiHead = "https://api.coingecko.com/api/v3/coins/$coin";    
    String apiTail = "/market_chart?vs_currency=usd&days=$day";

    //declare a file name that has a json extension and get the cache directory
    String fileName = 'CacheData.json';
    var cacheDir = await getTemporaryDirectory();

    //check whetehr the file exists. if so, load the contents
    if(await File(cacheDir.path + '/' + fileName).exists()) {
      print('loading cache');
      //call the file up and read the contents
      var jsonData = File(cacheDir.path + "/" + fileName).readAsStringSync();
      //decode the data
      Map jsonResponse = json.decode(jsonData);
      //extract list from prices map
      List coinResponse = jsonResponse['prices'];
      //create a map to hold the individual prices and index
      Map<String, dynamic> coinPriceMap = {};
      //create a List to hold the map
      List coinPriceList = [];

      for (var i = 1; i <coinResponse.length;i++) {
        double price = coinResponse[i][1];
        num index = i;
        // var time = new DateTime.now();
        coinPriceMap = {'index': index, 'price': price};
        coinPriceList.add(coinPriceMap);
      }

      List<CurrencyHistory> list = coinPriceList.map((i) => CurrencyHistory.fromJson(i)).toList();
      return list;

    }
    //if the json file doesn't exist, make the api call
    else {

        try{

          Response response = await get(apiHead+apiTail);
          print('the api was called again');

          //for the file
          var stringResponse = response.body;
          //for the class
          Map jsonResponse = json.decode(response.body);
          List coinResponse = jsonResponse['prices'];
          //create a map to hold the data 
          Map<String, dynamic> coinPriceMap = {};
          //and push it into the List
          List coinPriceList = [];
          
          for (var i = 1; i <coinResponse.length;i++) {
            double price = coinResponse[i][1];
            num index = i;
            // var time = new DateTime.now();
            coinPriceMap = {'index': index, 'price': price};
            coinPriceList.add(coinPriceMap);
          }

          //create a temp file to hold the cache
          var tempDir = await getTemporaryDirectory();
          File file = new File(tempDir.path + '/' + fileName);
          file.writeAsString(stringResponse, flush: true, mode: FileMode.write);


          List<CurrencyHistory> list = coinPriceList.map((i) => CurrencyHistory.fromJson(i)).toList();
          return list;
          
        } catch(e) {
            print('This is the error which is causing the break $e');
            return null;
        }
  }
}


class CurrencyHistory {
  
  final dynamic index;
  final double price;

  CurrencyHistory({
    this.index,
    this.price, 
  });

  // factory Currency.fromJson(Map<String, dynamic> json) 
  factory CurrencyHistory.fromJson(Map<String, dynamic> json) {
    // print(json);
    return CurrencyHistory(
      index: json['index'] as dynamic,
      price: json['price'] as double
    );
  }

}