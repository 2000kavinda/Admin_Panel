import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../canteenStudent/dialogbox.dart';

class searchItemsResults extends StatefulWidget {
  //const CanteenItems({Key? key}) : super(key: key);
  final String textValue;
  searchItemsResults({required this.textValue});

  @override
  State<searchItemsResults> createState() => _searchItemsResultsState();
}

class _searchItemsResultsState extends State<searchItemsResults> {
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('canteenItems');

  final itemNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final categoryController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  Stream<QuerySnapshot> _getFilteredSearchs() {
    return collectionReference
        .where('itemName', isEqualTo: widget.textValue)
        .snapshots();
  }

  void _updateData(String docId) {

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
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Result',
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
              stream: _getFilteredSearchs(),
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
                  itemCount: items.length * 2 - 1, // Double the item count to account for SizedBox widgets
                  itemBuilder: (BuildContext context, int index) {
                    if (index.isOdd) {
                      // Odd indices correspond to SizedBox widgets
                      return SizedBox(height: 16); // Adjust the height as needed
                    }

                    // Even indices correspond to data items
                    final dataIndex = index ~/ 2;
                    final doc = items[dataIndex].data() as Map<String, dynamic>;
                    final docId = items[dataIndex].id;

                    return Column(
                      children: [
                        //Start Item Details
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.95,
                                color: Colors.black12,
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.25,
                                      height: 120,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 45,
                                            backgroundImage:
                                                NetworkImage(doc['imageLink']),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.70,
                                      height: 120,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      doc['itemName']
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                Row(
                                                  children: [
                                                    Text(
                                                      'LKR.',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    Text(
                                                      doc['price'].toString(),
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                //Start Buy Button
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5),
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child:
                                                                MaterialButton(
                                                              onPressed: () {
                                                                itemNameController
                                                                        .text =
                                                                    doc['itemName'];
                                                                descriptionController
                                                                        .text =
                                                                    doc['description'];
                                                                priceController
                                                                        .text =
                                                                    doc['price'];
                                                                categoryController
                                                                        .text =
                                                                    doc['category'];

                                                                showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) =>
                                                                          FullScreenDialog(
                                                                    content:
                                                                        Container(
                                                                      child: SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              //Start appBar
                                                                              Row(
                                                                                children: [
                                                                                  Container(
                                                                                    color: Colors.white,
                                                                                    width: MediaQuery.sizeOf(context).width*0.2,
                                                                                    height: 55,
                                                                                    child: InkWell(
                                                                                      onTap:() {
                                                                                        Navigator.of(context).pop();
                                                                                      },
                                                                                      child: Icon(Icons.arrow_back_ios,
                                                                                      color: Colors.black54,
                                                                                      size: 30,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    width: MediaQuery.sizeOf(context).width*0.8,
                                                                                    height: 55,
                                                                                    color: Colors.white,
                                                                                    child: Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Row(
                                                                                          children: [
                                                                                            Text('Edite Canteen Items',
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
                                                                              //End appBar
                                                                              SizedBox(
                                                                                height: 20,
                                                                              ),
                                                                              //Start Item name
                                                                              Row(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(
                                                                                      left: 10,
                                                                                      bottom: 5,
                                                                                    ),
                                                                                    child: Text(
                                                                                      'Item name',
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
                                                                                          controller: itemNameController,
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
                                                                              //End Item name

                                                                              //Start Description
                                                                              Row(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(
                                                                                      left: 10,
                                                                                      bottom: 5,
                                                                                    ),
                                                                                    child: Text(
                                                                                      'Description',
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
                                                                                          controller: descriptionController,
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
                                                                              //End Description
                                                                              //Start Price
                                                                              Row(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(
                                                                                      left: 10,
                                                                                      bottom: 5,
                                                                                    ),
                                                                                    child: Text(
                                                                                      'Price',
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
                                                                                          controller: priceController,
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
                                                                                height: 20,
                                                                              ),
                                                                              //End Price
                                                                              //Start Category
                                                                              Row(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(
                                                                                      left: 10,
                                                                                      bottom: 5,
                                                                                    ),
                                                                                    child: Text(
                                                                                      'Category',
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
                                                                                          controller: categoryController,
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
                                                                                height: 40,
                                                                              ),
                                                                              //End Category
                                                                              //Start buttons
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width,
                                                                                child: Row(
                                                                                  children: [
                                                                                    Container(
                                                                                      width: MediaQuery.sizeOf(context).width * 0.5,
                                                                                      child: Column(
                                                                                        children: [
                                                                                          MaterialButton(
                                                                                            onPressed: () {
                                                                                              // Delete operation
                                                                                              collectionReference.doc(docId).delete().then((_) {
                                                                                                Navigator.of(context).pop(); // Close the dialog
                                                                                              }).catchError((error) {
                                                                                                print("Error deleting document: $error");
                                                                                              });
                                                                                            },
                                                                                            child: Text('Delete'),
                                                                                            color: Color.fromARGB(255, 77, 88, 97),
                                                                                            textColor: Colors.white,
                                                                                            minWidth: 100,
                                                                                            height: 40,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: MediaQuery.sizeOf(context).width * 0.5,
                                                                                      child: Column(
                                                                                        children: [
                                                                                          MaterialButton(
                                                                                            onPressed: () {
                                                                                              // Update operation
                                                                                              _updateData(docId);
                                                                                            },
                                                                                            child: Text('Update'),
                                                                                            color: Color.fromARGB(255, 77, 88, 97),
                                                                                            textColor: Colors.white,
                                                                                            minWidth: 100,
                                                                                            height: 40,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              //End buttons
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left: 5,
                                                                        right:
                                                                            5),
                                                                child: Text(
                                                                  'Options',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      77,
                                                                      88,
                                                                      97),
                                                              textColor:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                //End Buy button
                                              ],
                                            ),
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
                        //End Item Details
                        
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
