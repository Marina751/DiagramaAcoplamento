import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'dart:async';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
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
