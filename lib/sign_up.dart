import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  GlobalKey <FormState>registerform = GlobalKey<FormState>();

  void register() async {
    String name = namecontroller.text.trim();
    String email = emailcontroller.text.trim();
    String password = passwordcontroller.text.trim();
    String confirmpassword = confirmpasswordcontroller.text.trim();

    Map<String,dynamic> userdata ={
      "name" : name,
      "email": email,
      "password" :password,
      "confirm password": confirmpassword
    };

    try{
         await FirebaseFirestore.instance.collection("users").add(userdata);

         Navigator.pushReplacement(
             context,
             MaterialPageRoute(builder: (context)=>HomeScreen())
         );

    } on FirebaseAuthException catch(ex){
        log(ex.code.toString());
    }



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: registerform,
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
                    controller: namecontroller,
                      validator: (value){
                      if(value!.isEmpty){
                        return 'Please enter name';
                      }
                      },

                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person,color: Colors.black,),
                          labelText: "Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: emailcontroller,
                      validator: (value){
                        RegExp emailReg = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                      if(value!.isEmpty){
                        return 'please enter email';
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
                  child: TextFormField(
                    controller: confirmpasswordcontroller,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please enter confirm password';
                      }else if(value!=passwordcontroller.text){
                        return 'Reenter password';
                      }
                      return null;
                    },
                    obscureText:true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.key,color: Colors.black,),
                        labelText: " Confirmed Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )



                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: 200,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            )
                        ),
                        onPressed: (){
                          if(registerform.currentState!.validate()){
                            register();
                          }else{
                            SnackBar snackbar =SnackBar(content: Text("Failed to Register"));
                          }
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                          ),
                        )
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
