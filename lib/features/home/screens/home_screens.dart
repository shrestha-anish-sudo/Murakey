import 'package:flutter/material.dart';
import 'package:murarkey/Utils/constant/assets_path.dart';
import 'package:murarkey/features/home/provider/home_provider.dart';
import 'package:murarkey/features/home/services/build_product.dart';
import 'package:murarkey/features/home/services/build_service.dart';
import 'package:murarkey/features/home/widgets/home_button.dart';
import 'package:murarkey/features/home/widgets/home_icons.dart';
import 'package:murarkey/features/home/widgets/search_bar.dart';
import 'package:murarkey/features/home/widgets/slider.dart';
import 'package:murarkey/res/colors.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  Homescreen({Key});

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabSelectionNotifier>(context);

    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColor.white,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Anonymous',
                        style: TextStyle(
                          color: AppColor.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Let's pamper yourself",
                        style: TextStyle(color: AppColor.gray),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                    width: 70,
                  ),
                  HomeIcon(iconData: Icons.person_outline),
                  SizedBox(
                    width: 10,
                  ),
                  HomeIcon(iconData: Icons.notifications_none),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultTabController(
                length: 2,
                child: Container(
                  child: Consumer<TabSelectionNotifier>(
                    builder: (context, tabProvider, _) {
                      return TabBar(
                        indicatorColor: AppColor.lightPurple,
                        indicatorWeight: 3.0,
                        indicatorPadding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                        onTap: (index) {
                          // Update the selected index when a tab is tapped
                          context
                              .read<TabSelectionNotifier>()
                              .setTabIndex(index);
                        },
                        tabs: [
                          Tab(
                            child: Text(
                              'Home',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: tabProvider.selectedIndex == 0
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Category',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: tabProvider.selectedIndex == 1
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SearchBox(),
            ),
            const SizedBox(
              height: 20,
            ),
            SLider(),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Featured Service',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(width: 120),
                  Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColor.lightPurple,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward_sharp,
                    color: AppColor.lightPurple,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  buildServiceItem(
                    'Hairstyling',
                    'Rs. 1000',
                    f1,
                  ),
                  const SizedBox(width: 16.0),
                  buildServiceItem(
                    'Bridal Makeup with\nhairstyle',
                    'Rs. 1000',
                    f2,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 1),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  buildServiceItem('Makeup', 'Rs. 1000', f3),
                  const SizedBox(width: 16.0),
                  buildServiceItem(
                      'Bridal Makeup with\nhairstyle', 'Rs. 1000', f4),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Our Product',
                  style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Container(
                height: 260,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildProductItem(context, 'Nail Extension', p1, 'Popular'),
                    buildProductItem(context, 'Mani-Pedi', p2, 'Top Rated'),
                    buildProductItem(context, 'Waxing', p3, 'Top Rated'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      const Text('Pamper Yourself\nwith Murarkey\nServices',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 15,
                      ),
                      Homebutton(title: 'Explore More', onPress: () {}),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
