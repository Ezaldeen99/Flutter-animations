import 'package:flutter/material.dart';
import 'package:furniture_app/utils/constants.dart';
import 'package:furniture_app/widgets/item_grid.dart';

class HomeSec extends StatefulWidget {
  HomeSec({Key key, this.index}) : super(key: key);
  final int index;

  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeSec> {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: homeView(),
      ),
      key: _scaffoldKey,
    );
  }

  Widget homeView() {
    return _mainSlider();
  }

  Widget _mainSlider() {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 24,
      childAspectRatio: 200 / 280,
      children: List.generate(
          20,
          (index) => ItemGrid(
                favOnPress: null,
                subtitle: Constants.title[index % Constants.title.length],
                image: mainSlides[index % mainSlides.length],
                price: Constants.price[index % Constants.title.length],
                onView: null,
                onAdd: null,
                fav: null,
                title: Constants.subtitle[index % Constants.title.length],
              )),
    );
  }
}
