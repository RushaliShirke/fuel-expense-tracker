import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fuel_mileage_tracker/screens/home_page.dart';
import 'package:fuel_mileage_tracker/screens/sign_in.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  _LoginScreen createState()=> _LoginScreen();
}
class _LoginScreen extends State<LoginScreen>{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> loginWithEmailAndPassword()async{
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
      );
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
      print(userCredential);
    }on FirebaseAuthException catch(e){
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F9FC),
        title: const Text('Tracker',
          style: TextStyle(
            color: Color(0xFF203A43),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.fromLTRB(30, 120, 30, 120),
            color: const Color(0xFFE6EEFF),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Login',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF203A43),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFFFFFFF),
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              )
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return 'Please enter Email ID';
                            }
                          },
                          style: const TextStyle(color: Colors.black87),
                        ),
                        const SizedBox(height:30),
                        TextFormField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFFFFFFF),
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              )
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return 'Please enter password';
                            }
                          },
                          style: const TextStyle(color: Colors.black87),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.06,),
                        ElevatedButton(onPressed: ()async{
                          await loginWithEmailAndPassword();
                        },
                            style: ButtonStyle(
                                backgroundColor: const WidgetStatePropertyAll(Color(0xFF3366FF),),
                                fixedSize: WidgetStatePropertyAll(Size(
                                    MediaQuery.of(context).size.width*0.4,
                                    MediaQuery.of(context).size.height*0.06
                                )),
                                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)
                                )),
                                elevation: const WidgetStatePropertyAll(4)
                            ),
                            child: const Text('Submit',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFFFFF)
                              ),
                            )
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Dont have an account?'),
                            TextButton(onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (BuildContext context)=> const SignUp())
                              );
                            },
                              child: const Text('Sign Up',style: TextStyle(color: Color(0xFF1E2A39))),)
                          ],
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}