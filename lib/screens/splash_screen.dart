import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fuel_mileage_tracker/screens/home_page.dart';
import 'package:fuel_mileage_tracker/screens/login.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen>{

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
            (){
              FirebaseAuth.instance.currentUser != null ?
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> HomePage()))
                  :
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> LoginScreen())) ;
            }
    );

    var assetImage = const AssetImage('assets/images/applogo.png');

    var image = Image(image: assetImage, height: 150,);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color(0xFF3366FF),
                  Color(0xFFE6EEFF),
                  Color(0xFFFFFFFF)
                ],
              )
          ),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 200,),
                  image,
                  const Text('Tracker',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Color(0xFF0F2027)
                    ),
                  ),
                  const Text('Fuel Economy and Mileage Tracker',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF203A43)
                    ),
                  ),
                  const SizedBox(height: 250,),
                  const Text('Let\'s Track!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color:Color(0xFF203A43)
                    ),
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
}
