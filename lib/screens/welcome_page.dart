import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schooligo_driver/utility/style.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.amber,
        body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset('res/login_img.svg',height: height * 0.6,),
              const Column(
                children: [
                   Text('Welcome!',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900),),
                   SizedBox(height: 10,),
                   Text(' Welcome aboard! Tracking safety, ease, and communication for school transportation',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
                   SizedBox(height: -0,),
                ],
              ),
              
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/signInScreen');  // Navigate to the login page
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Adjust the value to control the border radius
                        ),
                        foregroundColor: Colors.amber,
                        side: const BorderSide(color: Colors.amber),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text(
                        'SignIn'.toUpperCase(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),

                  const SizedBox(width: 15,),
                  Expanded(child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context)
                                          .pushNamed('/signUpScreen');
                    }, 
                    style: OutlinedButton.styleFrom(
                      elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Adjust the value to control the border radius
                        ),
                          backgroundColor: accent,
                          //foregroundColor: Colors.black,
                          //side: BorderSide(color: Colors.black),
                          padding: const EdgeInsets.symmetric(vertical: 15)
                        ),
                    child: Text('Signup'.toUpperCase(),
                    style: const TextStyle(fontSize: 18,)
                    )))
              ],
              )
              
            ],
          ),
        ),
      ),
    );
  }
}