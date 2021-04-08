import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:furniture_app/res.dart';
import 'package:furniture_app/utils/DarkThemeProvider.dart';
import 'package:furniture_app/utils/animators/shake_transition.dart';
import 'package:furniture_app/utils/theme.dart';
import 'package:furniture_app/widgets/home_boxes.dart';
import 'package:furniture_app/widgets/home_main.dart';
import 'package:furniture_app/widgets/home_sec.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  var icons = [Res.FireColor, Res.Stability, Res.Stopwatch, Res.Weight];

  Animation<double> animation;
  bool cirAn = false;
  bool _switch = false;

  int selectedCard = 0;

  //home page index
  int _currentPage = 0;
  PageController _pageController;
  List<Widget> _children;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    animationController.forward();

    _children = [
      HomeMain(
        index: _currentPage,
      ),
      HomeSec(
        index: _currentPage,
      ),
      HomeMain(
        index: _currentPage,
      ),
      HomeMain(
        index: _currentPage,
      ),
    ];
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);

    var size = MediaQuery.of(context).size;
    return cirAn
        ? CircularRevealAnimation(
            centerOffset: Offset(size.width - (Styles.horzPadding + 25),
                80 + MediaQuery.of(context).padding.top),
            animation: animation,
            child: homeBody(
              themeProvider,
            ),
          )
        : homeBody(themeProvider);
  }

  Widget homeBody(DarkThemeProvider themeProvider) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Styles.horzPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShakeTransition(
                        child: Text(
                      "Hi Ezaldeen",
                      style: TextStyle(fontSize: 24),
                    )),
                    _blackWhite(themeProvider),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              _categories(),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: PageView(
                    controller: _pageController,
                    physics: new NeverScrollableScrollPhysics(),
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    children: _children,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Theme.of(context).backgroundColor,
        ),
      ),
    );
  }

  _categories() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Styles.horzPadding),
      child: SizedBox(
        height: 130,
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              4,
              (index) => HomeBoxes(
                    image: icons[index],
                    text: 'first',
                    darkMode: !_switch,
                    selectedCard: index == selectedCard,
                    onPressed: () {
                      setState(() {
                        selectedCard = index;
                        _pageController.animateToPage(selectedCard,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOut);
                      });
                    },
                  )),
        ),
      ),
    );
  }

  _blackWhite(DarkThemeProvider themeProvider) {
    return InkWell(
      child: RotatedBox(
        quarterTurns: 2,
        child: SizedBox(
          child: !_switch ? Image.asset(Res.on_) : Image.asset(Res.off_),
          width: 45,
          height: 45,
        ),
      ),
      onTap: () {
        setState(() {
          cirAn = true;
          _switch = !_switch;
        });
        themeProvider.darkTheme = !themeProvider.darkTheme;

        if (animationController.status == AnimationStatus.forward ||
            animationController.status == AnimationStatus.completed) {
          animationController.reset();
          animationController.forward();
        } else {
          animationController.forward();
        }
      },
    );
  }
}
