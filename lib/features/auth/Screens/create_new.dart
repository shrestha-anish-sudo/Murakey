import 'package:flutter/material.dart';
import 'package:murarkey/features/home/widgets/back_arrow.dart';

class Createnew extends StatelessWidget {
  const Createnew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Backarrow(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
