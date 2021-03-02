import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var title = ''; // title is mutable property
  Drawer _buildDrawer(context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // khoang cach giua cac phan tu giong nhau
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    'cuvo.png',
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.cover, // image square
                  ),
                  Text(
                    'Market Tea',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Mobile Developer',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Photos'),
            onTap: () {
              setState(() {
                this.title = 'This is photos page';
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {
              setState(() {
                this.title = 'This is Notifications page';
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              setState(() {
                this.title = 'This is Settings page';
              });
              Navigator.pop(context);
            },
          ),
          Divider(
            color: Colors.black45,
            indent: 16.0,
          ),
          ListTile(
            leading: Icon(Icons.account_balance_outlined),
            title: Text('Account'),
          ),
          ListTile(
            leading: Icon(Icons.home_sharp),
            title: Text('Homes'),
          ),
          ListTile(
            leading: Icon(Icons.drive_file_rename_outline),
            title: Text('Privacy'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer in Flutter"),
      ),
      body: Center(
        child: Text(
          this.title,
          style: TextStyle(fontSize: 25.0),
        ),
      ),
      drawer: _buildDrawer(context),
    );
  }
}
