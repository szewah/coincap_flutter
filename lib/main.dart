import 'package:coincap_flutter/screens/home/cryptoHome.dart';
import 'package:coincap_flutter/screens/details/details.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => CryptoHome(),
        '/detail': (context) => CryptoDetail(),
      }
    );
  }
}

