import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_ui/home_page.dart';

import 'custom_button.dart';

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
  final passEditingController = TextEditingController();
  bool _showPass = false;

  //validate
  var _emailValidate = "The email must be over 6 characters long and contain @";
  var _passValidate = "Password must be over 6 characters";
  var _emailInValid = false; // hợp lệ
  var _passInValid = false; // hợp lệ

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
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                      errorText: _emailInValid ? _emailValidate : null,
                      border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
                      labelText: 'Enter your email'),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 40),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    TextField(
                      controller: passEditingController,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      obscureText: !_showPass,
                      decoration: InputDecoration(
                          errorText: _passInValid ? _passValidate : null,
                          labelText: "Pass Word",
                          // border: OutlineInputBorder(
                          //     borderRadius:
                          //         const BorderRadius.all(Radius.circular(30))),
                          labelStyle:
                              TextStyle(color: Colors.blue, fontSize: 15)),
                    ),
                    GestureDetector(
                      onTap: onToggleShowPass,
                      child: Text(_showPass ? "HIDE" : "SHOW",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
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
                  validateLogin();
                  print("Login");
                },
              )
            ],
          ),
        )),
      ),
    );
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void validateLogin() {
    setState(() {
      if(emailEditingController.text.length < 6 || !emailEditingController.text.contains("@")) {
        _emailInValid = true; // no hop le
      } else {
        _emailInValid = false; // hop le
      }

      if(passEditingController.text.length < 6) {
        _passInValid = true; // no hop le
      } else {
        _passInValid = false; // hop le
      }

      // intent screen
      if(!_emailInValid && !_passInValid) {
        //Navigator.push(context, MaterialPageRoute(builder: goHomePage));
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }

  Widget goHomePage(BuildContext context) {
    return HomePage();
  }
}
