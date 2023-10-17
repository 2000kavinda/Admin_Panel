import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled1/pages/admin/shuttleAddClass.dart';
//import 'package:untitled1/pages/canteenAdmin/canteenAddClass.dart';

class AddBus extends StatefulWidget {
  const AddBus({super.key});

  @override
  State<AddBus> createState() => _AddBusState();
}

class _AddBusState extends State<AddBus> {

  final  busNoController = TextEditingController();
  final  destinationController = TextEditingController();
  final  driverController = TextEditingController();
  final  stop1Controller = TextEditingController();
  final  stop2Controller = TextEditingController();
  final  stop3Controller = TextEditingController();
  final  stop4Controller = TextEditingController();
  final  stop5Controller = TextEditingController();
  final  stop6Controller = TextEditingController();
  final  stop7Controller = TextEditingController();
  final  time1Controller = TextEditingController();
  final  time2Controller = TextEditingController();
  final  time3Controller = TextEditingController();
  final  time4Controller = TextEditingController();
  final  time5Controller = TextEditingController();
  final  time6Controller= TextEditingController();
  final  time7Controller =TextEditingController();
  final  vehicleNoController =TextEditingController();

  late DatabaseReference dbRef;

  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('buses');
  }


  void post() async{
    String busNo = busNoController.text;
    String destination= destinationController.text;
    String driver= driverController.text;
    String stop1= stop1Controller.text;
    String stop2= stop2Controller.text;
    String stop3= stop3Controller.text;
    String stop4= stop4Controller.text;
    String stop5= stop5Controller.text;
    String stop6= stop6Controller.text;
    String stop7= stop7Controller.text;
    String time1= time1Controller.text;
    String time2= time2Controller.text;
    String time3= time3Controller.text;
    String time4= time4Controller.text;
    String time5= time5Controller.text;
    String time6= time6Controller.text;
    String time7= time7Controller.text;
    String vehicleNo=vehicleNoController.text;
    String resp = await StoreData().saveData(
        busNo: busNo,
        destination: destination,
        driver: driver,
        stop1:stop1,
        stop2:stop1,
        stop3:stop1,
        stop4:stop1,
        stop5:stop1,
        stop6:stop1,
        stop7:stop1,
        time1: time1,
        time2: time1,
        time3: time1,
        time4: time1,
        time5: time1,
        time6: time1,
        time7: time1,
        vehicleNo: vehicleNo,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

       appBar: AppBar(
          title: Text(
            'Add New Shuttles',
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

        body: SingleChildScrollView(
          child:Column(
              children: [
                //Start Details section
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Bus Route',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                readOnly: false,
                                controller: destinationController,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //Start Shuttle number
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Shuttle number',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                readOnly: false,
                                controller: busNoController,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //End Shuttle number

                    //Start vehicle number
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Vehicle number',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                readOnly: false,
                                controller: vehicleNoController,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //End vehicle number

                    //Start Driver
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Driver',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                readOnly: false,
                                controller: driverController,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //End Driver
                    //Start Stop 1
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Stop 01',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                readOnly: false,
                                controller: stop1Controller,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //End Stop1

                    //Start Arrival time 01
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Arrival Time 01',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                readOnly: false,
                                controller: time1Controller,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //End Arrival time 01

                    //Start Stop2
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Stop 02',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                readOnly: false,
                                controller: stop2Controller,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //End Stop2

                    //Start Arrival time 02
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Arrival Time 02',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                readOnly: false,
                                controller: time2Controller,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //End Arrival time 02

                    //Start Stop 03
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Stop 03',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                readOnly: false,
                                controller: stop3Controller,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //End Stop 03

                    //Start Arrival time 03
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Arrival time 03',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                readOnly: false,
                                controller: time3Controller,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //End Arrival time 03

                    //Start Stop 04
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Stop 04',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                readOnly: false,
                                controller: stop4Controller,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //End Stop 04

                    //Start Arrival time 04
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Arrival time 04',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                readOnly: false,
                                controller: time4Controller,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //End Arrival time 04

                    //Start stop 5
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Stop 05',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                readOnly: false,
                                controller: stop5Controller,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //End stop5

                    //Start Arrival 5
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Arrival Time 05',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                readOnly: false,
                                controller: time5Controller,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //End Arrival 5

                    //Start Stop 6
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Stop 06',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                readOnly: false,
                                controller: stop6Controller,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //End Stop 6

                    //Start Arrival time 6
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Arrival time 06',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                readOnly: false,
                                controller: time6Controller,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //End Arrival time 6

                    //Start Stop 7
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Stop 07',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                readOnly: false,
                                controller: stop7Controller,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //End Stop 7

                    //Start Arrival time 7
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Arrival time 07',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                readOnly: false,
                                controller: time7Controller,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //End Arrival time 7

                    SizedBox(
                      height: 20,
                    ),

                    //Start buttons
                    Row(
                      children: [
                        //Start Delete
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  color: Color.fromARGB(255, 6, 114, 187),
                                  textColor: Colors.white,
                                  minWidth: 120,
                                  height: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //End Delete

                        //Start Update
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: MaterialButton(
                                  onPressed: () {
                                    post();
                                  },
                                  child: Text(
                                    'Post',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  color: Color.fromARGB(255, 6, 114, 187),
                                  textColor: Colors.white,
                                  minWidth: 120,
                                  height: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //End Update
                      ],
                    ),
                    //End buttons
                  ],
                ),
                //End Details Section
                SizedBox(
                  height: 20,
                ),







              ],
            ),
          
        )
    );
  }
}
