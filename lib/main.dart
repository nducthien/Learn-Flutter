import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'My App',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _email = ''; // this is state
  final emailEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "This is a state ful widget",
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blueAccent,
          title: Text('My App'),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                Icons.list,
                color: Colors.white,
              ),
              onPressed: () {}),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/pokemon.png'),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  // how to get value from textField ? use TextEditingController
                  controller: emailEditingController,
                  onChanged: (text) {
                    // content change, it is run here
                    this.setState(() {
                      _email =
                          text; // when state changed => build() rerun => reload widget
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
                      labelText: 'Enter your email'),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your password'),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerRight,
                child: Text(
                  "Create account",
                ),
              ),
              Text(
                _email,
                style: TextStyle(fontSize: 15, color: Colors.deepOrange),
              ),
              RaisedButton(
                onPressed: () {},
                textColor: Colors.blue,
                padding: const EdgeInsets.all(0.0),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
