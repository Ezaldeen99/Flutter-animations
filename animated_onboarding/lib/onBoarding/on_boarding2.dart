import 'package:animated_onboarding/generated/l10n.dart';
import 'package:animated_onboarding/onBoarding/page_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding2 extends StatefulWidget {
  OnBoarding2({Key key}) : super(key: key);

  @override
  _OnBoarding2State createState() => _OnBoarding2State();
}

class _OnBoarding2State extends State<OnBoarding2> {
  List<PageModel> mySLides = [];
  int slideIndex = 0;

  @override
  void initState() {
    super.initState();
    mySLides = getSlides();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Container(
              width: Get.width * 0.9,
              height: Get.height * 0.7,
              child: Center(
                child: CarouselSlider(
                    items: List.generate(
                        mySLides.length,
                        (index) => LottieBuilder.asset(
                              mySLides[index].getImageAssetPath(),
                              fit: BoxFit.contain,
                            )),
                    options: CarouselOptions(
                      height: Get.height,
                      viewportFraction: 1,
                      disableCenter: true,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      onPageChanged: (index, _) {
                        setState(() {
                          slideIndex = index;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                    )),
              )),
          SizedBox(
            height: Get.height * 0.01,
          ),
          AnimatedSmoothIndicator(
            count: mySLides.length,
            activeIndex: slideIndex,
            effect: ScrollingDotsEffect(
              activeDotColor: Colors.blue,
              dotHeight: 8,
              strokeWidth: 1,
              dotWidth: 8,
              dotColor: Colors.blue.withOpacity(0.5),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              mySLides[slideIndex].getTitle(),
              textAlign: TextAlign.center,
              style: Get.textTheme.headline1.copyWith(fontSize: 18),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              mySLides[slideIndex].getDesc(),
              style: Get.textTheme.headline6.copyWith(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          MaterialButton(
            color: Colors.blueAccent,
            child: Text(
              this.slideIndex == 2 ? S.current.next : S.current.skip,
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
            padding: EdgeInsets.symmetric(horizontal: 22),
          ),
        ],
      )),
    );
  }
}
