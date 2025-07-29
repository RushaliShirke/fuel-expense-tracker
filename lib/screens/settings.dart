import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fuel_mileage_tracker/screens/login.dart';

class SettingsPage extends StatelessWidget{
  const SettingsPage({super.key});

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning!';
    if (hour < 17) return 'Good Afternoon!';
    return 'Good Evening!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F9FC),
        elevation: 0,
        leading: IconButton(
            onPressed: ()=> Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back_ios_new)
        ),
        title: Text(
          'Tracker',
          style: TextStyle(
            color: Color(0xFF1E2A39),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFFF7F9FC),
              ),
              child: Column(
                children: [
                  Text(
                    greeting(),
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3366FF),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Fuel Expense and Mileage Tracker',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF3366FF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Card(
              color: const Color(0xFFF7F9FC),
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.settings,
                        color: Color(0xFF3366FF),
                      ),
                      title: const Text('Settings',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF3366FF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout,
                        color: Color(0xFF3366FF),
                      ),
                      title: const Text('Logout',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF3366FF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: (){
                        FirebaseAuth.instance.signOut();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                              (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}