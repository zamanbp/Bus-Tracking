import 'package:flutter/material.dart';
import 'package:major_project/loginPage.dart';
import 'package:major_project/signupPage.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Heading', style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold)),
            SizedBox(height: 25,),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
            }, child: const Text('Login')),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupPage()));
            }, child: Text('Signup')),

          ],
        ),
      ),
    );
  }
}