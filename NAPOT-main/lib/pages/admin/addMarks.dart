import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled1/pages/admin/addMarksClass.dart';
import 'package:untitled1/pages/admin/shuttleAddClass.dart';
//import 'package:untitled1/pages/canteenAdmin/canteenAddClass.dart';

class AddMarks extends StatefulWidget {
  const AddMarks({super.key});

  @override
  State<AddMarks> createState() => _AddMarksState();
}

class _AddMarksState extends State<AddMarks> {

  final  idController = TextEditingController();
  final  ysController = TextEditingController();
  final  moduleController = TextEditingController();
  final  gradeController = TextEditingController();


  late DatabaseReference dbRef;

  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('marks');
  }


  void post() async{
    String id = idController.text;
    String ys= ysController.text;
    String module= moduleController.text;
    String grade= gradeController.text;

    String resp = await Storing().saving(
      id: id,
      ys: ys,
      module: module,
      grade:grade,

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text('Add Students Marks',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54),),
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
          child: Column(
              children: [
                
                SizedBox(
                  height: 30,
                ),


                //Start Student ID
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 5,
                      ),
                      child: Text(
                        'Student ID',
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
                            controller: idController,
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
                
                //End Student ID


                //Start Year & Semester

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 5,
                      ),
                      child: Text(
                        'Year & Semester',
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
                            controller: ysController,
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
                //End of Year & Semester

                //Start Module
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 5,
                      ),
                      child: Text(
                        'Module',
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
                            controller: moduleController,
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
                //End Module

                //Start Grade
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 5,
                      ),
                      child: Text(
                        'Grade',
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
                            controller: gradeController,
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
                //End Grade

                SizedBox(
                  height: 30,
                ),

                //Start Post button
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: MaterialButton(
                    onPressed: () {
                      post(); 
                    },
                    child: Text(
                      'Post',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Color.fromARGB(255, 6, 114, 187),
                    textColor: Colors.white,
                    minWidth: 150,
                    height: 50,
                  ),
                ),
                
                //End Post button

                SizedBox(
                  height: 20,
                ),
              ],
            ),
          
        )
    );
  }
}
