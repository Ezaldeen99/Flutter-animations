import 'package:flutter/material.dart';
import 'package:flutter_hero/widgets/photo.dart';

import '../trips.dart';

class ItemPreview extends StatefulWidget {
  ItemPreview({Key key, this.trip}) : super(key: key);
  final Trips trip;

  @override
  _ItemPreviewState createState() => _ItemPreviewState();
}

class _ItemPreviewState extends State<ItemPreview> {
  final _box = SizedBox(
    height: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trip Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: PhotoHero(
                photo: widget.trip.image,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Text(widget.trip.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.green)),
            _box,
            Text(widget.trip.description,
                style: TextStyle(fontSize: 16, color: Colors.grey)),
            _box,
          ],
        ),
      ),
    );
  }
}
