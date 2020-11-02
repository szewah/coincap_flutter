import 'dart:convert';
import 'package:http/http.dart';
import 'dart:math';


Future<List<Currency>> fetchCurrencies() async {

  try{
    
    // Response response = await get('http://10.0.2.2:3000/coin');
    Response response = await get('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false');
    
    var jsonResponse = json.decode(response.body);
    

    print('The response worked');
    List<Currency> coins = ((jsonResponse as List).map((i) => Currency.fromJson(i))).toList();
  
    return coins;
    // return null;

    
  } catch(e) {
      print('This is the error which is causing the break $e');
      return null;
  }
}

class Currency {
  
  final String name, image, id, symbol;
  final int rank;
  final double price, change_24hrPercent, high_24hr, low_24hr, change_24hr, inCirculation, maxSupply;
  // final double price;

  //passing parameters
  Currency({
    this.id,
    this.name, 
    this.image, 
    this.price, 
    this.change_24hrPercent, 
    this.high_24hr,
    this.low_24hr,
    this.change_24hr,
    this.maxSupply,
    this.inCirculation,
    this.rank,
    this.symbol,
  });

  

  factory Currency.fromJson(Map<String, dynamic> json) {

    precision(data) {
      int decimals = 2;
      int fac = pow(10, decimals);
      double d = data;
      d = (d * fac).round() / fac;
      return d;
    }


    return Currency(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      image: json['image'],
      price: precision(json['current_price']),
      change_24hrPercent: precision(json['price_change_percentage_24h']),
      high_24hr: precision(json['high_24h']),
      low_24hr: precision(json['low_24h']),
      change_24hr: precision(json['price_change_24h']),
      maxSupply: json['max_supply'],
      inCirculation: json['circulating_supply'] is int? (json['circulating_supply'] as int).toDouble() : (json['circulation_supply']),
      rank: json['market_cap_rank'],
    );
  }
}

