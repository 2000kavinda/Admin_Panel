import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';



class TabBarDemo2 extends StatelessWidget {
  const TabBarDemo2({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,





      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Post graduates',
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

          body:GridView.count(
              crossAxisCount: 2,



              children: [





                Card(
                  color: Color.fromARGB(255, 228, 235, 255),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment(-1.0, -1.0), // Align the image to the top-right corner
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.lightBlue, // Light blue border color
                                width: 2, // 2px border width
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/imgone.jpg',
                                fit: BoxFit.cover, // Ensure the image covers the circular area
                                width: 75, // Make the image occupy the entire circular area
                                height: 75,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 1,
                            left: 50,
                            child: Container(
                              width: 26,
                              height: 26,
                              child: Image.asset(
                                'assets/images/download.png', // Replace with your download icon asset
                                width: 26,
                                height: 26,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut ',
                            style: TextStyle(
                              fontSize: 14, // Font size of 14
                              color: Colors.black, // Black text color
                            ),
                            children: [
                              TextSpan(
                                text: 'Read More...',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 59, 89, 238), // Blue color for the "Read More" part
                                  decoration: TextDecoration.underline,
                                ),
                                // Add a function to handle the "Read More" action here
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Implement the "Read More" action here
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 20, // Button height of 20px
                        child: ElevatedButton(
                          onPressed: () {
                            // Add button click logic here
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(
                            255, 77, 88, 97), // Background color of the button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100), // Circular border radius of 100
                            ),
                          ),
                          child: Text(
                            'B P A R Jayamaha',
                            style: TextStyle(
                              color: Colors.white, // Text color of the button
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),



                Card(
                  color: Color.fromARGB(255, 228, 235, 255),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment(-1.0, -1.0), // Align the image to the top-right corner
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.lightBlue, // Light blue border color
                                width: 2, // 2px border width
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/img2.jpeg',
                                fit: BoxFit.cover, // Ensure the image covers the circular area
                                width: 75, // Make the image occupy the entire circular area
                                height: 75,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 1,
                            left: 50,
                            child: Container(
                              width: 26,
                              height: 26,
                              child: Image.asset(
                                'assets/images/download.png', // Replace with your LinkedIn icon asset
                                width: 26,
                                height: 26,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut ',
                            style: TextStyle(
                              fontSize: 14, // Font size of 14
                              color: Colors.black, // Black text color
                            ),
                            children: [
                              TextSpan(
                                text: 'Read More...',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 59, 89, 238), // Blue color for the "Read More" part
                                  decoration: TextDecoration.underline,
                                ),
                                // Add a function to handle the "Read More" action here
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Implement the "Read More" action here
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 20, // Button height of 20px
                        child: ElevatedButton(
                          onPressed: () {
                            // Add button click logic here
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(
                            255, 77, 88, 97), // Background color of the button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100), // Circular border radius of 100
                            ),
                          ),
                          child: Text(
                            'A V N J Perera',
                            style: TextStyle(
                              color: Colors.white, // Text color of the button
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
//card 2


                Card(
                  color: Color.fromARGB(255, 228, 235, 255),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment(-1.0, -1.0), // Align the image to the top-right corner
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.lightBlue, // Light blue border color
                                width: 2, // 2px border width
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/img3.png',
                                fit: BoxFit.cover, // Ensure the image covers the circular area
                                width: 75, // Make the image occupy the entire circular area
                                height: 75,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 1,
                            left: 50,
                            child: Container(
                              width: 26,
                              height: 26,
                              child: Image.asset(
                                'assets/images/download.png', // Replace with your LinkedIn icon asset
                                width: 26,
                                height: 26,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut ',
                            style: TextStyle(
                              fontSize: 14, // Font size of 14
                              color: Colors.black, // Black text color
                            ),
                            children: [
                              TextSpan(
                                text: 'Read More...',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 59, 89, 238), // Blue color for the "Read More" part
                                  decoration: TextDecoration.underline,
                                ),
                                // Add a function to handle the "Read More" action here
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Implement the "Read More" action here
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 20, // Button height of 20px
                        child: ElevatedButton(
                          onPressed: () {
                            // Add button click logic here
                          },
                          style: ElevatedButton.styleFrom(
                           primary: Color.fromARGB(
                            255, 77, 88, 97), // Background color of the button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100), // Circular border radius of 100
                            ),
                          ),
                          child: Text(
                            'K P Kolambage',
                            style: TextStyle(
                              color: Colors.white, // Text color of the button
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
//card3


                Card(
                  color: Color.fromARGB(255, 228, 235, 255),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment(-1.0, -1.0), // Align the image to the top-right corner
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.lightBlue, // Light blue border color
                                width: 2, // 2px border width
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/img4.jpeg',
                                fit: BoxFit.cover, // Ensure the image covers the circular area
                                width: 75, // Make the image occupy the entire circular area
                                height: 75,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 1,
                            left: 50,
                            child: Container(
                              width: 26,
                              height: 26,
                              child: Image.asset(
                                'assets/images/download.png', // Replace with your LinkedIn icon asset
                                width: 26,
                                height: 26,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut ',
                            style: TextStyle(
                              fontSize: 14, // Font size of 14
                              color: Colors.black, // Black text color
                            ),
                            children: [
                              TextSpan(
                                text: 'Read More...',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 59, 89, 238), // Blue color for the "Read More" part
                                  decoration: TextDecoration.underline,
                                ),
                                // Add a function to handle the "Read More" action here
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Implement the "Read More" action here
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 20, // Button height of 20px
                        child: ElevatedButton(
                          onPressed: () {
                            // Add button click logic here
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(
                            255, 77, 88, 97),  // Background color of the button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100), // Circular border radius of 100
                            ),
                          ),
                          child: Text(
                            'T T Abeyrathna ',
                            style: TextStyle(
                              color: Colors.white, // Text color of the button
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
//card4


                Card(
                  color: Color.fromARGB(255, 228, 235, 255),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment(-1.0, -1.0), // Align the image to the top-right corner
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.lightBlue, // Light blue border color
                                width: 2, // 2px border width
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/img5.jpeg',
                                fit: BoxFit.cover, // Ensure the image covers the circular area
                                width: 75, // Make the image occupy the entire circular area
                                height: 75,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 1,
                            left: 50,
                            child: Container(
                              width: 26,
                              height: 26,
                              child: Image.asset(
                                'assets/images/download.png', // Replace with your LinkedIn icon asset
                                width: 26,
                                height: 26,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut ',
                            style: TextStyle(
                              fontSize: 14, // Font size of 14
                              color: Colors.black, // Black text color
                            ),
                            children: [
                              TextSpan(
                                text: 'Read More...',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 59, 89, 238), // Blue color for the "Read More" part
                                  decoration: TextDecoration.underline,
                                ),
                                // Add a function to handle the "Read More" action here
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Implement the "Read More" action here
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 20, // Button height of 20px
                        child: ElevatedButton(
                          onPressed: () {
                            // Add button click logic here
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(
                            255, 77, 88, 97), // Background color of the button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100), // Circular border radius of 100
                            ),
                          ),
                          child: Text(
                            'K P G Senarathna',
                            style: TextStyle(
                              color: Colors.white, // Text color of the button
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
//card5

                Card(
                  color: Color.fromARGB(255, 228, 235, 255),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment(-1.0, -1.0), // Align the image to the top-right corner
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.lightBlue, // Light blue border color
                                width: 2, // 2px border width
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/img6.jpg',
                                fit: BoxFit.cover, // Ensure the image covers the circular area
                                width: 75, // Make the image occupy the entire circular area
                                height: 75,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 1,
                            left: 50,
                            child: Container(
                              width: 26,
                              height: 26,
                              child: Image.asset(
                                'assets/images/download.png', // Replace with your LinkedIn icon asset
                                width: 26,
                                height: 26,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut ',
                            style: TextStyle(
                              fontSize: 14, // Font size of 14
                              color: Colors.black, // Black text color
                            ),
                            children: [
                              TextSpan(
                                text: 'Read More...',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 59, 89, 238), // Blue color for the "Read More" part
                                  decoration: TextDecoration.underline,
                                ),
                                // Add a function to handle the "Read More" action here
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Implement the "Read More" action here
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 20, // Button height of 20px
                        child: ElevatedButton(
                          onPressed: () {
                            // Add button click logic here
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(
                            255, 77, 88, 97),  // Background color of the button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100), // Circular border radius of 100
                            ),
                          ),
                          child: Text(
                            'C S P Sinhapura',
                            style: TextStyle(
                              color: Colors.white, // Text color of the button
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
//card6

                Card(
                  color: Color.fromARGB(255, 228, 235, 255),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment(-1.0, -1.0), // Align the image to the top-right corner
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.lightBlue, // Light blue border color
                                width: 2, // 2px border width
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/img7.jpg',
                                fit: BoxFit.cover, // Ensure the image covers the circular area
                                width: 75, // Make the image occupy the entire circular area
                                height: 75,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 1,
                            left: 50,
                            child: Container(
                              width: 26,
                              height: 26,
                              child: Image.asset(
                                'assets/images/download.png', // Replace with your LinkedIn icon asset
                                width: 26,
                                height: 26,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut ',
                            style: TextStyle(
                              fontSize: 14, // Font size of 14
                              color: Colors.black, // Black text color
                            ),
                            children: [
                              TextSpan(
                                text: 'Read More...',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 59, 89, 238), // Blue color for the "Read More" part
                                  decoration: TextDecoration.underline,
                                ),
                                // Add a function to handle the "Read More" action here
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Implement the "Read More" action here
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 20, // Button height of 20px
                        child: ElevatedButton(
                          onPressed: () {
                            // Add button click logic here
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(
                            255, 77, 88, 97),  // Background color of the button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100), // Circular border radius of 100
                            ),
                          ),
                          child: Text(
                            'G D S Nanayakkara',
                            style: TextStyle(
                              color: Colors.white, // Text color of the button
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
//card7

                Card(
                  color: Color.fromARGB(255, 228, 235, 255),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment(-1.0, -1.0), // Align the image to the top-right corner
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color.fromARGB(
                                255, 77, 88, 97),  // Light blue border color
                                width: 2, // 2px border width
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/img8.jpeg',
                                fit: BoxFit.cover, // Ensure the image covers the circular area
                                width: 75, // Make the image occupy the entire circular area
                                height: 75,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 1,
                            left: 50,
                            child: Container(
                              width: 26,
                              height: 26,
                              child: Image.asset(
                                'assets/images/download.png', // Replace with your LinkedIn icon asset
                                width: 26,
                                height: 26,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut ',
                            style: TextStyle(
                              fontSize: 14, // Font size of 14
                              color: Colors.black, // Black text color
                            ),
                            children: [
                              TextSpan(
                                text: 'Read More...',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 59, 89, 238), // Blue color for the "Read More" part
                                  decoration: TextDecoration.underline,
                                ),
                                // Add a function to handle the "Read More" action here
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Implement the "Read More" action here
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 20, // Button height of 20px
                        child: ElevatedButton(
                          onPressed: () {
                            // Add button click logic here
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 77, 88, 97), // Background color of the button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100), // Circular border radius of 100
                            ),
                          ),
                          child: Text(
                            'O P Jayakody',
                            style: TextStyle(
                              color: Colors.white, // Text color of the button
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //card 8


              ]
          ),

          

          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ) ,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat ,
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}