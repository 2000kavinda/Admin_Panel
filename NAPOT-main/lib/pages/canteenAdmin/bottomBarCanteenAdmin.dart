import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:untitled1/pages/canteenAdmin/addItemCanteen.dart';
import 'package:untitled1/pages/canteenAdmin/allOrders.dart';
import 'package:untitled1/pages/canteenAdmin/canteenItems.dart';
import 'package:untitled1/pages/canteenStudent/allItems.dart';
import 'package:untitled1/pages/canteenStudent/tempLogin.dart';
import 'package:untitled1/pages/eventPage/event.dart';
import 'package:untitled1/pages/home_page.dart';
import 'package:untitled1/pages/lectureTimeTable/lecTimeTable.dart';
import 'package:untitled1/pages/st_menue.dart';

class BottomBarCanteenAdmin extends StatefulWidget {
  const BottomBarCanteenAdmin({super.key});

  @override
  State<BottomBarCanteenAdmin> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBarCanteenAdmin> {

  int _selectedIndex = 0;

  static  List<Widget> _widgetOptions = <Widget>[
    
    CanteenItems(),
    AllOrders(),
    addItem(),
    //StMenu(textValue: widget.textValue),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: GNav(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            color: Color.fromARGB(255, 77, 88, 97),
            activeColor: Colors.white,
            tabBackgroundColor: Color.fromARGB(255, 77, 88, 97),
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
                icon: Icons.add,
                text: 'Add Item',
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