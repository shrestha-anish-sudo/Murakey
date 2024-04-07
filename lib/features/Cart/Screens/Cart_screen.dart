import 'package:flutter/material.dart';
import 'package:murarkey/Utils/constant/assets_path.dart';
import 'package:murarkey/features/Cart/provider/cart_provider.dart';
import 'package:murarkey/features/home/widgets/back_arrow.dart';
import 'package:murarkey/res/Colors.dart';
import 'package:provider/provider.dart';

class CartSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final Quan = Provider.of<Quantityprovider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    Backarrow(),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'My Cart',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: cart.items.map((productName) {
                    return ProductItem(productName: productName);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String productName;

  const ProductItem({Key? key, required this.productName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              cart, // Replace with actual image path
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColor.lightPurple,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Date&Time: 2080/02/5', // Replace with actual date and time
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Location: banasthali-01', // Replace with actual location
                    style: TextStyle(fontSize: 12),
                  ),
                  Row(
                    children: [
                      Text(
                        'Rs 8999',
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        'Rs 1,599',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColor.gray,
                        ),
                        child: IconButton(
                          onPressed: () {
                            
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.black,
                            size: 10,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '1',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColor.lightPurple,
                        ),
                        child: IconButton(
                          onPressed: () {
                            // Quan.increment();
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 10,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
