import 'package:flutter/material.dart';
import 'package:murarkey/features/Cart/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cart',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Column(
          children: cart.items.map((productName) {
            return ProductItem(productName: productName);
          }).toList(),
        ),
      ],
    );
  }
}
class ProductItem extends StatelessWidget {
  final String productName;

  const ProductItem({Key? key, required this.productName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'your_product_image_path', // Replace with actual image path
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Date and Time', // Replace with actual date and time
                style: TextStyle(fontSize: 14),
              ),
              Text(
                'Location', // Replace with actual location
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
