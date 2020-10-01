// import 'package:coincap_flutter/services/currency.dart';
// import 'package:flutter/material.dart';


// class Details extends StatefulWidget {
//   @override
//   _DetailsState createState() => _DetailsState();
// }

// class _DetailsState extends State<Details> {

//   List<Currency> currencies = [
//     Currency(id: '1', name: 'Bitcoin'),
//     Currency(id: '2', name: 'Litecoin'),
//     Currency(id: '3', name: 'Namecoin')
//   ];

//   void updateDateCurrency(index) async {
//     Currency instance = currencies[index];
//     await instance.getCurrency();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[100],
//       appBar: AppBar(
//         backgroundColor: Colors.blueGrey[400],
//         title: Text('Choose a currency'),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: ListView.builder(
//         itemCount: currencies.length,        
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
//             child: Card(
//               child: ListTile(
//                 onTap: () {
//                   updateDateCurrency(index);
//                 },
//                 title: Text(currencies[index].name)
//               )
//             )
//           );
//         },
//       )
//     );
//   }
// }