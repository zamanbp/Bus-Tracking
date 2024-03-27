import 'package:flutter/material.dart';
import 'package:major_project/busListPage.dart';
import 'package:major_project/busRoute.dart';
import 'package:major_project/destination.dart';
import 'package:major_project/homePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:major_project/liveBus.dart';
import 'package:major_project/loadingPage.dart';
import 'package:major_project/loginPage.dart';
import 'package:major_project/signupPage.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'apiKey', 
      appId: '1:936780465285:android:425cdba1f7efe3877d15ec', 
      messagingSenderId: '936780465285', 
      projectId: 'bus-tracking-95315')
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(  
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
      LoginScreenNew()
      //HomePage(),
    );
  }
}

