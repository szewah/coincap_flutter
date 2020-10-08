import 'dart:convert';
import 'package:http/http.dart';
import 'dart:math';


Future<List<Currency>> fetchCurrencies() async {

  try{
    
    Response response = await get('http://10.0.2.2:3000/coin');
    
    var jsonResponse = json.decode(response.body);

    List<Currency> coins = ((jsonResponse as List).map((i) => Currency.fromJson(i))).toList();

    // return jsonResponse.map((coin) =>  (new Currency.fromJson(coin))).toList();
    return coins;

    
  } catch(e) {
      print('This is the error $e');
      return null;
  }
}

class Currency {


  final int id, rank, maxSupply;
  final String name, slug, symbol;
  final double price, change, sevenDayChange, inCirculation;

  //passing parameters
  Currency({
    this.id,
    this.name, 
    this.slug, 
    this.price, 
    this.change, 
    this.sevenDayChange,
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
      slug: json['slug'],
      price: precision(json['quote']['USD']['price']),
      change: precision(json['quote']['USD']['percent_change_24h']),
      sevenDayChange: precision(json['quote']['USD']['percent_change_7d']),
      maxSupply: json['max_supply'],
      inCirculation: json['circulating_supply'] is int? (json['circulating_supply'] as int).toDouble() : (json['circulation_supply']),
      rank: json['cmc_rank'],
    );
  }
}

