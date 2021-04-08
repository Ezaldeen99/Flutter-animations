import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/utils/constants.dart';
import 'package:furniture_app/utils/theme.dart';

import 'item_view.dart';

/// the MainSlideTile slider item
class MainSlideTile extends StatelessWidget {
  MainSlideTile({@required this.imagePath, this.index});

  ///[imagePath] slide imagePath path
  final String imagePath;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: imagePath.isEmpty
            ? placeHolder
            : ItemView(
                favOnPress: null,
                subtitle: Constants.title[index],
                image: imagePath,
                price: Constants.price[index],
                onView: null,
                onAdd: null,
                fav: null,
                title: Constants.subtitle[index],
              ));
  }

  final Widget placeHolder = Center(
      child: Container(
    child: Center(
        child: SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(strokeWidth: 1))),
    decoration: BoxDecoration(
        color: Styles.grayColor, borderRadius: BorderRadius.circular(24.0)),
  ));
}
