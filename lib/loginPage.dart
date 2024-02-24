import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Text('Login',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 25,right: 25, top: 30),
            child: TextField(
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Emai id',
             ) ),
          ),
           SizedBox(height: 35,),
           Padding(
             padding: const EdgeInsets.only(left: 25, right: 25),
             child: TextField(
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
             ) ),
           ),

        ],
      ),
    );
  }
}