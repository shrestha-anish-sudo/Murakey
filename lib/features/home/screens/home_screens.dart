import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:murarkey/Utils/Routes/routes_name.dart';
import 'package:murarkey/Utils/constant/assets_path.dart';
import 'package:murarkey/features/home/services/build_courses.dart';
import 'package:murarkey/features/home/services/build_product.dart';
import 'package:murarkey/features/home/services/build_service.dart';
import 'package:murarkey/features/home/services/gallery_services.dart';
import 'package:murarkey/features/home/services/slider_services.dart';
import 'package:murarkey/features/home/widgets/home_button.dart';
import 'package:murarkey/features/home/widgets/home_icons.dart';
// import 'package:murarkey/features/home/widgets/image_gallery.dart';
import 'package:murarkey/features/home/widgets/search_bar.dart';
import 'package:murarkey/res/colors.dart';

class Homescreen extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();
  Homescreen({Key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
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
                      const Text(
                        "Let's pamper yourself",
                        style: TextStyle(color: AppColor.gray),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                    width: 70,
                  ),
                  const HomeIcon(iconData: Icons.person_outline),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.notification);
                      },
                      child:
                          const HomeIcon(iconData: Icons.notifications_none)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: DefaultTabController(
            //     length: 2,
            //     child: Container(
            //       child: Consumer<TabSelectionNotifier>(
            //         builder: (context, hometabProvider, _) {
            //           return TabBar(
            //             indicatorColor: AppColor.lightPurple,
            //             indicatorWeight: 3.0,
            //             indicatorPadding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            //             onTap: (index) {
            //               // Update the selected index when a tab is tapped
            //               context
            //                   .read<TabSelectionNotifier>()
            //                   .setTabIndex(index);
            //             },
            //             tabs: [
            //               Tab(
            //                 child: Text(
            //                   'Home',
            //                   style: TextStyle(
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.bold,
            //                     color: hometabProvider.selectedIndex == 0
            //                         ? Colors.black
            //                         : Colors.grey,
            //                   ),
            //                 ),
            //               ),
            //               Tab(
            //                 child: InkWell(
            //                   onTap: () {
            //                     Navigator.pushNamed(
            //                         context, RoutesName.category);
            //                   },
            //                   child: Text(
            //                     'Category',
            //                     style: TextStyle(
            //                       fontSize: 18,
            //                       fontWeight: FontWeight.bold,
            //                       color: hometabProvider.selectedIndex == 1
            //                           ? Colors.black
            //                           : Colors.grey,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           );
            //         },
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SearchBox(),
            ),
            const SizedBox(
              height: 10,
            ),
            // CarouselSliderPage(),
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
                  buildServiceItem('Hairstyling', 'Rs. 1000', f1,
                      Icons.favorite_outline, () {}),
                  const SizedBox(width: 6.0),
                  buildServiceItem('Bridal Makeup with\nhairstyle', 'Rs. 1000',
                      f2, Icons.favorite_outline, () {}),
                ],
              ),
            ),
            const SizedBox(height: 1),
            // SizedBox(child: FeaturedServices()),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  buildServiceItem(
                      'Makeup', 'Rs. 1000', f3, Icons.favorite_outline, () {}),
                  const SizedBox(width: 6.0),
                  buildServiceItem('Bridal Makeup with\nhairstyle', 'Rs. 1000',
                      f4, Icons.favorite_outline, () {}),
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                children: [
                  buildProductItem(context, 'Nail Extension', p1, 'Popular',
                      () {
                    Navigator.pushNamed(context, RoutesName.naill);
                  }),
                  const SizedBox(width: 6.0),
                  buildProductItem(context, 'Mani-Pedi', p2, 'Top Rated', () {
                    Navigator.pushNamed(context, RoutesName.mani);
                  }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                children: [
                  buildProductItem(
                    context,
                    'Waxing',
                    p3,
                    'Top Rated',
                    () {
                      Navigator.pushNamed(context, RoutesName.wax);
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  height: 210,
                  width: 170,
                  child: Stack(children: [
                    Image.asset(
                      facial,
                      width: 170,
                      height: 210,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      width: 90,
                      height: 60,
                      child: Container(
                          height: 20,
                          width: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.white.withOpacity(0.9),
                                  Color.fromARGB(232, 236, 226, 226)
                                      .withOpacity(0.7),
                                ]),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '01',
                                  style: TextStyle(
                                      color: AppColor.black, fontSize: 10),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Facial',
                                  style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 98,
                      width: 40,
                      height: 30,
                      child: Container(
                          height: 40,
                          width: 40,
                          color: AppColor.lightPurple,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_forward_outlined,
                                color: AppColor.white,
                                size: 15,
                              )
                            ],
                          )),
                    ),
                  ]),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Our Courses',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.black,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 170),
                  const Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColor.lightPurple,
                    ),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.arrow_forward_sharp,
                      color: AppColor.lightPurple,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  buildCourseItem('Self Makeup', c1, () {
                    Navigator.pushNamed(context, RoutesName.courseone);
                  }),
                  const SizedBox(width: 6.0),
                  buildCourseItem('Self Makeup', c2, () {
                    Navigator.pushNamed(context, RoutesName.coursetwo);
                  }),
                ],
              ),
            ),
            const SizedBox(height: 1),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                children: [
                  buildCourseItem('Self Makeup', c2, () {
                    Navigator.pushNamed(context, RoutesName.coursetwo);
                  }),
                  const SizedBox(width: 10.0),
                  buildCourseItem('Self Makeup', c2, () {
                    Navigator.pushNamed(context, RoutesName.coursetwo);
                  }),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Text(
                    'Image Gallery',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.black,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 150),
                  const Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColor.lightPurple,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.arrow_forward_sharp,
                      color: AppColor.lightPurple,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.all(18),
                child: Container(
                    height: 200, width: 360, child: GalleryService())),
            const SizedBox(
              height: 20,
            ),
            // Stack(children: [
            //   Container(
            //       height: 260,
            //       decoration: BoxDecoration(
            //         border: Border.all(color: AppColor.black),
            //       ),
            //       child: Image.asset(
            //         ladybg,
            //         fit: BoxFit.cover,
            //       )),
            //   Positioned(
            //     top: 25,
            //     bottom: 17.0,
            //     left: 60.0,
            //     right: 60.0,
            //     child: Container(
            //       padding: const EdgeInsets.all(16.0),
            //       decoration: BoxDecoration(
            //         border: Border.all(color: AppColor.white),
            //       ),
            //       child: Column(
            //         children: [
            //           const SizedBox(
            //             height: 15,
            //           ),
            //           const Text(
            //             'Join Our Team',
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 22,
            //                 fontWeight: FontWeight.bold),
            //           ),
            //           const SizedBox(
            //             height: 8,
            //           ),
            //           const Text(
            //             'Beauty Professionals',
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 12,
            //                 fontWeight: FontWeight.normal),
            //           ),
            //           const SizedBox(
            //             height: 8,
            //           ),
            //           Homebutton(title: 'Join us', onPress: () {}),
            //           const SizedBox(
            //             height: 20,
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: [
            //               InkWell(
            //                 onTap: () {},
            //                 child: Container(
            //                   decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(10)),
            //                   height: 35,
            //                   width: 90,
            //                   child: Image.asset(
            //                     hb1,
            //                     fit: BoxFit.cover,
            //                   ),
            //                 ),
            //               ),
            //               const SizedBox(
            //                 width: 5,
            //               ),
            //               InkWell(
            //                 onTap: () {},
            //                 child: Container(
            //                   decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(10)),
            //                   height: 35,
            //                   width: 90,
            //                   child: Image.asset(
            //                     hb2,
            //                     fit: BoxFit.cover,
            //                   ),
            //                 ),
            //               )
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ]),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }
}
