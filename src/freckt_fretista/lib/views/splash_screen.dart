//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:freckt_fretista/views/entrar.dart';
//import 'package:freckt_fretista/views/home_fretista.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'dart:async';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  //User currentUser;
  //bool _initialized = false;
  //bool _error = false;

  // Define an async function to initialize FlutterFire
  //void initializeFlutterFire() async {
  //try {
  // Wait for Firebase to initialize and set `_initialized` state to true
  //  await Firebase.initializeApp();
  //FirebaseAuth.instance.authStateChanges().listen((user) {
  //  currentUser = user; //FirebaseAuth.instance.currentUser;
  //});
  //setState(() {
  //  _initialized = true;
  //});
  //} catch (e) {
  // Set `_error` state to true if Firebase initialization fails
  //setState(() {
  //  _error = true;
  //});
  //}
  //}

  // Show error message if initialization failed
  //if(_error) {
  //  return SomethingWentWron();
  //}

  // Show a loader until FlutterFire is initialized
  //if (!_initialized) {
  //  return Loading();
  //}

  @override
  void initState() {
    super.initState();

    //Timer(
    //  Duration(seconds: 2),
    //() {
    //initializeFlutterFire();

    //if (currentUser != null) {
    //  Navigator.push(
    //    context,
    //    MaterialPageRoute(
    //      builder: (context) => HomeFretista(),
    //    ),
    //  );
    //} else {
    //  Navigator.push(
    //    context,
    //    MaterialPageRoute(
    //      builder: (context) => Entrar(),
    //    ),
    //  );
    //}
    //},
    //);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent[700],
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.0, 330.0, 20.0, 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.local_shipping_rounded, size: 68.0),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                'freckt',
                style: GoogleFonts.comfortaa(
                  fontSize: 48.0,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
