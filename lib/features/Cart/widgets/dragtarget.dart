import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:murarkey/features/Cart/provider/cart_provider.dart';

class ProductDeleteButton extends StatelessWidget {
  final String productName;

  const ProductDeleteButton({Key? key, required this.productName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget(
      onAccept: (String productName) {
        // Remove the product from the cart when it is dropped
        Provider.of<CartProvider>(context, listen: false)
            .removeItem(productName);
      },
      builder: (BuildContext context, List<String?> candidateData,
          List<dynamic> rejectedData) {
        return IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            // You can also implement deletion by tapping on the delete icon
            Provider.of<CartProvider>(context, listen: false)
                .removeItem(productName);
          },
        );
      },
    );
  }
}
