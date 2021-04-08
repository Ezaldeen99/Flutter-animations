// import 'package:flutter/material.dart';
//
// const Color background = Color(0xff2E2E2E);
// const Color card = Color(0xff515151);
import 'dart:ui';

import 'package:flutter/material.dart';

abstract class Styles {
  static const double horzPadding = 20;
  //colors
  static const Color whiteColor = Color(0xffffffff);
  static const Color blackColor = Color(0xff2E2E2E);
  static const Color orangeColor = Colors.orange;
  static const Color redColor = Colors.red;
  static const Color darkRedColor = Color(0xFFB71C1C);

  static const Color purpleColor = Color(0xff5E498A);

  static const Color darkThemeColor = Color(0xff33333E);

  static const Color grayColor = Color(0xff797979);

  static const Color greyColorLight = Color(0xffd7d7d7);

  static const Color settingsBackground = Color(0xffefeff4);

  static const Color settingsGroupSubtitle = Color(0xff777777);

  static const Color iconBlue = Color(0xff0000ff);
  static const Color transparent = Colors.transparent;
  static const Color iconGold = Color(0xffdba800);
  static const Color bottomBarSelectedColor = Color(0xff5e4989);

  //Strings
  static const TextStyle defaultTextStyle = TextStyle(
    color: Styles.purpleColor,
    fontSize: 20.0,
  );
  static const TextStyle defaultTextStyleBlack = TextStyle(
    color: Styles.blackColor,
    fontSize: 20.0,
  );
  static const TextStyle defaultTextStyleGRey = TextStyle(
    color: Styles.grayColor,
    fontSize: 20.0,
  );
  static const TextStyle smallTextStyleGRey = TextStyle(
    color: Styles.grayColor,
    fontSize: 16.0,
  );
  static const TextStyle smallTextStyle = TextStyle(
    color: Styles.purpleColor,
    fontSize: 16.0,
  );
  static const TextStyle smallTextStyleWhite = TextStyle(
    color: Styles.whiteColor,
    fontSize: 16.0,
  );
  static const TextStyle smallTextStyleBlack = TextStyle(
    color: Styles.blackColor,
    fontSize: 16.0,
  );
  static const TextStyle defaultButtonTextStyle =
      TextStyle(color: Styles.whiteColor, fontSize: 20);

  static const TextStyle profileTextStyleBlack = TextStyle(
    color: Styles.blackColor,
    fontSize: 20.0,
  );

  static const TextStyle defaultTextStyleWhite = TextStyle(
    color: Styles.whiteColor,
    fontSize: 20.0,
  );
  static const TextStyle messageRecipientTextStyle = TextStyle(
      color: Styles.blackColor, fontSize: 16.0, fontWeight: FontWeight.bold);

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      //* Custom Google Font
      //  fontFamily: Devfest.google_sans_family,
      primarySwatch: Colors.red,
      primaryColor: isDarkTheme ? Color(0xff2E2E2E) : Colors.white,

      backgroundColor: isDarkTheme ? Color(0xff2E2E2E) : Color(0xffF1F5FB),

      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),

      hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),

      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),

      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}
