import 'package:flutter/material.dart';
import 'package:murarkey/Utils/constant/assets_path.dart';
import 'package:murarkey/features/Cart/provider/cart_provider.dart';
import 'package:murarkey/features/home/services/build_product.dart';
import 'package:murarkey/features/home/widgets/back_arrow.dart';
import 'package:murarkey/res/Colors.dart';
import 'package:provider/provider.dart';

class Productthree extends StatelessWidget {
  const Productthree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartitem = Provider.of<CartProvider>(context, listen: false);
    QuantityModel quantityModel = Provider.of<QuantityModel>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 3, 8, 0),
                    child: Container(
                      height: 340,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(color: AppColor.white),
                      ),
                      child: Image.asset(
                        p3,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    left: 35,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Backarrow(),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 0.5,
              ),
              Container(
                width: 380,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Mani-Pedi',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColor.lightPurple,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '4.4(32 reviews)',
                            style:
                                TextStyle(fontSize: 12, color: AppColor.gray),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Product Details",
                            style: TextStyle(
                              color: AppColor.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "If you are going to use a passage of Lorem\nIpsum, you need to be sure there isn't anything\nembarrassing hidden in the middle of text. All\nthe Lorem Ipsum generators on the Internet\ntend to repeat",
                            style:
                                TextStyle(fontSize: 12, color: AppColor.gray),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Select Quantity',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 25,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: AppColor.gray,
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          quantityModel.decrement();
                                        },
                                        icon: const Icon(
                                          Icons.remove,
                                          color: Colors.black,
                                          size: 10,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '${quantityModel.quantity}',
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
                                          quantityModel.increment();
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                          height: 20), // Add some space between the containers
                      Container(
                        width: double
                            .infinity, // Take full width of the parent container
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0), // Adjust padding as needed
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Price',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 1),
                                Text(
                                  'Rs. 5000',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                cartitem.addToCart('Wax');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColor
                                    .lightPurple, // Set the background color
                              ),
                              child: const Text('Add to Cart'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const InkWell(
                              child: Icon(
                                Icons.favorite_outline,
                                size: 10,
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            const Icon(
                              Icons.share,
                              size: 10,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Service Categories',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 276,
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildProductItem(
                        context, 'Service 1', f1, 'Popular', () {}),
                    buildProductItem(
                        context, 'Service 2', f2, 'Top Rated', () {}),
                    buildProductItem(
                      context,
                      'Service 3',
                      f3,
                      'Top Rated',
                      () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
