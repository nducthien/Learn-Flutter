import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MaterialApp(
    title: 'My App',
    home: Demo(),
  ));
}

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome to Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo'),
        ),
        body: Center(
          child: MyApp(),
        ),
      ),
    );
  }
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asUpperCase);
  }
}
