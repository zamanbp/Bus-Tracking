import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:major_project/widgets/customtextfield.dart';
import 'package:major_project/presentation/homePage.dart';
import 'package:major_project/services/loginApi.dart';
import 'package:major_project/presentation/signupPage.dart';

class LoginScreenNew extends StatefulWidget {
  LoginScreenNew({Key? key}) : super(key: key);

  @override
  State<LoginScreenNew> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenNew> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool passwordVisible = true;
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formkey,
              child: Container(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    buildTextField(
                        context,
                        "Email",
                        false,
                        IconButton(onPressed: () {}, icon: Icon(null)),
                        emailController,
                        Icon(Icons.mail), (value) {
                      if (value == "") {
                        return "Field can't be empty";
                      } else {
                        return null;
                      }
                    }),
                    SizedBox(
                      height: 15,
                    ),
                    buildTextField(
                        context,
                        "Password",
                        passwordVisible,
                        IconButton(
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            icon: passwordVisible
                                ? Icon(Icons.visibility_off_outlined)
                                : Icon(Icons.visibility_outlined)),
                        passwordController,
                        Icon(Icons.lock), (value) {
                      if (value == "") {
                        return "Field can't be empty";
                      } else {
                        return null;
                      }
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPasswordScreen(),));
                          },
                          child: Text("Forgot password?"),
                        )
                      ],
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    //log in button
                    Container(
                          height: 55,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                isLoading.value = true;
                                final responce = await loginApi(
                                    emailController.text,
                                    passwordController.text);
                                print("responce $responce");
                                if (responce == "success") {
                                  isLoading.value = false;
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => HomePage()));
                                }
                                else{
                                  isLoading.value = false;
                                }
                              }
                            },
                            child: 
                            ValueListenableBuilder(valueListenable: isLoading, builder: (context, value, child) {
                              return isLoading.value
                                ? CircularProgressIndicator()
                                : Text("Login",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white));
                            },),              
                        style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                            ),
                          ),
                        ),
                    SizedBox(
                      height: 5,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignupPage(),
                          ));
                        },
                        child: Text("Register"))
                  ],
                ),
              ),
            ),
          ),
        ),
      )),);
}
}
