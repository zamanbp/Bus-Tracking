

import 'package:flutter/material.dart';
import 'package:major_project/homePage.dart';
import 'package:major_project/loginPage.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60),
            child: Text('Sign Up',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(left: 25,right: 25, top: 30),
            child: TextField(
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Full Name',
             ) ),
          ),
           SizedBox(height: 35,),
           Padding(
             padding: EdgeInsets.only(left: 25, right: 25),
             child: TextField(
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'E-mail',
             ) ),
           ),
           SizedBox(height: 35,),
           Padding(
             padding: EdgeInsets.only(left: 25, right: 25),
             child: TextField(
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
             ) ),
           ),
           SizedBox(height: 35,),
           Padding(
             padding: EdgeInsets.only(left: 25, right: 25),
             child: TextField(
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Confirm Password',
             ) ),
           ),
          SizedBox(height: 30,),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
            }, child: Text('CREATE')),
        ],
      ),
    );
  }
}