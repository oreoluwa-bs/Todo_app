import 'package:flutter/material.dart';

class Sliverbar extends StatelessWidget {
  final _titleText;

  Sliverbar(this._titleText);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      expandedHeight: 146.0,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(left: 30, bottom: 16.0),
        title: Text(
          _titleText,
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'AirbnbBold',
          ),
        ),
        background: Image.network(
          "http://placeimg.com/640/480/nature/sepia",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
