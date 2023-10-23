import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/pages/canteenStudent/dialogbox.dart';
import 'package:untitled1/pages/studentProfile/allBadges.dart';
import 'package:untitled1/pages/studentProfile/allCertificates.dart';

class personalData extends StatefulWidget {
  //const personalData({Key? key}) : super(key: key);
  final String textValue;
  personalData({required this.textValue});

  @override
  State<personalData> createState() => _personalDataState();
}

class _personalDataState extends State<personalData> {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');

  final batchController = TextEditingController();
  final degreeController = TextEditingController();
  final emailController = TextEditingController();
  final indexController = TextEditingController();
  final nameController = TextEditingController();
  final nicController = TextEditingController();

  void _updateData(String docId) {
    collectionReference.doc(docId).update({
      "batch": batchController.text,
      "degree": degreeController.text,
      "email": emailController.text,
      "index": indexController.text,
      "name": nameController.text,
      "nic": nicController.text,
    }).then((_) {
      Navigator.of(context).pop(); // Close the dialog
    }).catchError((error) {
      print("Error updating document: $error");
    });
  }

  Stream<QuerySnapshot> _getFilteredItemsStream() {
    return collectionReference
        .where('email', isEqualTo: widget.textValue)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Student Profile',
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
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _getFilteredItemsStream(),
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
                  itemCount: items.length * 2 -
                      1, // Double the item count to account for SizedBox widgets
                  itemBuilder: (BuildContext context, int index) {
                    if (index.isOdd) {
                      // Odd indices correspond to SizedBox widgets
                      return SizedBox(
                          height: 16); // Adjust the height as needed
                    }

                    // Even indices correspond to data items
                    final dataIndex = index ~/ 2;
                    final doc = items[dataIndex].data() as Map<String, dynamic>;
                    final docId = items[dataIndex].id;

                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                //Start
                                Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          height: 200,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/banner2.png'),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 100),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      80.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.3,
                                                    height: 150,
                                                    child: CircleAvatar(
                                                      radius: 45,
                                                      backgroundImage:
                                                          NetworkImage(
                                                              doc['imageLink']),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            flex: 6,
                                          ),
                                          Expanded(
                                            child: Text(''),
                                            flex: 9,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            doc['name'],
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black54),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Student at NSBM Green University',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black54),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'NSBM Green University',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black54),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Colombo district, Western provice, Sri Lanka',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black54),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                //End

                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    //Start of GPA section
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      height: 90,
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 126, 127, 130),
                                              borderRadius: BorderRadius.circular(
                                                  8), // Adjust the radius as needed
                                            ),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            height: 75,
                                            child: Row(
                                              children: [
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.17,
                                                  height: 65,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                              'assets/images/GPA.png'),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.23,
                                                  height: 65,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '3.5',
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'GPA',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    //End of GPA Mark section

                                    //Start of Credit section
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      height: 90,
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 126, 127, 130),
                                              borderRadius: BorderRadius.circular(
                                                  8), // Adjust the radius as needed
                                            ),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            height: 75,
                                            child: Row(
                                              children: [
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.17,
                                                  height: 65,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                              'assets/images/credit.png'),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.23,
                                                  height: 65,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '106',
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Credit',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //End of Credit section
                                  ],
                                ),
                                //End GPA Credit
                                SizedBox(
                                  height: 20,
                                ),

                                Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.95,
                                      height: 235,
                                      color: Colors.black12,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.8,
                                                height: 40,
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: Text(
                                                        'Personal Information',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.15,
                                                height: 40,
                                                child: IconButton(
                                                  onPressed: () {
                                                    batchController.text =
                                                        doc['batch'];
                                                    degreeController.text =
                                                        doc['degree'];
                                                    emailController.text =
                                                        doc['email'];
                                                    indexController.text =
                                                        doc['index'];
                                                    nameController.text =
                                                        doc['name'];
                                                    nicController.text =
                                                        doc['nic'];

                                                    showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          FullScreenDialog(
                                                        content:
                                                            SingleChildScrollView(
                                                          child: Container(
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context)
                                                                            .width,
                                                                        height:
                                                                            50,
                                                                        color: Colors
                                                                            .white,
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.2,
                                                                              child: IconButton(
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                icon: Icon(Icons.arrow_back_ios),
                                                                                iconSize: 25,
                                                                                color: Colors.black54,
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.8,
                                                                              height: 50,
                                                                              child: Column(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Row(
                                                                                    children: [
                                                                                      Text(
                                                                                        'Edit Profile Details',
                                                                                        style: TextStyle(
                                                                                          fontSize: 18,
                                                                                          fontWeight: FontWeight.bold,
                                                                                          color: Colors.black54,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            30,
                                                                      ),

                                                                      //Start Full name
                                                                      Row(
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(
                                                                              left: 10,
                                                                              bottom: 5,
                                                                            ),
                                                                            child:
                                                                                Text(
                                                                              'Full name',
                                                                              style: TextStyle(
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context)
                                                                            .width,
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10, right: 10),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                child: TextField(
                                                                                  controller: nameController,
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
                                                                        height:
                                                                            20,
                                                                      ),
                                                                      //End Full name

                                                                      //Start NIC
                                                                      Row(
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(
                                                                              left: 10,
                                                                              bottom: 5,
                                                                            ),
                                                                            child:
                                                                                Text(
                                                                              'NIC Number',
                                                                              style: TextStyle(
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context)
                                                                            .width,
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10, right: 10),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                child: TextField(
                                                                                  controller: nicController,
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
                                                                        height:
                                                                            20,
                                                                      ),
                                                                      //End NIC

                                                                      //Start Student ID
                                                                      Row(
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(
                                                                              left: 10,
                                                                              bottom: 5,
                                                                            ),
                                                                            child:
                                                                                Text(
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
                                                                        width: MediaQuery.sizeOf(context)
                                                                            .width,
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10, right: 10),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                child: TextField(
                                                                                  readOnly: true,
                                                                                  controller: indexController,
                                                                                  keyboardType: TextInputType.number,
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
                                                                        height:
                                                                            20,
                                                                      ),
                                                                      //End Student ID

                                                                      //Start Batch
                                                                      Row(
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(
                                                                              left: 10,
                                                                              bottom: 5,
                                                                            ),
                                                                            child:
                                                                                Text(
                                                                              'Batch',
                                                                              style: TextStyle(
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context)
                                                                            .width,
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10, right: 10),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                child: TextField(
                                                                                  readOnly: true,
                                                                                  controller: batchController,
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
                                                                        height:
                                                                            20,
                                                                      ),
                                                                      //End Batch

                                                                      //Start Degree
                                                                      Row(
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(
                                                                              left: 10,
                                                                              bottom: 5,
                                                                            ),
                                                                            child:
                                                                                Text(
                                                                              'Degree',
                                                                              style: TextStyle(
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context)
                                                                            .width,
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10, right: 10),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                child: TextField(
                                                                                  readOnly: true,
                                                                                  controller: degreeController,
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
                                                                        height:
                                                                            20,
                                                                      ),
                                                                      //End Degree

                                                                      //Start Email
                                                                      Row(
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(
                                                                              left: 10,
                                                                              bottom: 5,
                                                                            ),
                                                                            child:
                                                                                Text(
                                                                              'Email',
                                                                              style: TextStyle(
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context)
                                                                            .width,
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10, right: 10),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                child: TextField(
                                                                                  readOnly: true,
                                                                                  controller: emailController,
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
                                                                        height:
                                                                            20,
                                                                      ),
                                                                      //End Email

                                                                      SizedBox(
                                                                        height:
                                                                            30,
                                                                      ),

                                                                      //Start Update button
                                                                      Container(
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                MaterialButton(
                                                                                  onPressed: () {
                                                                                    // Update operation
                                                                                    _updateData(docId);
                                                                                  },
                                                                                  child: Text(
                                                                                    'Update',
                                                                                    style: TextStyle(
                                                                                      fontSize: 16,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                                  ),
                                                                                  color: Color.fromARGB(255, 77, 88, 97),
                                                                                  textColor: Colors.white,
                                                                                  minWidth: 100,
                                                                                  height: 40,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      //End Update button
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  icon: Icon(
                                                    Icons.edit_note,
                                                    color: Colors.black54,
                                                    size: 30,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10),
                                                child: Text(
                                                  'User Name',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  doc['name'],
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),

                                          //Start NIC
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  'National ID Number',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  doc['nic'],
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                            ],
                                          ),
                                          //End NIC
                                          SizedBox(
                                            height: 10,
                                          ),

                                          //Start Email
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  'Email Address',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  doc['email'],
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                            ],
                                          ),
                                          //End Email
                                          SizedBox(
                                            height: 10,
                                          ),

                                          //Start degree
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  'Degree Programme',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  doc['degree'],
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                            ],
                                          ),
                                          //End degree

                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),

                                    //Start Certificate and Badge
                                    InkWell(
                                      onTap: () {
                                        // Add your button's functionality here
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AllCertificates(
                                                      textValue: doc['index'])),
                                        );
                                      },
                                      child: Ink(
                                        child: Column(
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context).width*0.95,
                                              height: 60,
                                              color: Colors.black12,
                                              child: Column(
                                                
                                                children: [
                                                  Row(
                                                    
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.sizeOf(context).width*0.95,
                                                        height: 40,
                                                       
                                                        child: Row(
                                                          
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.only(left: 10),
                                                              child: Text('Certificates',
                                                              style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black54),),
                                                            ),
                                                            
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 10),
                                                        child: Text(
                                                          'Click here to view Certifications that I have got',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.w400,
                                                              color: Colors.black54),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    //End Certificate and Badge

                                    SizedBox(
                                      height: 10,
                                    ),


                                    //Start Badges
                                    InkWell(
                                      onTap: () {
                                        // Add your button's functionality here
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => AllBadges(
                                                  textValue: doc['index'])),
                                        );
                                      },
                                      child: Ink(
                                        child: Column(
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.95,
                                              height: 60,
                                              color: Colors.black12,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.95,
                                                        height: 40,
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 10),
                                                              child: Text(
                                                                'Badges',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                        .black54),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: Text(
                                                          'Click here to view Badges that I have got',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Colors
                                                                  .black54),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    //End Badges

                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
