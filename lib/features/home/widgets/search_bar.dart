import 'package:flutter/material.dart';
import 'package:murarkey/res/colors.dart';

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search_sharp),
          label: const Text('Search Anything...'),
          labelStyle: const TextStyle(
              color: AppColor.gray, fontWeight: FontWeight.normal),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
