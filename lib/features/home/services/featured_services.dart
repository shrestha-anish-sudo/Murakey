import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:murarkey/features/home/Models/servicesmodel.dart';
import 'package:murarkey/res/app_url.dart';

class FeaturedServices extends StatefulWidget {
  @override
  _FeaturedServicesState createState() => _FeaturedServicesState();
}

class _FeaturedServicesState extends State<FeaturedServices> {
  late Future<Featuredservices?> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = fetchData();
  }

  Future<Featuredservices?> fetchData() async {
    final response = await http.get(Uri.parse(AppUrl.getservices));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      return Featuredservices.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Featuredservices?>(
          future: _futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // While waiting for data
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              // Once data is loaded
              final data = snapshot.data!.data;
              return ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  final service = data[index];
                  return ListTile(
                    title: Text(service.name ?? 'No name'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(service.category?.name ?? 'No category'),
                        Text(service.location ?? 'No location'),
                        Text('Buy Rate: ${service.buyRate ?? 'Unknown'}'),
                      ],
                    ),
                    leading: service.image != null
                        ? Image.network(service.image!,
                            width: 50, height: 50, fit: BoxFit.cover)
                        : Icon(Icons.image),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
