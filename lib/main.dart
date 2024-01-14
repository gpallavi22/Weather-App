import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/sign_In.dart';
import 'package:weatherapp/sign_up.dart';
import 'package:weatherapp/splash_screen.dart';

import 'firebase_options.dart';
import 'home_screen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
