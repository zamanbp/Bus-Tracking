

import 'package:flutter/material.dart';
import 'package:major_project/presentation/homePage.dart';
import 'package:major_project/presentation/loginPage.dart';
import 'package:major_project/services/regApi.dart';
import 'package:major_project/services/userRegModel.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController fullnameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController rePasswordController = TextEditingController();

  bool passwordVisible = true;

  bool isLoading = false;

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
            child: TextFormField(
              controller: fullnameController,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Full Name',
             ) ),
          ),
           SizedBox(height: 35,),
           Padding(
             padding: EdgeInsets.only(left: 25, right: 25),
             child: TextFormField(
              controller: emailController,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'E-mail',
             ) ),
           ),
           SizedBox(height: 35,),
           Padding(
             padding: EdgeInsets.only(left: 25, right: 25),
             child: TextFormField(
              controller: phoneNumberController,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone Number',
             )),
           ),
           SizedBox(height: 35,),
           Padding(
             padding: EdgeInsets.only(left: 25, right: 25),
             child: TextFormField(
              controller: passwordController,
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
            ElevatedButton(onPressed: () async{
              await regClicked(context);
            }, child: Text('CREATE')),
        ],
      ),
    );
  }

  regClicked(BuildContext context) async{
    setState(() {
      isLoading = true;
    });
    final user = UserReg(name: fullnameController.text, phone: phoneNumberController.text, password: passwordController.text, email: emailController.text);
    final status = await registrationApi(user);
    if (status == "success") {
      isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text("Registered successfully"),
          ),
        );
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => LoginScreenNew()),
        );
      } 
      else {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text("Something went wrong"),
          ),
        );
      }
      setState(() {
        
      });

  }
}