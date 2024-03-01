import 'package:flutter/material.dart';
import 'package:murarkey/Utils/Routes/routes_name.dart';
import 'package:murarkey/Utils/constant/assets_path.dart';
import 'package:murarkey/features/home/provider/home_provider.dart';
import 'package:murarkey/features/home/services/build_category.dart';
import 'package:murarkey/features/home/widgets/back_arrow.dart';
import 'package:murarkey/res/colors.dart';
import 'package:provider/provider.dart';

class Categoryscreen extends StatelessWidget {
  const Categoryscreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final categoryTabProvider = Provider.of<TabSelectionNotifier>(context);

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultTabController(
                length: 2,
                child: Container(
                  child: Consumer<TabSelectionNotifier>(
                    builder: (context, categorytabProvider, _) {
                      return Column(
                        verticalDirection: VerticalDirection.down,
                        children: [
                          TabBar(
                            indicatorColor: AppColor.lightPurple,
                            indicatorWeight: 3.0,
                            indicatorPadding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                            onTap: (index) {
                              categoryTabProvider.setTabIndex(index);
                            },
                            tabs: [
                              Tab(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RoutesName.home);
                                  },
                                  child: Text(
                                    'Home',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          categoryTabProvider.selectedIndex == 0
                                              ? Colors.black
                                              : Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: InkWell(
                                  onTap: () {
                                    // Navigator.pushNamed(
                                    //     context, RoutesName.category);
                                  },
                                  child: Text(
                                    'Category',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          categoryTabProvider.selectedIndex == 1
                                              ? Colors.black
                                              : Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
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
