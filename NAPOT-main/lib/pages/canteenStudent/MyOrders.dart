import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/main.dart';
import 'package:untitled1/pages/canteenStudent/dialogbox.dart';
import 'package:untitled1/pages/canteenStudent/ordersAddClass.dart';

class MyOrders extends StatefulWidget {
  //const SearchResults({super.key, required String textValue});
  final String textValue;
  MyOrders({required this.textValue});


  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {

  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('orders');

  final itemNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();

  TextEditingController searchController = TextEditingController();

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
          'Back',
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54),
        ),
        
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 25,
          color: Colors.black54,
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        bottomOpacity: 0.0,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 5),
                child: Text(
                  'Notifications',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              )
            ],
          ),

          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Recent',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black45),),
              )
            ],
          ),
         

          SizedBox(height: 16,),
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

                /*List<DocumentSnapshot> filteredItems = items
                    .where((doc) =>
                    doc['itemName'].toString().toLowerCase().contains(searchKeyword))
                    .toList();*/

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
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width*0.98,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: MediaQuery.sizeOf(context).width*0.2,
                                        height: 90,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Image.asset('assets/images/Spoon.png'),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.sizeOf(context).width*0.78,
                                        height: 90,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Text('You have successfully orderd ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black54),),
                                                  Text(
                                                    doc['quantity'].toString(),
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black54),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    doc['itemName'].toString(),
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black54),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text('Paid LKR.',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black54),
                                                  ),
                                                  Text(
                                                    doc['price'].toString(),
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black54),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width*0.95,
                              height: 1,
                              color: Colors.black12,
                            ),
                          ],
                        ),
                        
                      ],
                    );
                  },
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
