import 'dart:convert';
import 'package:http/http.dart';

Future<List<CurrencyHistory>> fetchCurrencyHistory(coin, day) async {

  try{
  
    String apiHead = "https://api.coingecko.com/api/v3/coins/$coin";
    
    String apiTail = "/market_chart?vs_currency=usd&days=$day";


    Response response = await get(apiHead+apiTail);

    print('the api was called again');

    Map jsonResponse = json.decode(response.body);

    List coinResponse = jsonResponse['prices'];
    
    Map<String, dynamic> coinPriceMap = {};
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
    
  } catch(e) {
      print('This is the error which is causing the break $e');
      return null;
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