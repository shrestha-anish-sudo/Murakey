import 'package:flutter/material.dart';
import 'package:murarkey/features/home/provider/home_provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';

class ImageGallery extends StatelessWidget {
  final List<String> images;

  ImageGallery({required this.images});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<ImageGalleryState>(
          builder: (context, galleryState, _) {
            return PhotoViewGallery.builder(
              scrollDirection: Axis.vertical,
              itemCount: images.length,
              builder: (context, index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: AssetImage(images[index]),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.covered * 2,
                );
              },
              onPageChanged: (index) {
                galleryState.setIndex(index);
              },
              scrollPhysics: BouncingScrollPhysics(),
              backgroundDecoration: BoxDecoration(
                color: Colors.black,
              ),
              pageController:
                  PageController(initialPage: galleryState.currentIndex),
            );
          },
        )
      ],
    );
    // Consumer<ImageGalleryState>(
    //     builder: (context, galleryState, _) {
    //       return PhotoViewGallery.builder(
    //         itemCount: images.length,
    //         builder: (context, index) {
    //           return PhotoViewGalleryPageOptions(
    //             imageProvider: AssetImage(images[index]),
    //             minScale: PhotoViewComputedScale.contained,
    //             maxScale: PhotoViewComputedScale.covered * 2,
    //           );
    //         },
    //         onPageChanged: (index) {
    //           galleryState.setIndex(index);
    //         },
    //         scrollPhysics: BouncingScrollPhysics(),
    //         backgroundDecoration: BoxDecoration(
    //           color: Colors.black,
    //         ),
    //         pageController:
    //             PageController(initialPage: galleryState.currentIndex),
    //       );
    //     },
    //   )
    // return Scaffold(
    //   body: Consumer<ImageGalleryState>(
    //     builder: (context, galleryState, _) {
    //       return PhotoViewGallery.builder(
    //         itemCount: images.length,
    //         builder: (context, index) {
    //           return PhotoViewGalleryPageOptions(
    //             imageProvider: AssetImage(images[index]),
    //             minScale: PhotoViewComputedScale.contained,
    //             maxScale: PhotoViewComputedScale.covered * 2,
    //           );
    //         },
    //         onPageChanged: (index) {
    //           galleryState.setIndex(index);
    //         },
    //         scrollPhysics: BouncingScrollPhysics(),
    //         backgroundDecoration: BoxDecoration(
    //           color: Colors.black,
    //         ),
    //         pageController:
    //             PageController(initialPage: galleryState.currentIndex),
    //       );
    //     },
    //   ),
    //   bottomNavigationBar: BottomAppBar(
    //     color: Colors.black,
    //     child: Padding(
    //       padding: const EdgeInsets.all(16.0),
    //       child: Consumer<ImageGalleryState>(
    //         builder: (context, galleryState, _) {
    //           return Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               IconButton(
    //                 icon: Icon(Icons.arrow_back),
    //                 color: Colors.white,
    //                 onPressed: () {
    //                   galleryState.moveToPrevious();
    //                 },
    //               ),
    //               Text(
    //                 '${galleryState.currentIndex + 1} / ${images.length}',
    //                 style: TextStyle(color: Colors.white),
    //               ),
    //               IconButton(
    //                 icon: Icon(Icons.arrow_forward),
    //                 color: Colors.white,
    //                 onPressed: () {
    //                   galleryState.moveToNext(images);
    //                 },
    //               ),
    //             ],
    //           );
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
}
