import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/pages/admin/adminController.dart';
import 'package:untitled1/pages/admin/shuttles.dart';
import 'package:untitled1/pages/admin/userChoose.dart';
import 'package:untitled1/pages/bottomBar/bottombar.dart';
import 'package:untitled1/pages/canteenStudent/tempLogin.dart';
import 'package:untitled1/pages/complainspage.dart';
import 'package:untitled1/pages/facilities.dart';
import 'package:untitled1/pages/libraryStudent/availbleRooms.dart';
import 'package:untitled1/pages/postG1.dart';
import 'package:untitled1/pages/postG2.dart';
import 'package:untitled1/pages/q&a/addQ&a.dart';
import 'package:untitled1/pages/shuttleService/shuttle.dart';
import 'package:untitled1/pages/startPages/signIn.dart';
//import 'package:untitled1/pages/canteenStudent/tempLogin.dart';
import 'package:untitled1/pages/startPages/splashPage.dart';
import 'package:untitled1/pages/marks/marks.dart';
import 'package:untitled1/pages/studentProfile/signIncp.dart';
import 'package:untitled1/pages/studentProfile/tempLogin.dart';
//import 'package:untitled1/pages/studentProfile/tempLogin.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash(),
  ));
}
