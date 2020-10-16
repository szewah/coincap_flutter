import 'dart:convert';
import 'package:http/http.dart';

Future<List<CurrencyHistory>> fetchCurrencyHistory(coin, day) async {

  try{
  
    String apiHead = "https://api.coingecko.com/api/v3/coins/$coin";
    
    String apiTail = "/market_chart?vs_currency=usd&days=$day";


    Response response = await get(apiHead+apiTail);

    Map jsonResponse = json.decode(response.body);

    List coinResponse = jsonResponse['prices'];
    
    List<dynamic> coinPriceList = [];
    
    for (var i = 1; i <coinResponse.length;i++) {
      double price = coinResponse[i][1];
      coinPriceList.add(price);
    }

    List<CurrencyHistory> list = coinPriceList.map((i) => CurrencyHistory.fromJson(i)).toList();
    return list;

    
  } catch(e) {
      print('This is the error which is causing the break $e');
      return null;
  }
}


class CurrencyHistory {
  
  final double price;

  CurrencyHistory({
    this.price, 
  });

  factory CurrencyHistory.fromJson(dynamic json) {
    // print(json);
    return CurrencyHistory(
      price: json as double
    );
  }
}