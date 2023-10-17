import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/pages/canteenStudent/dialogbox.dart';

class ShuttlesAdmin extends StatefulWidget {
  const ShuttlesAdmin({Key? key}) : super(key: key);

  @override
  State<ShuttlesAdmin> createState() => _ShuttlesState();
}

class _ShuttlesState extends State<ShuttlesAdmin> {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('buses');

  final busNoController = TextEditingController();
  final destinationController = TextEditingController();
  final driverController = TextEditingController();
  final stop1Controller = TextEditingController();
  final stop2Controller = TextEditingController();
  final stop3Controller = TextEditingController();
  final stop4Controller = TextEditingController();
  final stop5Controller = TextEditingController();
  final stop6Controller = TextEditingController();
  final stop7Controller = TextEditingController();
  final time1Controller = TextEditingController();
  final time2Controller = TextEditingController();
  final time3Controller = TextEditingController();
  final time4Controller = TextEditingController();
  final time5Controller = TextEditingController();
  final time6Controller = TextEditingController();
  final time7Controller = TextEditingController();
  final vehicleNoController = TextEditingController();

  void _updateData(String docId) {
    collectionReference.doc(docId).update({
      "busNo": busNoController.text,
      "destination": destinationController.text,
      "driver": driverController.text,
      "stop1": stop1Controller.text,
      "stop2": stop2Controller.text,
      "stop3": stop3Controller.text,
      "stop4": stop4Controller.text,
      "stop5": stop5Controller.text,
      "stop6": stop6Controller.text,
      "stop7": stop7Controller.text,
      "time1": time1Controller.text,
      "time2": time2Controller.text,
      "time3": time3Controller.text,
      "time4": time4Controller.text,
      "time5": time5Controller.text,
      "time6": time6Controller.text,
      "time7": time7Controller.text,
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
          'Shuttle Services',
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
            height: 16,
          ),
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
                        InkWell(
                          onTap: () {
                            busNoController.text = doc['busNo'];
                            destinationController.text = doc['destination'];
                            driverController.text = doc['driver'];
                            stop1Controller.text = doc['stop1'];
                            stop2Controller.text = doc['stop2'];
                            stop3Controller.text = doc['stop3'];
                            stop4Controller.text = doc['stop4'];
                            stop5Controller.text = doc['stop5'];
                            stop6Controller.text = doc['stop6'];
                            stop7Controller.text = doc['stop7'];
                            time1Controller.text = doc['time1'];
                            time2Controller.text = doc['time2'];
                            time3Controller.text = doc['time3'];
                            time4Controller.text = doc['time4'];
                            time5Controller.text = doc['time5'];
                            time6Controller.text = doc['time6'];
                            time7Controller.text = doc['time7'];
                            vehicleNoController.text = doc['vehicleNo'];

                            showDialog(
                              context: context,
                              builder: (context) => FullScreenDialog(
                                content: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      //Start Input section
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.1,
                                                child: IconButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  icon: Icon(
                                                      Icons.arrow_back_ios),
                                                  iconSize: 25,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.9,
                                                child: Text(
                                                  'Edit Shuttle Details',
                                                  style: TextStyle(
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                            ],
                                          ),
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
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: TextField(
                                                      readOnly: false,
                                                      controller:
                                                          destinationController,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        filled: true,
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
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: TextField(
                                                      readOnly: false,
                                                      controller:
                                                          busNoController,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        filled: true,
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
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: TextField(
                                                      readOnly: false,
                                                      controller:
                                                          vehicleNoController,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        filled: true,
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
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: TextField(
                                                      readOnly: false,
                                                      controller:
                                                          driverController,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        filled: true,
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
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: TextField(
                                                      readOnly: false,
                                                      controller:
                                                          stop1Controller,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        filled: true,
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
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: TextField(
                                                      readOnly: false,
                                                      controller:
                                                          time1Controller,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        filled: true,
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
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: TextField(
                                                      readOnly: false,
                                                      controller:
                                                          stop2Controller,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        filled: true,
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
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: TextField(
                                                      readOnly: false,
                                                      controller:
                                                          time2Controller,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        filled: true,
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
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: TextField(
                                                      readOnly: false,
                                                      controller:
                                                          stop3Controller,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        filled: true,
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
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: TextField(
                                                      readOnly: false,
                                                      controller:
                                                          time3Controller,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        filled: true,
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
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: TextField(
                                                      readOnly: false,
                                                      controller:
                                                          stop4Controller,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        filled: true,
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
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: TextField(
                                                      readOnly: false,
                                                      controller:
                                                          time4Controller,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        filled: true,
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
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: TextField(
                                                      readOnly: false,
                                                      controller:
                                                          stop5Controller,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        filled: true,
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
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: TextField(
                                                      readOnly: false,
                                                      controller:
                                                          time5Controller,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        filled: true,
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
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: TextField(
                                                      readOnly: false,
                                                      controller:
                                                          stop6Controller,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        filled: true,
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
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: TextField(
                                                      readOnly: false,
                                                      controller:
                                                          time6Controller,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        filled: true,
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
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: TextField(
                                                      readOnly: false,
                                                      controller:
                                                          stop7Controller,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        filled: true,
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
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: TextField(
                                                      readOnly: false,
                                                      controller:
                                                          time7Controller,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        filled: true,
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
                                          //End Arrival time 7

                                          SizedBox(
                                            height: 20,
                                          ),

                                          //Start buttons
                                          Row(
                                            children: [
                                              //Start Delete
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.5,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      child: MaterialButton(
                                                        onPressed: () {
                                                          // Delete operation
                                                          collectionReference
                                                              .doc(docId)
                                                              .delete()
                                                              .then((_) {
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
                                                          'Delete',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        color: Color.fromARGB(
                                                            255, 6, 114, 187),
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
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.5,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      child: MaterialButton(
                                                        onPressed: () {
                                                          // Update operation
                                                          _updateData(docId);
                                                        },
                                                        child: Text(
                                                          'Update',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        color: Color.fromARGB(
                                                            255, 6, 114, 187),
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

                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                      //End Input section
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Ink(
                            width: MediaQuery.sizeOf(context).width * 0.95,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.3,
                                      height: 140,
                                      color: Color.fromARGB(255, 221, 219, 219),
                                      child: Image.asset(
                                          "assets/images/busImg.png"),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.65,
                                      height: 140,
                                      color: Color.fromARGB(255, 221, 219, 219),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.65,
                                            height: 110,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Shuttle No: ',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                    Text(
                                                      doc['busNo'],
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Departure Time: ',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                    Text(
                                                      doc['time1'],
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Reg No: ',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                    Text(
                                                      doc['vehicleNo'],
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      doc['driver'],
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.65,
                                            height: 30,
                                            color: Color.fromARGB(
                                                137, 4, 102, 131),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 4),
                                                      child: Text(
                                                        doc['destination'],
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white70),
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
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
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
