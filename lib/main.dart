import 'package:flutter/material.dart';
import 'home.dart';
import 'chat.dart';
import 'cloud.dart';
import 'group.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabController = new DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('My App'),
            bottom: TabBar(
                indicatorColor: Colors.white,
                indicatorWeight: 3.0,
                tabs: [
                  Tab(icon: Icon(Icons.home), text: "Home"),
                  Tab(icon: Icon(Icons.group), text: "Group"),
                  Tab(icon: Icon(Icons.chat_bubble), text: "Chat"),
                  Tab(icon: Icon(Icons.cloud), text: "Cloud"),
                ]),
          ),
          body: TabBarView(
            children: [
              Home(),
              Group(),
              Chat(),
              Cloud()
            ],
          ),
        ));
    return new MaterialApp(
      title: "Tabs example",
      home: tabController,
    );
  }
}
