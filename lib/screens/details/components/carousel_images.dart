import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

class CarouselImages extends StatefulWidget {

  final List<String> imagesListUrl;

  CarouselImages(this.imagesListUrl);

  @override
  _CarouselImagesState createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: AnotherCarousel(
        dotSize: 5,
        dotBgColor: Colors.transparent,
        autoplay: false,
        borderRadius: true,
        images: [
          AssetImage(widget.imagesListUrl[0]),
          AssetImage(widget.imagesListUrl[1]),
          AssetImage(widget.imagesListUrl[2]),
          AssetImage(widget.imagesListUrl[3]),
        ],
      ),
    );
  }
  
  Carousel({required int dotSize, required Color dotBgColor, required bool autoplay, required List<AssetImage> images}) {}
}
