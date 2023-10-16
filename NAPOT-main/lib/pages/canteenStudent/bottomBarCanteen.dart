import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:untitled1/pages/canteenStudent/MyOrders.dart';
import 'package:untitled1/pages/canteenStudent/allItems.dart';
import 'package:untitled1/pages/canteenStudent/tempLogin.dart';
import 'package:untitled1/pages/eventPage/event.dart';
import 'package:untitled1/pages/home_page.dart';
import 'package:untitled1/pages/lectureTimeTable/lecTimeTable.dart';
import 'package:untitled1/pages/st_menue.dart';
import 'package:untitled1/pages/studentProfile/tempLogin.dart';

class BottomBarCanteen extends StatefulWidget {
  final String textValue;

  BottomBarCanteen({required this.textValue});

  @override
  State<BottomBarCanteen> createState() => _BottomBarCanteenState();
}

class _BottomBarCanteenState extends State<BottomBarCanteen> {
  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      allItems(textValue: widget.textValue),
      MyOrders(textValue: widget.textValue),
      HomePage(textValue: widget.textValue),
      StMenu(textValue: widget.textValue),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        color: Colors.blueAccent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: GNav(
            backgroundColor: Colors.blueAccent,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.blue.shade800,
            gap: 8,
            padding: EdgeInsets.all(10),
            tabs: [
              GButton(
                icon: Icons.list,
                text: 'items',
              ),
              GButton(
                icon: Icons.timelapse,
                text: 'Orders',
              ),
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.apps_rounded,
                text: 'Menu',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index){
              setState(() {
                _selectedIndex = index;
              });
            },
            iconSize: 30,
          ),
        ),
      ),
    );
  }
}