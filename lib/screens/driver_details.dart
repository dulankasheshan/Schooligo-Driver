//Driver Infomations
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/signup_controller.dart';
import '../utility/style.dart';



class DriverDetailsScreen extends StatefulWidget {
  const DriverDetailsScreen({Key? key}) : super(key: key);


  @override
  State<DriverDetailsScreen> createState() => _DriverDetailsScreenState();
}

class _DriverDetailsScreenState extends State<DriverDetailsScreen> {
  final controller = Get.put(SignUpController());
  File image = File("path");
  File temp = File("path");

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
            
                const SizedBox(height: 30,),

                Text('Driver Details',style: heading1,),
                
                const SizedBox(height: 40,),
            
                 Form(
                   key: _formKey,
                   child: Column(
                    children: [

                      //Profile image =========================
                      Stack(
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(width: 4,color: Colors.orange),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1)
                                ),
                              ],
                              color: icon,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: image != null? FileImage(image!) : FileImage(temp),
                              ),
                            ),
                          ),

                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: InkWell(
                                onTap: pickImage,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white,width: 4),
                                      color: Colors.grey
                                  ),
                                  child: const Icon(Icons.image_search_rounded,color: Colors.white,size: 20,),
                                ),
                              )),
                        ],
                      ),



                      const SizedBox(height: 30,),

                       //First name text field ===========================
                      TextFormField(  
                     obscureText: false,  
                     cursorColor: black,
                     keyboardType: TextInputType.text,
                     decoration: InputDecoration(  
                       border: const OutlineInputBorder(),  
                       labelText: 'First Name',
                       labelStyle: TextStyle(color: black), // Set the label text color to black
                       hintText: 'Enter First Name',
                     ),
                        controller: controller.fName,
                   ), 

                    const SizedBox(height: 30,),

                       //Last Name text field ===========================
                      TextFormField(  
                     obscureText: false,  
                     cursorColor: black,
                     keyboardType: TextInputType.text,
                     decoration: InputDecoration(  
                       border: const OutlineInputBorder(),  
                       labelText: 'Last Name',
                       labelStyle: TextStyle(color: black), // Set the label text color to black
                       hintText: 'Enter Last Name',
                     ),
                        controller: controller.lName,
                   ), 

                    const SizedBox(height: 30,),

                       //Phone number text field ===========================
                      TextFormField(  
                     obscureText: false,  
                     cursorColor: black,
                     keyboardType: TextInputType.number,
                     decoration: InputDecoration(  
                       border: const OutlineInputBorder(),  
                       labelText: 'Mobile Number',
                       labelStyle: TextStyle(color: black), // Set the label text color to black
                       hintText: 'Enter Mobile Number',
                     ),
                        controller: controller.phoneNumber,
                   ), 

                  const SizedBox(height: 14,),

                  const Divider(),

                  const SizedBox(height: 14,),

                       //Vehicle Plate Number text field ===========================
                      TextFormField(  
                     obscureText: false,  
                     cursorColor: black,
                     keyboardType: TextInputType.text,
                     decoration: InputDecoration(  
                       border: const OutlineInputBorder(),  
                       labelText: 'Vehicle Plate Number ',
                       labelStyle: TextStyle(color: black), // Set the label text color to black
                       hintText: 'Enter Vehicle Plate Number ',
                     ),
                        controller: controller.vehiclePlateNumber,
                   ),

                   const SizedBox(height: 14,),

                  const Divider(),

                  const SizedBox(height: 14,),

                  //Address field ===========================

                      //Vehicle Plate Number text field ===========================
                      TextFormField(
                        obscureText: false,
                        cursorColor: black,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Address ',
                          labelStyle: TextStyle(color: black), // Set the label text color to black
                          hintText:  "Address",
                        ),
                        controller: controller.address,
                      ),
                  


                    ],
                   ),
                 ),
          
                
                    const SizedBox(height: 40,),

                    //Sign up Button  ===========================
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                           //Sign up function
                          if(_formKey.currentState!.validate()){
                            controller.setImage(image);
                            controller.registerUser();
                          }
                          print(controller.password);
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
                        child:  Text('Sign Up',style: buttonText),
                      ),
                    ),


                   
            
            
                //Already have a account? Sign in =====================
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
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
      controller.setImage(image as File);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
}