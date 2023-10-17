import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/pages/admin/auth_methods.dart';
import 'package:untitled1/pages/canteenStudent/dialogbox.dart';

class PendingApproves extends StatefulWidget {
  const PendingApproves({Key? key}) : super(key: key);

  @override
  State<PendingApproves> createState() => _PendingApprovesState();
}

class _PendingApprovesState extends State<PendingApproves> {
  final CollectionReference collectionReference = FirebaseFirestore.instance
      .collection('pendingUsers');

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final degreeController = TextEditingController();
  final passwordController = TextEditingController();
  final indexController = TextEditingController();
  final batchController = TextEditingController();
  final nicController = TextEditingController();

  void registerUser() async {
    String resp = await AuthMethods().registerUser(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
      degree: degreeController.text,
      index: indexController.text,
      batch: batchController.text,
      nic: nicController.text,

    );
  }

    /*void _updateData(String docId) {

    collectionReference.doc(docId).update({
      "itemName": itemNameController.text,
      "description": descriptionController.text,
      "price": priceController.text,
      "category": categoryController.text,
    }).then((_) {
      Navigator.of(context).pop(); // Close the dialog
    }).catchError((error) {
      print("Error updating document: $error");
    });
  }*/


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
        title: Text(
          'Pending Approves',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
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
            SizedBox(height: 16,),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: collectionReference.snapshots(),
                builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text('No items available.'),
                    );
                  }

                  // Access the data and display it
                  final items = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: items.length * 2 - 1,
                    // Double the item count to account for SizedBox widgets
                    itemBuilder: (BuildContext context, int index) {
                      if (index.isOdd) {
                        // Odd indices correspond to SizedBox widgets
                        return SizedBox(
                            height: 16); // Adjust the height as needed
                      }

                      // Even indices correspond to data items
                      final dataIndex = index ~/ 2;
                      final doc = items[dataIndex].data() as Map<String,
                          dynamic>;
                      final docId = items[dataIndex].id;

                      return Column(
                        children: [
                          

                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                    nameController.text = doc['name'];
                                    emailController.text = doc['email'];
                                    degreeController.text = doc['degree'];

                                    showDialog(
                                      context: context,
                                      builder: (context) => FullScreenDialog(
                                        content: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.1,
                                                    child: IconButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      icon: Icon(
                                                          Icons.arrow_back_ios),
                                                      iconSize: 25,
                                                      color: Colors.black54,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    child: Text(
                                                      'Student Register Approve',
                                                      style: TextStyle(
                                                          fontSize: 19,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Column(
                                                children: [
                                                  //Start Name
                                                   Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                          left: 10,
                                                          bottom: 5,
                                                        ),
                                                        child: Text(
                                                          'Name with Initials',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.sizeOf(context)
                                                            .width,
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 10,
                                                                  right: 10),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            child: TextField(
                                                              readOnly: false,
                                                              controller:
                                                                  nameController,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                              decoration:
                                                                  const InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                filled: true,
                                                                fillColor: Colors
                                                                    .black12,
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
                                                  //End Name

                                                  //Start Email
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 10,
                                                          bottom: 5,
                                                        ),
                                                        child: Text(
                                                          'Email',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                            context)
                                                        .width,
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 10,
                                                                  right: 10),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            child: TextField(
                                                              readOnly: false,
                                                              controller:
                                                                  emailController,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .emailAddress,
                                                              decoration:
                                                                  const InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                filled: true,
                                                                fillColor: Colors
                                                                    .black12,
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
                                                  //End Email

                                                  //Start Password
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 10,
                                                          bottom: 5,
                                                        ),
                                                        child: Text(
                                                          'Password',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                            context)
                                                        .width,
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 10,
                                                                  right: 10),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            child: TextField(
                                                              readOnly: false,
                                                              controller:
                                                                  passwordController,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                              obscureText: true,
                                                              decoration:
                                                                  const InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                filled: true,
                                                                fillColor: Colors
                                                                    .black12,
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
                                                  //End Password

                                                  //Start Degree
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 10,
                                                          bottom: 5,
                                                        ),
                                                        child: Text(
                                                          'Degree Programme',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                            context)
                                                        .width,
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 10,
                                                                  right: 10),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            child: TextField(
                                                              readOnly: false,
                                                              controller:
                                                                  degreeController,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                              decoration:
                                                                  const InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                filled: true,
                                                                fillColor: Colors
                                                                    .black12,
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
                                                  //End Degree

                                                  //Start Batch
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 10,
                                                          bottom: 5,
                                                        ),
                                                        child: Text(
                                                          'Batch',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                            context)
                                                        .width,
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 10,
                                                                  right: 10),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            child: TextField(
                                                              readOnly: false,
                                                              controller:
                                                                  batchController,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              decoration:
                                                                  const InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                filled: true,
                                                                fillColor: Colors
                                                                    .black12,
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
                                                  //End Batch

                                                  //Start NIC
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 10,
                                                          bottom: 5,
                                                        ),
                                                        child: Text(
                                                          'NIC',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                            context)
                                                        .width,
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 10,
                                                                  right: 10),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            child: TextField(
                                                              readOnly: false,
                                                              controller:
                                                                  nicController,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                              decoration:
                                                                  const InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                filled: true,
                                                                fillColor: Colors
                                                                    .black12,
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
                                                  //End NIC

                                                  //Start Student ID
                                                   Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 10,
                                                          bottom: 5,
                                                        ),
                                                        child: Text(
                                                          'Student ID',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                            context)
                                                        .width,
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 10,
                                                                  right: 10),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            child: TextField(
                                                              readOnly: false,
                                                              controller:
                                                                  indexController,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              decoration:
                                                                  const InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                filled: true,
                                                                fillColor: Colors
                                                                    .black12,
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

                                                  //Start Buttons
                                                   Row(
                                                    children: [
                                                      //Start Delete
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.5,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25),
                                                              child:
                                                                  MaterialButton(
                                                                onPressed: () {
                                                                  // Delete operation
                                                                  collectionReference
                                                                      .doc(
                                                                          docId)
                                                                      .delete()
                                                                      .then(
                                                                          (_) {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop(); // Close the dialog
                                                                  }).catchError(
                                                                          (error) {
                                                                    print(
                                                                        "Error deleting document: $error");
                                                                  });
                                                                },
                                                                child: Text(
                                                                  'Reject',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        6,
                                                                        114,
                                                                        187),
                                                                textColor:
                                                                    Colors
                                                                        .white,
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
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.5,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25),
                                                              child:
                                                                  MaterialButton(
                                                                onPressed: () {
                                                                  registerUser();
                                                                  // Update operation
                                                                  //_updateData(docId);
                                                                  collectionReference
                                                                      .doc(
                                                                          docId)
                                                                      .delete()
                                                                      .then(
                                                                          (_) {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop(); // Close the dialog
                                                                  }).catchError(
                                                                          (error) {
                                                                    print(
                                                                        "Error deleting document: $error");
                                                                  });
                                                                },
                                                                child: Text(
                                                                  'Approve',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        6,
                                                                        114,
                                                                        187),
                                                                textColor:
                                                                    Colors
                                                                        .white,
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
                                                  //End Buttons
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                    child: Ink(
                                      width: MediaQuery.sizeOf(context).width*0.95,
                                      height: 130,
                                      color: Colors.black12,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context).width*0.25,
                                            height: 130,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Image.asset('assets/images/userImg.png'),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context).width*0.7,
                                            height: 130,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 20),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(context).width*0.7,
                                                    height: 100,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text('Student Name',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black54),),
                                                          ],
                                                        ),
                                                        Row(
                                                        children: [
                                                          Text(
                                                            doc['name'],
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black54),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Student Email',
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .black54),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            doc['email'],
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black54),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      
                                                      
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.7,
                                                  height: 30,
                                                   color: Color.fromARGB(
                                                      255, 6, 114, 187),
                                                  child: Row(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 10),
                                                            child: Text(
                                                              doc['degree'],
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ),
                                                  
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      );
    }
  }

