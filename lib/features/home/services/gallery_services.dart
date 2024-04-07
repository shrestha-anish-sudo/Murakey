// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:murarkey/features/home/Models/gallerymodel.dart';
// import 'package:murarkey/res/app_url.dart';

// class GalleryService extends StatefulWidget {
//   const GalleryService({Key? key}) : super(key: key);

//   @override
//   _GalleryServiceState createState() => _GalleryServiceState();
// }

// class _GalleryServiceState extends State<GalleryService> {
//   late Future<List<Data>> _galleryDataFuture;

//   @override
//   Future<Gallerymodel> getGalleryApi() async {
//     try {
//       final response = await http.get(Uri.parse(AppUrl.imagegallery));
//       var data = jsonDecode(response.body.toString());

//       if (response.statusCode == 200) {
//         return Gallerymodel.fromJson(data);
//       } else {
//         return Gallerymodel.fromJson(data);
//       }
//     } catch (e) {
//       throw Exception('Failed to load gallery data:');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Gallerymodel>(
//       future: getGalleryApi(),

//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return ListView.builder(
//             itemCount: snapshot.data!.data!.length,
//             itemBuilder:(context, index) {
//               return Column(
//                 children: [
//                   Container(
//                     height: MediaQuery.of(context).size.height,
//                     width: MediaQuery.of(context).size.width,
//                     child: ListView.builder(itemBuilder: (context, index){
                    

//                     }),
//                   )
//                 ],
//               )
//             },);
          
//         }
//       }
//     );
//   }
// }
