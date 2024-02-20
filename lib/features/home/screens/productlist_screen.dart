import 'package:flutter/material.dart';
import 'package:murarkey/res/colors.dart';

class ProdddductList extends StatelessWidget {
  const ProdddductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.darkblue,
        title: Text('Product List'),
        centerTitle: true,
        actions: [
          Center(
            child: Badge(
                // badgecontent: Text(
                //   '0',
                //   style: TextStyle(color: AppColor.white),
                // ),
                // animationDuration: Duration(milliseconds: 300),
                // child: Icon(Icons.shopping_bag_outlined),
                ),
          ),
          Icon(Icons.shopping_bag),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [],
              ),
            );
          }))
        ],
      ),
    );
  }
}
