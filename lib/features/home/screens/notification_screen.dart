import 'package:flutter/material.dart';
import 'package:murarkey/Utils/constant/assets_path.dart';
import 'package:murarkey/features/home/widgets/back_arrow.dart';
import 'package:murarkey/res/Colors.dart';

class Notifyscreen extends StatelessWidget {
  const Notifyscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(14.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Backarrow(),
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  'Notification ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
              leading: Image.asset(facial),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Facial Treatments',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.lightPurple),
                  ),
                  Text('50% off on Facial Treatments'),
                ],
              )),
          SizedBox(
            height: 5,
          ),
          ListTile(
              leading: Image.asset(f1),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Haircuts',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.lightPurple),
                  ),
                  Text('Free hair spa with every haircut'),
                ],
              )),
          SizedBox(
            height: 5,
          ),
          ListTile(
              leading: Image.asset(f2),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bridal Packages',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.lightPurple),
                  ),
                  Text('Special Bridal Packages Available'),
                ],
              )),
          SizedBox(
            height: 5,
          ),
          ListTile(
              leading: Image.asset(p1),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mani-Pedi',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.lightPurple),
                  ),
                  Text('20% off on manicure and pedicure'),
                ],
              )),
          SizedBox(
            height: 5,
          ),
          ListTile(
              leading: Image.asset(ca1),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Complimentry Skin Consultation',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.lightPurple),
                  ),
                  Text('Free Counseling'),
                ],
              )),
          // Add more ListTile widgets as needed for additional offers
        ],
      ),
    );
  }
}
