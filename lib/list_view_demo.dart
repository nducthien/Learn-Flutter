import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'data.dart';


class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  List<Container> _listFlowers() {

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _listFlowers(),
    );
  }
}
