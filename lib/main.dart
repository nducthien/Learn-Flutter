import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CustomButton.dart';

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
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                'assets/logo_with_duo.png',
                fit: BoxFit.contain,
                width: 200,
              ),
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
                      border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
                      labelText: 'Enter your password'),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerRight,
                child: Text("Create account",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    )),
              ),
              Text(
                _email,
                style: TextStyle(fontSize: 15, color: Colors.deepOrange),
              ),
              CustomButton(
                onPressed: () {
                  print("Login");
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}
