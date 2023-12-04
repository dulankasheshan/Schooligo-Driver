import 'package:flutter/material.dart';

import '../../utility/style.dart';

class PasswordChange extends StatefulWidget {
  const PasswordChange({super.key});

  @override
  State<PasswordChange> createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {


  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    // double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;


    return SafeArea(
        child: Scaffold(
            body:  SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.all(small),
                child: Column(
                  children: [

                    Row(
                      children: [
                        IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios)),
                      ],
                    ),

                    const SizedBox(height: 30,),


                    const SizedBox(height: 10,),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Change Password ',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,

                        ),
                      ),

                    ),

                    const SizedBox(height: 30,),


                    // Container(
                    //   width: double.infinity,
                    //   height: 220,
                    //   //color: accent,
                    //   child: Center(
                    //     child: Image.asset(mainLogo,width: 250,),
                    //   ),
                    // ),
                    //
                    // Align(child: Text('Sign Up',style: heading1,),alignment: Alignment.centerLeft,),

                    const SizedBox(height: 40,),

                    Form(
                      child: Column(
                        children: [

                          // Old Password text field ===========================
                          TextFormField(
                            obscureText: !_isPasswordVisible,
                            keyboardType: TextInputType.text,
                            cursorColor: black,
                            decoration: InputDecoration(
                              // suffixIcon: InkWell(
                              //   onTap: () {
                              //     setState(() {
                              //       _isPasswordVisible = !_isPasswordVisible;
                              //     });
                              //   },
                              //   child: Icon(
                              //     _isPasswordVisible
                              //         ? Icons.visibility_off
                              //         : Icons.visibility,
                              //     color: icon,
                              //   ),
                              //
                              // ),
                              border: const OutlineInputBorder(),
                              labelText: 'Old Password',
                              labelStyle: TextStyle(color: black), // Set the label text color to black
                              hintText: 'Enter Old Password',
                            ),

                          ),

                          const SizedBox(height: 30,),


                          //New Password text field ===========================
                          TextFormField(
                            obscureText: !_isPasswordVisible,
                            keyboardType: TextInputType.text,
                            cursorColor: black,
                            decoration: InputDecoration(
                              // suffixIcon: InkWell(
                              //   onTap: () {
                              //     setState(() {
                              //       _isPasswordVisible = !_isPasswordVisible;
                              //     });
                              //   },
                              //   child: Icon(
                              //     _isPasswordVisible
                              //         ? Icons.visibility_off
                              //         : Icons.visibility,
                              //     color: icon,
                              //   ),
                              //
                              // ),
                              border: const OutlineInputBorder(),
                              labelText: 'New Password',
                              labelStyle: TextStyle(color: black), // Set the label text color to black
                              hintText: 'Enter New Password',
                            ),

                          ),

                          const SizedBox(height: 30,),


                          //Nuw Password text field ===========================
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
                              labelText: 'Confirm Password',
                              labelStyle: TextStyle(color: black), // Set the label text color to black
                              hintText: 'Enter Confirm Password',
                            ),

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
                          // Navigator.of(context)
                          //     .pushNamed('/driverDetailsScreen');
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
                        child:  Text('Change',style: buttonText),
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
