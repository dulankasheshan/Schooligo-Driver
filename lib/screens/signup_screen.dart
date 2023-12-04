// Driver Register Screen

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schooligo_driver/controllers/signup_controller.dart';
import '../utility/style.dart';
import 'driver_details.dart';

class SignUpScreen extends StatefulWidget {
   const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

    bool _isPasswordVisible = false;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
     double screenWidth = MediaQuery.of(context).size.width;
     final controller = Get.put(SignUpController());

    return SafeArea(
      child: Scaffold(
        body:  SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(small),
            child: Column(
              children: [
            
                SizedBox(
                  width: double.infinity,
                  height: 220,
                  //color: accent,
                  child: Center(
                        child: Image.asset(mainLogo,width: 250,),
                      ),
                ),
            
                Align(alignment: Alignment.centerLeft,child: Text('Sign Up',style: heading1,),),
                
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
                     decoration: InputDecoration(  
                       border: const OutlineInputBorder(),  
                       labelText: 'Email Address',
                       labelStyle: TextStyle(color: black), // Set the label text color to black
                       hintText: 'Enter Email',
                     ),
                        controller: controller.email,
                   ), 


                   const SizedBox(height: 30,),


                       //Display text field ===========================           
                      TextFormField(  
                     obscureText: false,  
                     cursorColor: black,
                     keyboardType: TextInputType.text,
                     decoration: InputDecoration(  
                       border: const OutlineInputBorder(),  
                       labelText: 'Display Name',
                       labelStyle: TextStyle(color: black), // Set the label text color to black
                       hintText: 'Enter Display Name',
                     ),
                        controller: controller.userName,
                   ), 
                           
                      const SizedBox(height: 30,),


                       //Password text field ===========================           
                      TextFormField(  
                        obscureText: !_isPasswordVisible,
                        keyboardType: TextInputType.text,
                        cursorColor: black,
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
                        controller: controller.password,
                        
                      ),
                    ],
                   ),
                 ),
          
                
                    const SizedBox(height: 40,),

                    //Next Button  ===========================
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                           //Next page function
                           Get.to(DriverDetailsScreen());
                          // if(_formKey.currentState!.validate()){
                          //   SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text);
                          // }
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
                        child:  Text('Next',style: buttonText),
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
                              const Text("Already have a account?"),
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
                                      'Sign In',
                                      style: TextStyle(color: link),
                                    ),
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed('/signInScreen');
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