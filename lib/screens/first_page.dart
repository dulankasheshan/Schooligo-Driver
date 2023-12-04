import 'package:flutter/material.dart';

import '../utility/style.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {

    
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    
    return SafeArea(
      child: Scaffold(
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
                SizedBox(
                  width: double.infinity,
                  height: screenHeight * 0.4,
                 // color: Colors.blueAccent,
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Login Button
                      SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                             //Login function
                             Navigator.of(context)
                                            .pushNamed('/signInScreen');
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize:  Size(screenWidth * 0.60, 65),
                            backgroundColor: accent,
                            textStyle: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child:  Text('Sign In',style: buttonText),
                        ),
                      ),
        
                      const SizedBox(height: 40,),
        
                      //Register Button
                      SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                             //Reigster function
                             Navigator.of(context)
                                            .pushNamed('/driverKeyScreen');
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize:  Size(screenWidth * 0.60, 65),
                            backgroundColor: accentDark,
                            textStyle: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child:  Text('Sign Up',style: buttonText,),
                        ),
                      ),
                    ],
                  ),
                ),
        
                
              ],
            ),
          ),
        ),
      )
      );
  }
}