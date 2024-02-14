import 'package:flutter/material.dart';

class CountryCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Text(
        '+977', // Replace with the initial country code if needed
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }
}
