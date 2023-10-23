import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled1/pages/postG2.dart';



class TabBarDemo1 extends StatefulWidget {
  TabBarDemo1({Key? key}) : super(key: key);

  @override
  _TabBarDemo1State createState() => _TabBarDemo1State();
}

class _TabBarDemo1State extends State<TabBarDemo1> {
  final List<String> imagePaths = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
    'assets/images/image5.jpg',
    'assets/images/image6.jpg',
  ];

  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;

  

  @override
  void dispose() {
    // Dispose of the page controller when not needed
    _pageController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Post Graduate',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios),
              iconSize: 25,
              color: Colors.black54,
            ),
            backgroundColor: Colors.white,
            elevation: 3,
            bottomOpacity: 0.0,
          ),
          body: Column(
            children: [
              // Your image bar with swapping images
              Container(
                height: 250, // Set the height of the image bar
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: imagePaths.length,
                  onPageChanged: (index) {
                    // Update the current page when the page changes manually
                    currentPage = index;
                  },
                  itemBuilder: (context, index) {
                    return Image.asset(
                      imagePaths[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              // The card with text and button
              Expanded(
                child: ListView(
                  children: [
                    Card(
                      color: Color.fromARGB(255, 227, 235, 239),
                      elevation: 4,
                      margin: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          SizedBox(height: 16),
                          Center(
                            child: Text(
                              'POST GRADUATE SUCCESS STORIES',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Click below to see',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              // Navigate to another page when container is clicked
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TabBarDemo2()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 77, 88, 97),
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 24,
                              ),
                            ),
                            child: Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildSocialIcon(Icons.facebook),
                              _buildSocialIcon(Icons.location_city),
                              _buildSocialIcon(Icons.email),
                              _buildSocialIcon(Icons.phone),
                            ],
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData iconData) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 77, 88, 97),
      ),
      child: IconButton(
        icon: Icon(
          iconData,
          color: Colors.white,
        ),
        onPressed: () {
          // Add your social media icon onPressed logic here
        },
      ),
    );
  }
}