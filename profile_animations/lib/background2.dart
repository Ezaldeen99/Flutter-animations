import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'constants/constants.dart';

class Background2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: View(
        numberOfItems: 30,
      ),
    );
  }
}

class Item {
  static final random = Random(10);
  double _size;
  SvgPicture _image;

  Alignment _alignment;

  Item() {
    _image = SvgPicture.string(Constants.WEATHER_ICONS[
        (random.nextDouble() * 10 % Constants.WEATHER_ICONS.length).toInt()]);
    _alignment =
        Alignment(random.nextDouble() * 2 - 1, random.nextDouble() * 2 - 1);
    _size = random.nextDouble() * 10 + 10;
  }
}

class View extends StatefulWidget {
  final int numberOfItems;

  const View({Key key, this.numberOfItems}) : super(key: key);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> with SingleTickerProviderStateMixin {
  var items = <Item>[];
  var started = false;
  AnimationController animationController;
  static double verticalPadding = 15;
  Color mainColor2 = Color(0xff041637);

  final _box = SizedBox(
    height: verticalPadding,
  );

  var mainColor4 = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              Container(
                height: Get.height * 0.3,
                color: mainColor4,
                child: Stack(
                  children: [
                    Container(
                      height: Get.height * 0.35,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color(0xff3D639D),
                            Color(0xff343D63),
                          ]),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30))),
                    ),
                    ...buildItems(),
                    Container(
                      height: Get.height * 0.3,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 60, left: 30, right: 30),
                        child: Column(
                          children: <Widget>[
                            Row(children: <Widget>[
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: mainColor4,
                                ),
                                child: Icon(
                                  Icons.perm_identity,
                                  color: mainColor2,
                                  size: 30,
                                ),
                              ),
                              SizedBox(
                                width: 0.05 * Get.width,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Ezaldeen S. Abd.",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 0.01 * Get.height,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.add_location,
                                            size: 0.03 * Get.width,
                                            color: Colors.white60,
                                          ),
                                          SizedBox(
                                            width: 0.02 * Get.width,
                                          ),
                                          Text(
                                            "1st Street",
                                            style: TextStyle(
                                              color: Colors.white60,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 0.07 * Get.width,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.home,
                                            size: 0.03 * Get.width,
                                            color: Colors.white60,
                                          ),
                                          SizedBox(
                                            width: 0.02 * Get.width,
                                          ),
                                          Text(
                                            "Iraq",
                                            style: TextStyle(
                                              color: Colors.white60,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ]),
                            SizedBox(
                              height: 0.03 * Get.height,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      "5K",
                                      style: Get.textTheme.headline1.copyWith(
                                          fontSize: 18, color: mainColor4),
                                    ),
                                    Text(
                                      "Followers",
                                      style: Get.textTheme.bodyText1.copyWith(
                                          fontSize: 14, color: Colors.white60),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      "543",
                                      style: Get.textTheme.headline1.copyWith(
                                          fontSize: 18, color: mainColor4),
                                    ),
                                    Text(
                                      "Following",
                                      style: Get.textTheme.bodyText1.copyWith(
                                          fontSize: 14, color: Colors.white60),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white60),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("EDIT PROFILE",
                                        style: Get.textTheme.bodyText1.copyWith(
                                            fontSize: 14,
                                            color: Colors.white60)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: mainColor4,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("About me",
                            style: Get.textTheme.headline2
                                .copyWith(fontSize: 18, color: mainColor2)),
                        _box,
                        Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                            style: Get.textTheme.bodyText2),
                        _box,
                        _box,
                        _box,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Address",
                                  style: Get.textTheme.headline2.copyWith(
                                      fontSize: 18, color: mainColor2),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width - 268,
                                    child: Text(
                                      "House # 2, Street # 1, Somewhere, Anyplace, Nowhere",
                                      style: Get.textTheme.bodyText2,
                                    ))
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Working Hours",
                                  style: Get.textTheme.headline2.copyWith(
                                      fontSize: 18, color: mainColor2),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width - 268,
                                    child: Text(
                                      '''Monday - Friday
Open till 7 Pm''',
                                      style: Get.textTheme.bodyText2,
                                    ))
                              ],
                            )
                          ],
                        ),
                        _box,
                        _box,
                        Image.network(
                          "https://www.thestatesman.com/wp-content/uploads/2020/04/googl_ED.jpg",
                          width: Get.width,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> buildItems() {
    return items.map((item) {
      var tween = Tween<Offset>(
              begin: Offset(0, Random().nextDouble() * -1 - 1),
              end: Offset(Random().nextDouble() * 0.5, 2))
          .chain(CurveTween(curve: Curves.linear));
      return SlideTransition(
        position: animationController.drive(tween),
        child: AnimatedAlign(
          alignment: item._alignment,
          duration: Duration(seconds: 10),
          child: AnimatedContainer(
            duration: Duration(seconds: 10),
            width: item._size,
            height: item._size,
            child: item._image,
            decoration: BoxDecoration(shape: BoxShape.circle),
          ),
        ),
      );
    }).toList();
  }

  Widget _productSpecs() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(5, (index) {
          switch (index) {
            case 0:
              return Text("Specifications",
                  style: Get.textTheme.headline1.copyWith(fontSize: 18));
            case 1:
              return SizedBox(
                height: 5,
              );
            default:
              return Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    // Image.asset(Res.star),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                          "Lorem ipsum dolor sit amet, consectetur iusmod labore",
                          style: Get.textTheme.bodyText2),
                    )
                  ],
                ),
              );
              break;
          }
        }));
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 30));
    makeItems();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void makeItems() {
    setState(() {
      items.clear();
      for (int i = 0; i < widget.numberOfItems; i++) {
        items.add(Item());
      }
    });
    animationController.forward();
    animationController.repeat();
  }
}
