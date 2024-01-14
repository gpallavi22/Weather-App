import 'dart:math';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/sign_up.dart';

import 'home_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();

GlobalKey<FormState> key = GlobalKey<FormState>();

void login() async{
  String email = emailcontroller.text.trim();
  String password = passwordcontroller.text.trim();

  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email, password: password);

  Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context)=>HomeScreen())
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: key,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage("https://static.apksmods.com/images/en/com.weatherteam.rainy.forecast.radar.widgets/icon.png"),
                ),
                Text("Weather App",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: emailcontroller,
                    validator: (value){
                      RegExp emailReg = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                      if(value!.isEmpty){
                        return 'Please enter email';
                      }else if(!emailReg.hasMatch(value)){
                        return 'please enter valid email';
                      }


                    },

                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email,color: Colors.black,),
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: passwordcontroller,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please enter password';
                      }

                    },
                    obscureText:true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key,color: Colors.black,),
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )



                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                    onPressed: (){
                    if(key!.currentState!.validate()){
                      login();
                    }else{
                      SnackBar snackbar =SnackBar(content: Text("Failed to login"));
                    }
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                      ),
                    )
                ),
              ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>SignUp())
                        );

                      });
                    },
                    child: Text(
                      "Create an account",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black
                      ),
                    ),
                  ),
                )


              ],
            ),


          ),

        ),
      ),

    );
  }
}
