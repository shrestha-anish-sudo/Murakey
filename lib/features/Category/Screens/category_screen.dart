import 'package:flutter/material.dart';
import 'package:murarkey/Utils/Routes/routes_name.dart';
import 'package:murarkey/Utils/constant/assets_path.dart';
import 'package:murarkey/features/home/services/build_category.dart';
import 'package:murarkey/features/home/widgets/back_arrow.dart';

class Categoryscreen extends StatelessWidget {
  const Categoryscreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.welcome);
                    },
                    child: const Backarrow(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                children: [
                  buildCategoryItem(ca1, 'Facial', () {}),
                  const SizedBox(
                    width: 10,
                  ),
                  buildCategoryItem(ca2, 'Non-bridal', () {}),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Row(
                children: [
                  buildCategoryItem(ca3, 'Bridal', () {}),
                  const SizedBox(
                    width: 5,
                  ),
                  buildCategoryItem(ca4, 'Bridal-Package', () {})
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
