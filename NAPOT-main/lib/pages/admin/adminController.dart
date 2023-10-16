import 'package:flutter/material.dart';
import 'package:untitled1/pages/admin/addMarks.dart';
import 'package:untitled1/pages/admin/addShuttle.dart';
import 'package:untitled1/pages/admin/pendingApproves.dart';
import 'package:untitled1/pages/admin/shuttles.dart';
import 'package:untitled1/pages/admin/signInA.dart';
import 'package:untitled1/pages/canteenAdmin/signInC.dart';
import 'package:untitled1/pages/canteenStudent/MyOrders.dart';
import 'package:untitled1/pages/libraryAdmin/signInL.dart';

class AdminController extends StatefulWidget {
  const AdminController({super.key});

  @override
  State<AdminController> createState() => _TempLogin2State();
}

class _TempLogin2State extends State<AdminController> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            
            SizedBox(
              height: 40,
            ),

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Select one option',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black54),)
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            //Admin Button start
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.03,
                    ),

                    //Start Add Marks
                    InkWell(
                      onTap: () {
                        String textValue = searchController.text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddMarks(),
                          ),
                        );
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 8, 133, 161),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        width: MediaQuery.sizeOf(context).width * 0.45,
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Add Marks',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //End Add Marks

                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.03,
                    ),

                    //Start Edit Shuttles
                    InkWell(
                      onTap: () {
                        // Show a search dialog
                        String textValue = searchController.text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShuttlesAdmin(),
                          ),
                        );
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 4, 61, 74),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        width: MediaQuery.sizeOf(context).width * 0.45,
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Edite',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Shuttles',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //End of Edit Shuttles

                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.03,
                    ),
                  ],
                ),

                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.03,
                    ),

                    //Start Add Marks
                    InkWell(
                      onTap: () {
                        // Show a search dialog
                        String textValue = searchController.text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddBus(),
                          ),
                        );
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 8, 133, 161),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        width: MediaQuery.sizeOf(context).width * 0.45,
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Add Shuttles',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //End Add Marks

                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.03,
                    ),

                    //Start Edit Shuttles
                    InkWell(
                      onTap: () {
                        // Show a search dialog
                        String textValue = searchController.text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PendingApproves(),
                          ),
                        );
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 4, 61, 74),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        width: MediaQuery.sizeOf(context).width * 0.45,
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Pending',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Approvals',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //End of Edit Shuttles

                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.03,
                    ),
                  ],
                ),
              ],
            ),
            //End of Admin buttons
          ],
        ),
      ),
    );
  }
}
