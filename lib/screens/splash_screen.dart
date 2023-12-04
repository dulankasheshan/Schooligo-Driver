import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

    // Delay duration in seconds
    static const splashDuration = 5;

  @override
  Widget build(BuildContext context) {


    // Navigating to the Calculator screen after the delay
    Future.delayed(const Duration(seconds: splashDuration), () {
      Navigator.pushReplacementNamed(context, '/welcome_page');
    });
    
    return SafeArea(
      child: Scaffold(
        //backgroundColor: const Color.fromARGB(255, 23, 24, 28),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 50,right: 50),
            child: Image.asset('res/logo.png'),
          ),
        ),
        
      ),
    );
  }
}