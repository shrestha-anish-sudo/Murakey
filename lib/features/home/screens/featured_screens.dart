// import 'package:flutter/material.dart';
// import 'package:murarkey/features/home/Models/servicesmodel.dart';
// import 'package:murarkey/features/home/services/featured_services.dart';

// class Featuredscreen extends StatelessWidget {
//   const Featuredscreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<ServicesModel>(
//         future: FeaturedServices.fetchServicesData(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else if (!snapshot.hasData || snapshot.data!.data == null) {
//             return Text('No data available');
//           } else {
//             // Assuming you want to show four products, you can use the first four items
//             List<Data> products = snapshot.data!.data!.take(4).toList();

//             return Column(
//               children: [
//                 for (Data product in products) ...[
//                   Text('Name: ${product.name}'),
//                   Text('Description: ${product.description}'),
//                 ],
//               ],
//             );
//           }
//         });
//   }
// }
