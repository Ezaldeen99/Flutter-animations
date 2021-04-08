import 'package:intl/intl.dart';

class Constants {
  ///[LOGGED] user logged in
  static const int LOGGED = 0;

  ///[SKIPPED] user not logged in but skipped intro
  static const int SKIPPED = 1;

  ///[CODE_NEEDED] user signed up but didn't confirm code
  static const int CODE_NEEDED = 2;

  ///[NOT_APPROVED] user signed up but still not approved
  static const int NOT_APPROVED = 3;

  ///[STATUS] STATUS shared preferences tag
  static const String STATUS = "STATUS";

  static String pricesFormatter(price) {
    return NumberFormat.currency(symbol: '\$').format(price);
  }

  static String formatDateTimeFromUtc(dynamic time) {
    try {
      return new DateFormat("yyyy-MM-dd hh:mm:ss")
          .format(new DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(time));
    } catch (e) {
      return new DateFormat("yyyy-MM-dd hh:mm:ss").format(new DateTime.now());
    }
  }

  static List<String> subtitle = [
    "Slate 2pc Chaise Sectional",
    "Sofa",
    "Pebble Left hand"
  ];
  static List<String> title = [
    "Design by Ashley",
    "Ashley Furniture",
    "fashion-forward accent chair"
  ];
  static List<int> price = [319, 649, 1099];
}
