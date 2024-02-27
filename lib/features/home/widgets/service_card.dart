import 'package:flutter/material.dart';
import 'package:murarkey/features/home/feature_model.dart';

class Servicecard extends StatelessWidget {
  final Feature product;

  Servicecard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Image.asset(
                product.image,
                width: double.infinity,
                height: 150.0,
                fit: BoxFit.cover,
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {
                  // Handle favorite button press
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Price: ${product.price}',
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
