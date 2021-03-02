import 'package:flutter/material.dart';
import 'package:flutter_demo_ui/list_view_demo.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Drawer in Flutter",
      home: ListViewDemo(),
    );
  }
}