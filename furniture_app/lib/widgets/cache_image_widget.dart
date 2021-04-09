import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/utils/theme.dart';

class CacheImageWidget extends StatefulWidget {
  CacheImageWidget(
      {Key key,
      @required this.image,
      @required this.fav,
      @required this.favOnPress,
      this.shadow = true,
      this.imageBorder = 20,
      this.height = 130,
      this.width = 122.0})
      : super(key: key);

  ///[image] Item's image
  final String image;

  ///[height] Item's height
  final double height;

  ///[width] Item's width
  final double width;

  ///[imageBorder] Item's border radius
  final double imageBorder;

  ///[fav] Item's fav. status
  final bool fav;

  ///[shadow] Item's shadow status
  final bool shadow;

  ///[favOnPress] Item's fav press callback
  final Function favOnPress;

  @override
  _CacheImageWidgetState createState() => _CacheImageWidgetState();
}

class _CacheImageWidgetState extends State<CacheImageWidget> {
  @override
  Widget build(BuildContext context) {
    var shadow = [
      BoxShadow(
        color: widget.shadow
            ? Styles.grayColor.withOpacity(0.15)
            : Colors.transparent,
        blurRadius: 2.0,
        spreadRadius: 0.0,
        offset: Offset(2.0, 2.0),
      )
      // shadow direction: bottom right
    ];
    return widget.image == null || widget.image.isEmpty
        ? _container(SizedBox(), shadow)
        : CachedNetworkImage(
            imageUrl: widget.image,
            imageBuilder: (context, imageProvider) => Container(
                  height: widget.height,
                  width: widget.width,
                  decoration: BoxDecoration(
                    color: Styles.greyColorLight,
                    boxShadow: shadow,
                    borderRadius:
                        BorderRadius.all(Radius.circular(widget.imageBorder)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
            placeholder: (context, url) => _container(
                SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 1)),
                shadow),
            errorWidget: (context, url, error) => _container(
                Icon(
                  Icons.error,
                  color: Styles.greyColorLight,
                ),
                shadow));
  }

  Widget _container(child, shadow) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: Styles.greyColorLight,
        boxShadow: shadow,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
