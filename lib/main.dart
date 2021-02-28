import 'package:flutter/material.dart';
import 'package:flutter_collapsing_navigation_drawer_sidebar/commons/collapsing_navigation_drawer.dart';
import 'package:flutter_collapsing_navigation_drawer_sidebar/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Navigator Drawer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: drawerBackgroundColor,
        title: Text('Collapsing Navigation Drawer/Sidebar'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: selectedColor,
          ),
          CollapsingNavigationDrawer(),
        ],
      ),
    );
  }
}
