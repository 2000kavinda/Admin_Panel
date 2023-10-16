import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/pages/canteenStudent/dialogbox.dart';

class AllBadges extends StatefulWidget {
  //const AllBadges({Key? key}) : super(key: key);
  final String textValue;
  AllBadges({required this.textValue});

  @override
  State<AllBadges> createState() => _AllBadgesState();
}

class _AllBadgesState extends State<AllBadges> {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('batches');

  final batchnameController = TextEditingController();
  final descriptionController = TextEditingController();
  final idController = TextEditingController();

  void _updateData(String docId) {
    collectionReference.doc(docId).update({
      "batchname": batchnameController.text,
      "description": descriptionController.text,
      "id": idController.text,
    }).then((_) {
      Navigator.of(context).pop(); // Close the dialog
    }).catchError((error) {
      print("Error updating document: $error");
    });
  }

  Stream<QuerySnapshot> _getFilteredItemsStream() {
    return collectionReference
        .where('id', isEqualTo: widget.textValue)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Badges',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 16,
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

                    return Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              //Start Certification Image
                              Container(
                                width: MediaQuery.sizeOf(context).width,
                                height: 130,
                                color: Colors.black12,
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.3,
                                      height: 100,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Row(
                                              children: [
                                                Image.network(
                                                  doc['imageLink'],
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                  width: 100,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.6,
                                      height: 100,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Column(
                                              children: [
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          doc['batchname'],
                                                          style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            doc['description'],
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.1,
                                      height: 100,
                                      child: IconButton(
                                        onPressed: () {
                                          batchnameController.text =
                                              doc['batchname'];
                                          descriptionController.text =
                                              doc['description'];
                                          idController.text = doc['id'];

                                          showDialog(
                                            context: context,
                                            builder: (context) =>
                                                FullScreenDialog(
                                              content: Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            width: MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width,
                                                            height: 50,
                                                            color: Colors
                                                                .blueAccent,
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.2,
                                                                  child:
                                                                      IconButton(
                                                                    onPressed:
                                                                        () {
                                                                          Navigator.of(context) .pop();
                                                                        },
                                                                    icon: Icon(Icons
                                                                        .arrow_back_ios),
                                                                    iconSize:
                                                                        25,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.8,
                                                                  height: 50,
                                                                  child: Column(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            'Edite Badges',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize:
                                                                                  18,
                                                                              fontWeight:
                                                                                  FontWeight
                                                                                      .bold,
                                                                              color: Colors
                                                                                  .white,
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
                                                            height: 30,
                                                          ),
                                                          //Start badge name
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
                                                                  'Badge name',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            width: MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width,
                                                            child: Column(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              10,
                                                                          right:
                                                                              10),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          batchnameController,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      decoration:
                                                                          const InputDecoration(
                                                                        border:
                                                                            InputBorder.none,
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            Colors.black12,
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
                                                          //End badge name

                                                          //Start Description
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
                                                                  'Description',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            width: MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width,
                                                            child: Column(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              10,
                                                                          right:
                                                                              10),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          descriptionController,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      decoration:
                                                                          const InputDecoration(
                                                                        border:
                                                                            InputBorder.none,
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            Colors.black12,
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
                                                          //End Description

                                                          SizedBox(
                                                            height: 30,
                                                          ),

                                                          //Start button
                                                          Row(
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.5,
                                                                child: Column(
                                                                  children: [
                                                                    MaterialButton(
                                                                      onPressed:
                                                                          () {
                                                                        // Delete operation
                                                                        collectionReference
                                                                            .doc(docId)
                                                                            .delete()
                                                                            .then((_) {
                                                                          Navigator.of(context)
                                                                              .pop(); // Close the dialog
                                                                        }).catchError((error) {
                                                                          print(
                                                                              "Error deleting document: $error");
                                                                        });
                                                                      },
                                                                      child: Text(
                                                                          'Delete'),
                                                                      color: Colors
                                                                          .red,
                                                                      textColor:
                                                                          Colors
                                                                              .white,
                                                                      minWidth:
                                                                          100,
                                                                      height:
                                                                          40,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.5,
                                                                child: Column(
                                                                  children: [
                                                                    MaterialButton(
                                                                      onPressed:
                                                                          () {
                                                                        // Update operation
                                                                        _updateData(
                                                                            docId);
                                                                      },
                                                                      child: Text(
                                                                          'Update'),
                                                                      color: Colors
                                                                          .blue,
                                                                      textColor:
                                                                          Colors
                                                                              .white,
                                                                      minWidth:
                                                                          100,
                                                                      height:
                                                                          40,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),

                                                          //End button
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        icon: Icon(Icons.edit_note),
                                        iconSize: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //End Certification image
                            ],
                          ),
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
