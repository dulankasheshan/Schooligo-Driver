// Driver verify key enter screen

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../utility/style.dart';

class DriverKeyScreen extends StatefulWidget {
  const DriverKeyScreen({super.key});

  @override
  State<DriverKeyScreen> createState() => _DriverKeyScreenState();
}

class _DriverKeyScreenState extends State<DriverKeyScreen> {

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // TextEditingController otpController = TextEditingController();

  // void _verifyOTP() {
  //   if (_formKey.currentState!.validate()) {
  //     // Implement your OTP verification logic here
  //     String enteredOTP = otpController.text;
  //     // Compare enteredOTP with the actual OTP sent to the user
  //     // If they match, proceed with authentication
  //     // Otherwise, show an error message
  //     // You can use a service like Firebase Authentication for OTP verification
  //   }
  // }


  //Temp driver key
  String driverKey = '54321';

  @override
  Widget build(BuildContext context) {

     
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    
    
    return  Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
              children: [
                // SizedBox(height: 150,),
                // Image.asset('res/logo/logo.png',width: 250,),
                SizedBox(
                  width: double.infinity,
                  height: screenHeight * 0.5,
                  //color: Colors.amber,
                  child: Center(
                    child: Image.asset(mainLogo,width: 250,),
                  ),
                ),
      

                //Key enter section
                SizedBox(
                  width: double.infinity,
                  height: screenHeight * 0.4,
                 // color: Colors.blueAccent,
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30,),

                      Text('Enter Driver Key',style: heading1,),

                      const SizedBox(height: 50,),
      
                      OtpTextField(
                        numberOfFields: 5,
                        //autoFocus: true,
                        focusedBorderColor: black,
                        cursorColor: black,
                        borderColor: black,
                        textStyle: heading1,
                        fieldWidth: 55,
                        showFieldAsBox: true, 
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          
                            //handle validation or checks here           
                        },
                        //runs when every textfield is filled

                        onSubmit: (String verificationCode){
                          // Check verify code function

                          print(verificationCode);

                           if(driverKey == verificationCode){
                              Navigator.of(context)
                                          .pushNamed('/signUpScreen');
                           }
                           else{
                            showDialog(
                                context: context,
                                builder: (context){
                                return const AlertDialog(
                                    title: Text("Invalid Verification Code"),
                                    //content: Text('Code entered is $verificationCode'),
                                );
                                }
                            );
                           }
                            
                        }, // end onSubmit
                    ),
                      
                    ],
                  ),
                ),
      
                
              ],
            ),
          ),
      ),
    );
  }
}