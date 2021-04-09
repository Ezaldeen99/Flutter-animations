import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/utils/theme.dart';
import 'package:furniture_app/widgets/cache_image_widget.dart';
import 'package:furniture_app/widgets/see_all_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'main_slide_tile.dart';
import 'main_slider.dart';

class HomeMain extends StatefulWidget {
  HomeMain({Key key, this.index}) : super(key: key);
  final int index;

  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  int slideIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  static var mainSlides = [
    "https://atlas-content-cdn.pixelsquid.com/stock-images/ikea-poang-chair-K69kEZ1-600.jpg",
    "https://www.kindpng.com/picc/m/161-1619861_sofa-chair-fresh-rea-chair-retro-sofa-chairs.png",
    "https://s3.amazonaws.com/furniture.retailcatalog.us/products/425848414/large/triptis-accent-chair-9065-0.jpg",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: homeView(),
      key: _scaffoldKey,
    );
  }

  Widget homeView() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 5,
      physics: ClampingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return SeeAllText(text: "Today's choices", callBack: () {});
          case 1:
            return SizedBox(
              height: 15,
            );
          case 2:
            return _mainSlider();
          case 3:
            return SizedBox(
              height: 30,
            );
          case 4:
            return Container(
              height: 200,
              width: 500,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    Theme.of(context).focusColor,
                    Theme.of(context).focusColor.withOpacity(0.4)
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
              child: CacheImageWidget(
                image:
                    "https://s3.amazonaws.com/furniture.retailcatalog.us/products/425487915/large/87213-66-17.jpg",
                favOnPress: null,
                fav: null,
              ),
            );
          default:
            return Container();
        }
      },
    );
  }

  Widget _mainSlider() {
    return Container(
      height: 300,
      margin: EdgeInsets.only(top: 15),
      child: MainSlider(
        items: List.generate(
            mainSlides.length,
            (index) => MainSlideTile(
                  imagePath: mainSlides[index],
                  index: index,
                )),
        callbackFunction: (int index, CarouselPageChangedReason reason) {
          setState(() {
            slideIndex = index;
          });
        },
      ),
    );
  }

  Widget _sliderPos() {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 15.0),
        child: AnimatedSmoothIndicator(
          count: mainSlides.length,
          activeIndex: slideIndex,
          effect: ExpandingDotsEffect(
            activeDotColor: Styles.purpleColor,
            dotHeight: 6,
            strokeWidth: 1,
            dotWidth: 9,
            dotColor: Styles.purpleColor.withOpacity(0.5),
            expansionFactor: 1.8,
          ),
        ));
  }
}
