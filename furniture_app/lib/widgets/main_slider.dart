import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MainSlider extends StatefulWidget {
  MainSlider(
      {Key key,
      @required this.items,
      this.height = 177,
      @required this.callbackFunction})
      : super(key: key);

  ///[items] slide images paths
  final List<Widget> items;

  ///[height] slide images height
  final double height;

  ///[callbackFunction] slide page changed callback
  final Function(int index, CarouselPageChangedReason reason) callbackFunction;

  @override
  _MainSliderState createState() => _MainSliderState();
}

class _MainSliderState extends State<MainSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: widget.items,
        options: CarouselOptions(
          height: widget.height,
          viewportFraction: 0.6,
          disableCenter: true,
          initialPage: 0,
          enableInfiniteScroll: widget.items.length > 1,
          reverse: false,
          autoPlay: widget.items.length > 1,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          onPageChanged: widget.callbackFunction,
          scrollDirection: Axis.horizontal,
        ));
  }
}
