import 'package:flutter/material.dart';
import 'package:untitled1/pages/admin/adminController.dart';
import 'package:untitled1/pages/bottomBar/bottombar.dart';
import 'package:untitled1/pages/canteenAdmin/bottomBarCanteenAdmin.dart';
import 'package:untitled1/pages/home_page.dart';
import 'package:untitled1/pages/interview/tempLogin.dart';
import 'package:untitled1/pages/libraryAdmin/bottomBarLibraryAdmin.dart';
import 'package:untitled1/pages/st_menue.dart';
import 'package:untitled1/pages/startPages/auth_methods.dart';
import 'package:untitled1/pages/startPages/signup.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}); // Fixed key parameter syntax

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUser(BuildContext context) async {
    String resp = await AuthMethods().loginUser(
      email: emailController.text,
      password: passwordController.text,
    );
    if (resp == "success" && emailController.text=="admin@gmail.com") {
      String textValue = emailController.text;
      // Navigate to SignUp page on successful login (replace with your desired route)
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => AdminController()),
      );
      emailController.clear();
      passwordController.clear();
    }
    else if (resp == "success" && emailController.text=="canteen@gmail.com") {
      String textValue = emailController.text;
      // Navigate to SignUp page on successful login (replace with your desired route)
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => BottomBarCanteenAdmin()),
      );
      emailController.clear();
      passwordController.clear();
    }
    else if (resp == "success" && emailController.text=="library@gmail.com") {
      String textValue = emailController.text;
      // Navigate to SignUp page on successful login (replace with your desired route)
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => BottomBarLibraryAdmin()),
      );
      emailController.clear();
      passwordController.clear();
    }
    else if (resp == "success" && emailController.text=="interview@gmail.com") {
      String textValue = emailController.text;
      // Navigate to SignUp page on successful login (replace with your desired route)
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => TempLogin()),
      );
      emailController.clear();
      passwordController.clear();
    }
    else if (resp == "success") {
      String textValue = emailController.text;
      // Navigate to SignUp page on successful login (replace with your desired route)
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => BottomBar(textValue: textValue)),
      );
      emailController.clear();
      passwordController.clear();
    }

    else {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      'assets/images/crossMark.png',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Something went wrong",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  void navigateToSignUp(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SignUp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Start Banner NSBM
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 370,
                child: Image.asset(
                  'assets/images/loginImg.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              //End of Banner NSBM
              //Start Sign in Text
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //End of Sign in Text
              SizedBox(
                height: 30,
              ),

              Container(
                child: Column(
                  children: [
                    //Start email
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
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
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                readOnly: false,
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
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
                    //End of email
                    //Start Password
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Password',
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
                                controller: passwordController,
                                keyboardType: TextInputType.text,
                                obscureText: true,
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

                    //End Password
                    SizedBox(
                      height: 40,
                    ),

                    //Start sign in button
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: MaterialButton(
                        onPressed: () {
                          loginUser(context); // Call loginUser here
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Colors.green,
                        textColor: Colors.white,
                        minWidth: 150,
                        height: 50,
                      ),
                    ),
                    //End sign in button

                    SizedBox(
                      height: 30,
                    ),

                    //Start Signup button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: const Text(
                            "Don’t have an account ?",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            navigateToSignUp(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: const Text(
                              " Signup",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    //End Signup button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                        GestureDetector(
                          onTap: () {
                            navigateToSignUp(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: const Text(
                              "Login as a Guest",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
