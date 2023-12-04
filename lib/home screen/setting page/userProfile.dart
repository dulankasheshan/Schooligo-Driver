//Driver Profile

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utility/style.dart';

class DriverProfile extends StatefulWidget {
  // const DriverProfile({super.key});

  final String? id;
  final String? profilePic;
  final String? vehiclePlateNo;
  final String? mobileNumber;
  final String? email;
  final String? firstName;
  final String? secondName;
  final String? address;

  const DriverProfile({
    Key? key,
    this.id,
     this.profilePic,
    this.vehiclePlateNo,
    this.mobileNumber,
    this.email,
    this.firstName,
    this.secondName,
    this.address,
  }) : super(key: key);



  @override
  State<DriverProfile> createState() => _DriverProfileState();
}

class _DriverProfileState extends State<DriverProfile> {
  @override
  Widget build(BuildContext context) {
// double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    // String? gender;
    // String selectedGender = 'Male';
    // List<String> genderOptions = ['Male', 'Female'];

    String? driverName = widget.firstName;
    String? id = widget.id;
    String? profilePic = widget.profilePic;
    String? mobileNumber = widget.mobileNumber;
    String? email = widget.email;
    String? firstName = widget.firstName;
    String? secondName = widget.secondName;
    String? address = widget.address;
    String? vehiclePlateNo = widget.vehiclePlateNo;

    XFile? image0;

    Future<void> pickImage() async {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        image0 = image;
      });
    }


    return SafeArea(
        child: Scaffold(
            body:  SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.all(small),
                child: Column(
                  children: [



                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios)),

                      ],
                    ),

                    const SizedBox(height: 30,),

                    Text('Hello, $driverName',style: heading1,),

                    const SizedBox(height: 50,),

                    Form(
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
                                    border: Border.all(width: 4,color:Colors.white),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.1)
                                      ),
                                    ],
                                    color: icon,

                                    image:  DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(widget.profilePic!
                                        )
                                    )
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
                                  ))
                            ],
                          ),

                          const SizedBox(height: 30,),

                          TextFormField(
                            maxLines: null,
                            controller: TextEditingController(text: '$id'),
                            enabled: false, // Disable editing
                            style:  TextStyle(color: Colors.black), // Change text color
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Driver Key',
                              labelStyle: TextStyle(color: Colors.black), // Change label text color
                              hintStyle: TextStyle(color: Colors.black), // Change hint text color
                            ),
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
                            initialValue: '$firstName',
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
                            initialValue: '$secondName',
                          ),

                          const SizedBox(height: 30,),


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
                            initialValue: '$email',
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
                            initialValue: '$firstName',
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
                            initialValue: '$mobileNumber',
                          ),




                          const SizedBox(height: 14,),

                          // const Divider(),

                          const SizedBox(height: 14,),

                          //Vehicle Plate Number text field ===========================
                          TextFormField(
                            obscureText: false,
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Vehicle Plate Number',
                              labelStyle: TextStyle(color: Colors.black),
                              hintText: 'Enter Vehicle Plate Number',

                            ),
                             initialValue: "$vehiclePlateNo",
                          ),

                          const SizedBox(height: 14,),

                          // const Divider(),

                          const SizedBox(height: 14,),

                          //Address field ===========================

                          //Address text field ===========================
                          TextFormField(
                            obscureText: false,
                            cursorColor: black,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Address ',
                              labelStyle: TextStyle(color: black), // Set the label text color to black
                              hintText: 'Address ',
                            ),
                            initialValue: "$address",
                          ),



                          // Container(
                          //   width: double.infinity,
                          //   height: 250,
                          //
                          //
                          //   decoration: BoxDecoration(
                          //     border: Border.all(color: icon,width: 1),
                          //     borderRadius: BorderRadius.circular(8),
                          //     //color: icon,
                          //   ),
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: Column(
                          //       children:  [
                          //
                          //         const Align(
                          //           alignment: Alignment.centerLeft,
                          //           child: Text("Address", style: TextStyle(
                          //               fontSize: 18
                          //           ),
                          //           ),
                          //         ),
                          //
                          //         Padding(
                          //           padding: const EdgeInsets.only(top: 8.0),
                          //           child: Container(
                          //             color: icon,
                          //             width: double.maxFinite,
                          //             height: 200,
                          //           ),
                          //         )
                          //
                          //       ],
                          //     ),
                          //   ),
                          // )

                        ],
                      ),
                    ),


                    const SizedBox(height: 40,),

                    //Sign up Button  ===========================
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          //Sign up function
                          // Navigator.of(context)
                          //     .pushNamed('/navigationView');
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
                        child:  Text('Update',style: buttonText),
                      ),
                    ),



                    const SizedBox(height: 40,),



                  ],
                ),
              ),
            )
        )
    );
  }
}