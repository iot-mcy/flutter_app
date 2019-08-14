import 'package:photo_view/photo_view_gallery.dart';
import 'package:flutter/material.dart';

/// 作者 mcy
/// 时间 2019/8/14 15:52
/// 画廊
class PhotoViewGalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("photo_view_gallery"),
      ),
      body: Container(
//        child: PhotoViewGallery.builder(
//          scrollPhysics: const BouncingScrollPhysics(),
//          builder: (BuildContext context, int index) {
//            return PhotoViewGalleryPageOptions(
//              imageProvider: AssetImage(widget.galleryItems[index].image),
//              initialScale: PhotoViewComputedScale.contained * 0.8,
//              heroTag: galleryItems[index].id,
//            );
//          },
//          itemCount: galleryItems.length,
//          loadingChild: widget.loadingChild,
//          backgroundDecoration: widget.backgroundDecoration,
//          pageController: widget.pageController,
//          onPageChanged: onPageChanged,
//        ),
      ),
    );
  }
}
