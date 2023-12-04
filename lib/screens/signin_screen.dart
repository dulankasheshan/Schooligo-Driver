// Driver Login Screen

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../authentication_repository.dart';
import '../controllers/signin_controller.dart';
import '../utility/style.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();


  
  @override
  Widget build(BuildContext context) {

    // double screenHeight = MediaQuery.of(context).size.height;
     double screenWidth = MediaQuery.of(context).size.width;
     final controller = Get.put(SignInController());
     Get.lazyPut(()=>AuthenticationRepository());



    return SafeArea(
      child: Scaffold(
        body:  SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(small),
            child: Column(
              children: [

                SizedBox(
                  width: double.infinity,
                  height: 260,
                  //color: accent,
                  child: Center(
                        child: Image.asset(mainLogo,width: 250,),
                      ),
                ),

                Align(alignment: Alignment.centerLeft,child: Text('Sign In',style: heading1,),),

                const SizedBox(height: 40,),

                 Form(
                   key: _formKey,
                   child: Column(
                    children: [

                       //Email text field ===========================
                      TextFormField(
                     obscureText: false,
                     cursorColor: black,
                     keyboardType: TextInputType.emailAddress,
                     controller: controller.email,
                     decoration: InputDecoration(
                       border: const OutlineInputBorder(),
                       labelText: 'Email Address',
                       labelStyle: TextStyle(color: black), // Set the label text color to black
                       hintText: 'Enter Email',
                     ),
                   ),

                      const SizedBox(height: 30,),


                       //Password text field ===========================
                      TextFormField(
                        obscureText: !_isPasswordVisible,
                        keyboardType: TextInputType.text,
                        cursorColor: black,
                        controller: controller.password,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  _isPasswordVisible = !_isPasswordVisible;
                                                });
                                              },
                                              child: Icon(
                                                _isPasswordVisible
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: icon,
                                              ),

                                            ),
                          border: const OutlineInputBorder(),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: black), // Set the label text color to black
                          hintText: 'Enter Password',
                        ),


                      ),
                    ],
                   ),
                 ),

                    //Forget Password ===========================
                          Container(
                            alignment: Alignment.centerRight,
                            height: 35,

                            child: TextButton(
                              onPressed: () {
                                // Handle button tap
                              },
                              child: Ink(
                                child: InkWell(
                                  splashColor: Colors
                                      .transparent, // Set the splash color to transparent
                                  highlightColor: Colors
                                      .transparent, // Set the highlight color to transparent
                                  child:  Text(
                                    'Forgot Password?',
                                    //textAlign: TextAlign.end,
                                    style: TextStyle(
                                        color: link, fontSize: 13),
                                  ),
                                  onTap: () {
                                    // Navigator.of(context).pushNamed('/loginScreen');
                                  },
                                ),
                              ),
                            ),
                          ),

                    const SizedBox(height: 40,),

                    //Login Button  ===========================
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                           //Login function
                          // Navigator.of(context)
                          //     .pushNamed('/navigationView');
                          if(_formKey.currentState!.validate()) {
                            SignInController.instance.signUser(
                                controller.email.text.trim(),
                                controller.password.text);}
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize:  Size(screenWidth * 0.60, 65),
                          backgroundColor: accent,
                          textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child:  Text('Sign In',style: buttonText),
                      ),
                    ),


                //New to Logistics? Sign up =====================
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text("Don't have an account?"),
                              TextButton(
                                onPressed: () {
                                  // Handle button tap
                                },
                                child: Ink(
                                  child: InkWell(
                                    splashColor: Colors
                                        .transparent, // Set the splash color to transparent
                                    highlightColor: Colors
                                        .transparent, // Set the highlight color to transparent
                                    child:  Text(
                                      'Sign up',
                                      style: TextStyle(color: link),
                                    ),
                                    onTap: () {
                                      //print("driverKeyScreen");
                                      Navigator.of(context)
                                          .pushNamed('/signUpScreen');
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
              ],
            ),
          ),
        )
      )
      );
  }
}