import 'package:flutter/material.dart';


class ComplaintForm extends StatefulWidget {
  @override
  _ComplaintFormState createState() => _ComplaintFormState();
}

class _ComplaintFormState extends State<ComplaintForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _studentIdController = TextEditingController();
  TextEditingController _topicController = TextEditingController();
  TextEditingController _complaintController = TextEditingController();

  bool _attachDocument = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _studentIdController.dispose();
    _topicController.dispose();
    _complaintController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Implement your logic for submission
      // For now, let's print the values
      print('Name: ${_nameController.text}');
      print('Student ID: ${_studentIdController.text}');
      print('Topic: ${_topicController.text}');
      print('Complain: ${_complaintController.text}');
      print('Attach Document: $_attachDocument');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complains Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildRow(
                    'Student Name', 'Enter student name', _nameController),
                _buildRow(
                    'Student ID', 'Enter student ID', _studentIdController),
                _buildRow('Topic', 'Enter topic', _topicController),
                _buildRow('Complaint', 'Enter complaint', _complaintController),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text('Attach Video/Image:'),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Implement logic to attach video/image
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        child: Text('Browse'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
               
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   

                  
                    Container(
                      width: 120,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(primary: Colors.blue),
                        child: Text('Post',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, String hintText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
           // MediaQuery.sizeOf(context).width*0.5,
            width: 60,
            child: Text('$label:', style: TextStyle(fontSize: 16)),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: hintText,
                errorStyle: TextStyle(color: Colors.red),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter $label';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
