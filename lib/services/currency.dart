import 'dart:convert';
import 'package:http/http.dart';


Future<List<Currency>> fetchCurrencies() async {

  try{
    
    Response response = await get('http://10.0.2.2:3000/coin');
    print('this is working');
    
    var jsonResponse = json.decode(response.body);
    print(jsonResponse);
    List<Currency> coins = ((json.decode(response.body) as List).map((i) => Currency.fromJson(i))).toList();
    // return jsonResponse.map((coin) =>  (new Currency.fromJson(coin))).toList();
    return coins;

    
  } catch(e) {
      print('This is the error $e');
      return null;
  }
}

class Currency {

  // final String id;
  final String name;
  // final String position;
  // final String company;
  // final String description;

  Currency({this.name});


  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      // id: json['id'],
      // position: json['position'],
      // company: json['company'],
      // description: json['description'],
      // id: json['id],
      name: json['name'],
      // price: json['quote']['USD']['price'],
      // change: json['quote']['USD']["percent_change_1h"],
      // seven-day-change: json['quote]['USD']['percent_change_7d],
      // max-supply: json['max_supply'],
      // in-circulation: json['circulating_supply],
      // rank: json['cmc_rank'],     
    );
  }
}

