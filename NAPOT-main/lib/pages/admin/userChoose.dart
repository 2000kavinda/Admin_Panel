import 'package:flutter/material.dart';
import 'package:untitled1/pages/admin/signInA.dart';
import 'package:untitled1/pages/canteenAdmin/signInC.dart';
import 'package:untitled1/pages/canteenStudent/MyOrders.dart';
import 'package:untitled1/pages/libraryAdmin/signInL.dart';

class TempLogin20 extends StatefulWidget {
  const TempLogin20({super.key});

  @override
  State<TempLogin20> createState() => _TempLogin2State();
}

class _TempLogin2State extends State<TempLogin20> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 370,
              child: Image.asset(
                'assets/images/loginImg.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
              onPressed: () {
                String textValue = searchController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInA(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: 50,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.87,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Administrator',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Image.asset('assets/icons/back.png'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            ElevatedButton(
              onPressed: () {
                // Show a search dialog
                String textValue = searchController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInL(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: 50,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.87,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Librarian',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Image.asset('assets/icons/back.png'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),


            ElevatedButton(
              onPressed: () {
                // Show a search dialog
                String textValue = searchController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInC(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: 50,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.87,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Canteen',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Image.asset('assets/icons/back.png'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            


            
          ],
        ),
      ),
    );
  }
}
