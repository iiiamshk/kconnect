import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _index = 0;
  int _dataLength = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 4,
            ),
            child: CarouselSlider.builder(
              itemCount: 3,
              itemBuilder: (context, int index, int) {
                return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.fill,
                    ));
              },
              options: CarouselOptions(
                  viewportFraction: 1,
                  initialPage: 0,
                  autoPlay: true,
                  height: 150,
                  onPageChanged: (int i, carouselPageChangedreason) {
                    setState(() {
                      _index = i;
                    });
                  }),
            ),
          ),
          DotsIndicator(
            dotsCount: _dataLength,
            position: _index,
            decorator: DotsDecorator(
                size: const Size.square(5.0),
                activeSize: const Size(18.0, 5.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                activeColor: Theme.of(context).primaryColor),
          )
        ],
      ),
    );
  }
}
