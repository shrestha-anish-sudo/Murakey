import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:murarkey/features/home/Models/gallerymodel.dart';
import 'package:murarkey/res/app_url.dart';

class GalleryService extends StatelessWidget {
  const GalleryService({Key? key}) : super(key: key);

  Future<Gallerymodel> getGalleryApi() async {
    try {
      final response = await http.get(Uri.parse(AppUrl.imagegallery));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        return Gallerymodel.fromJson(data);
      } else {
        throw Exception('Failed to load gallery data');
      }
    } catch (e) {
      throw Exception('Failed to load gallery data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Gallerymodel>(
      future: getGalleryApi(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.data!.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .3,
                    width: MediaQuery.of(context).size.width * .1,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: snapshot.data!.data![index].image!.length,
                      itemBuilder: (context, position) {
                        return Container(
                          height: MediaQuery.of(context).size.height * .25,
                          width: MediaQuery.of(context).size.width * .5,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                AppUrl.baseUrl + "/public/gallery/" + snapshot.data!.data![index].image![position])
                                  // snapshot.data!.data![index].image![position]),
                            ),
                          ),
                        );
                        
                      },
                    ),
                  )
                ],
              );
            },
          );
        } else {
          return Center(child: Text('Loading'));
        }
      },
    );
  }
}
