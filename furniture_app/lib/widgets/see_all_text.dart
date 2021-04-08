import 'package:flutter/material.dart';

class SeeAllText extends StatelessWidget {
  const SeeAllText(
      {Key key,
      this.text,
      this.titleOnly = false,
      this.callBack,
      this.padding = const EdgeInsets.symmetric(horizontal: 20)})
      : super(key: key);

  ///[text] title text
  final String text;

  ///[clicked] button clicked
  final Function callBack;

  ///[clicked] button clicked
  final EdgeInsets padding;

  ///[titleOnly] show title text only
  final bool titleOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 20),
          ),
          Visibility(
            visible: !titleOnly,
            child: InkWell(
              onTap: callBack,
              child: Row(
                children: [
                  Text(
                    "See All",
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    // color: colorful09,
                    size: 12,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
