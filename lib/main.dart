import 'package:flutter/material.dart';
import 'image_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Drawer in Flutter",
      home: ImagePage(),
    );
  }
}

