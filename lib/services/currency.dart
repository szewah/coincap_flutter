import 'dart:convert';
import 'package:http/http.dart';
import 'dart:math';


Future<List<Currency>> fetchCurrencies() async {

  try{
    
    Response response = await get('http://10.0.2.2:3000/coin');
    
    var jsonResponse = json.decode(response.body);
    print(jsonResponse);
    List<Currency> coins = ((jsonResponse as List).map((i) => Currency.fromJson(i))).toList();

    // return jsonResponse.map((coin) =>  (new Currency.fromJson(coin))).toList();
    return coins;

    
  } catch(e) {
      print('This is the error $e');
      return null;
  }
}

class Currency {


  final int id;
  final String name;
  final String slug;
  final double price;


  Currency({this.id,this.name, this.slug, this.price});

  

  factory Currency.fromJson(Map<String, dynamic> json) {

    precision(data) {
    int decimals = 2;
    int fac = pow(10, decimals);
    double d = data;
    d = (d * fac).round()/fac;
    return d;
    }

    return Currency(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      price: precision(json['quote']['USD']['price']),
      // change: json['quote']['USD']["percent_change_1h"],
      // seven-day-change: json['quote]['USD']['percent_change_7d],
      // max-supply: json['max_supply'],
      // in-circulation: json['circulating_supply],
      // rank: json['cmc_rank'],     
    );
  }
}

