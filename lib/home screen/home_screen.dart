import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:schooligo_driver/home%20screen/setting%20page/userProfile.dart';
import 'package:schooligo_driver/repository/user_model.dart';
import 'dart:async';
import '../controllers/profile_controller.dart';
import '../screens/components/test.dart';
import '../utility/style.dart';
import 'package:location/location.dart' as loc;


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //get formattedDateOnly => null;
  bool isTurnOnLiveLocation = true;
  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;

  File image = File("path");
  File temp = File("path");

  @override
  Widget build(BuildContext context) {

     double screenHeight = MediaQuery.of(context).size.height;
     double screenWidth = MediaQuery.of(context).size.width;

     final controller = Get.put(ProfileController());

     String liveLocationMessage = "Turn On Live Location";

     Stream<String> currentDateStream() {
       return Stream.periodic(const Duration(seconds: 1), (_) {
         final now = DateTime.now();
         return DateFormat('yyyy-MM-dd').format(now);
       });
     }

     Stream<String> currentTimeStream() {
       return Stream.periodic(const Duration(seconds: 1), (_) {
         final now = DateTime.now();
         return DateFormat('HH:mm:ss').format(now);

       });
     }


     String getGreeting(int hour) {
       if (hour < 12) {
         return 'Good morning';
       } else if (hour < 17) {
         return 'Good afternoon';
       } else {
         return 'Good evening';
       }
     }


    return  SafeArea(
      child: Scaffold(

        body: SingleChildScrollView(
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
              if (snapshot.connectionState == ConnectionState.done){
                if(snapshot.hasData){
                  UserModel userdata = snapshot.data as UserModel;
                  return Column(
                    children: [

                      //User profile
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            SizedBox(
                              //width: double.infinity,
                              height: 50,
                              child: Image.asset(mainLogo,),
                            ),

                            InkWell(
                              onTap: (){
                                //Visit User Profile(Driver profile)
                                Get.to(() => DriverProfile(
                                  profilePic: userdata.fileUrt,
                                  id: userdata.id,
                                  firstName: userdata.firstName,
                                  secondName: userdata.lastName,
                                  email: userdata.email,
                                  mobileNumber: userdata.phoneNo,
                                  vehiclePlateNo: userdata.vehicleNo,
                                  address: userdata.address,

                                ));
                              },
                              child:  CircleAvatar(
                                radius: 35,
                                backgroundColor: Colors.amber,
                                child: CircleAvatar(
                                  radius: 33,
                                  backgroundImage: NetworkImage(
                                    // user profile image address
                                    userdata.fileUrt,
                                  ),
                                ),
                              ),
                            ),

                          ],

                        ),
                      ),


                      //=============================================
                      //=======  Dashboard Section  =================
                      //=============================================




                      Text(getGreeting(DateTime.now().hour) + ", " + userdata.firstName,style: heading2,),

                      // Text(
                      //   greeting,
                      //   style: TextStyle(fontSize: 24),
                      // ),
                      // StreamBuilder<String>(
                      //   stream: timeStream,
                      //   builder: (context, snapshot) {
                      //     if (snapshot.hasData) {
                      //       return Text(
                      //         snapshot.data!,
                      //         style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                      //       );
                      //     } else {
                      //       return Text(
                      //         'Loading...',
                      //         style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                      //       );
                      //     }
                      //   },
                      // ),




                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:100),
                        child: Center(child: Divider(thickness: 1,color: accent,),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:140),
                        child: Center(child: Divider(thickness: 1,color: accent,),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:180),
                        child: Center(child: Divider(thickness: 1,color: accent,),),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      // Center(
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     //crossAxisAlignment: CrossAxisAlignment.spaceBetween,
                      //     children: <Widget>[
                      //       //Text('Current Date and Time: $formattedDate'),
                      //       SizedBox(width: 5,),
                      //
                      //       //Time and Date
                      //       StreamBuilder<String>(
                      //         stream: currentDateStream(),
                      //         builder: (context, snapshot) {
                      //           if (snapshot.hasError) {
                      //             return Text('Error: ${snapshot.error}');
                      //           }
                      //           if (!snapshot.hasData) {
                      //             return Text('Loading...');
                      //           }
                      //           final date = snapshot.data;
                      //           return Text(
                      //             'Date: $date',
                      //             style: GoogleFonts.poppins(
                      //                 fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black45),
                      //           );
                      //         },
                      //       ),
                      //       StreamBuilder<String>(
                      //         stream: currentTimeStream(),
                      //         builder: (context, snapshot) {
                      //           if (snapshot.hasError) {
                      //             return Text('Error: ${snapshot.error}');
                      //           }
                      //           if (!snapshot.hasData) {
                      //             return Text('Loading...');
                      //           }
                      //           final time = snapshot.data;
                      //           return Text(
                      //             'Time: $time',
                      //             style: GoogleFonts.poppins(
                      //                 fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black45),
                      //           );
                      //         },
                      //       ),
                      //       SizedBox(width: 5,),
                      //     ],
                      //   ),
                      // ),

                      const SizedBox(
                        height: 15,
                      ),

                      Container(
                        width: double.infinity,
                        //height: 5000,

                        decoration: BoxDecoration(
                            color: accent,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            )
                        ),


                        //Widgets =================

                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //crossAxisAlignment: CrossAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  //Text('Current Date and Time: $formattedDate'),
                                  const SizedBox(width: 5,),

                                  //Time and Date
                                  StreamBuilder<String>(
                                    stream: currentDateStream(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasError) {
                                        return Text('Error: ${snapshot.error}',
                                          style: GoogleFonts.poppins(
                                              fontSize: 11, fontWeight: FontWeight.w600, color: Colors.red),);
                                      }
                                      if (!snapshot.hasData) {
                                        return Text('Loading...',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),);
                                      }
                                      final date = snapshot.data;
                                      return Text(

                                        'Date: $date',
                                        style: GoogleFonts.poppins(
                                            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                                      );
                                    },
                                  ),
                                  StreamBuilder<String>(
                                    stream: currentTimeStream(),
                                    builder: (context, snapshot) {

                                      if (snapshot.hasError) {
                                        return Text('Error: ${snapshot.error}',
                                          style: GoogleFonts.poppins(
                                              fontSize: 11, fontWeight: FontWeight.w600, color: Colors.red),);
                                      }
                                      if (!snapshot.hasData) {
                                        return Text('Loading...',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),);
                                      }
                                      final time = snapshot.data;
                                      return Text(
                                        'Time: $time',
                                        style: GoogleFonts.poppins(
                                            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 5,),

                                ],
                              ),

                              const Divider( color: Colors.white,thickness: 0.7,),

                              const SizedBox(
                                height: 20,
                              ),

                              Container(
                                width: double.infinity,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      SizedBox(
                                        width: 180,
                                        height: double.infinity,
                                        // color: Colors.redAccent,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 20),

                                              child: TextButton(
                                                onPressed: () {
                                                  // Navigator.of(context)
                                                  //     .pushNamed('/studentCountDetailScreen');
                                                },
                                                style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(accent),
                                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20),
                                                    ),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        'Student Count',
                                                        style: GoogleFonts.poppins(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w600,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        "37",
                                                        style: GoogleFonts.poppins(
                                                          fontSize: 50,
                                                          fontWeight: FontWeight.w600,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),

                                            )
                                          ],
                                        ),
                                      ),

                                      SizedBox(
                                        width: 120,
                                        height: double.infinity,
                                        //color: Colors.green,
                                        child: Image.asset(bus),

                                      )
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 20,
                              ),

                              Container(
                                width: double.infinity,
                                //height: 300,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: screenWidth * 0.8,
                                          height: 150,
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushNamed('/studentDetailScreen');
                                            },
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(accent),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                            child: const Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.groups,
                                                  size: 60,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  'Student Details',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),



                                      ],
                                    ),




                                    const SizedBox(height: 20,),

                                    //Turn on live location
                                    SizedBox(
                                      width: screenWidth * 0.8,
                                      height: 150,
                                      child: TextButton(
                                        onPressed: () {
                                          if(!isTurnOnLiveLocation){
                                            _listenLocation();
                                            isTurnOnLiveLocation = !isTurnOnLiveLocation;
                                            print(isTurnOnLiveLocation);

                                          }else{
                                            isTurnOnLiveLocation = !isTurnOnLiveLocation;
                                            _stopListening();
                                            print(isTurnOnLiveLocation);
                                          }
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(
                                            !isTurnOnLiveLocation ? Colors.green : Colors.red,
                                          ),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                        child:  isTurnOnLiveLocation ? const LocButton() : LocButtonOn(),

                                      ),
                                    ),

                                    const SizedBox(height: 20,),




                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: 150,
                                          height: 150,
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushNamed('/notificationScreen');
                                            },
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(accent),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                            child: const Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.notifications,
                                                  size: 60,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  'Notifications',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),



                                        SizedBox(
                                          width: 150,
                                          height: 150,
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushNamed('/emergencyScreen');
                                            },
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(accent),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                            child: const Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.sos,
                                                  size: 60,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  'Emergency',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                    const SizedBox(height: 20,),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: 150,
                                          height: 150,
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushNamed('/paymentDetailScreen');
                                            },
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(accent),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                            child: const Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.payments_outlined,
                                                  size: 60,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  'Payments',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),


                                        SizedBox(
                                          width: 150,
                                          height: 150,
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushNamed('/settingScreen');
                                            },
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(accent),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                            child: const Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.settings,
                                                  size: 60,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  'Settings',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                    const SizedBox(height: 20,),

                                  ],
                                ),
                              ),

                              const SizedBox(height: 30,),
                              const Text('SchooliGo - 0.0.1v',style: TextStyle(color: Colors.white60,fontWeight: FontWeight.w600),),
                              const SizedBox(height: 15,),

                            ],
                          ),
                        ),



                      ),

                    ],
                  );
                }
                else if(snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()),);
                }else{
                  return const Center(child: Text("Something Went Wrong"),);
                }
              }else{
                return const Center (child: CircularProgressIndicator());
              }
            },
          )
          ),
        ),

    );
  }


  Future<void> _listenLocation() async {
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationSubscription?.cancel();
      setState(() {
        print("Listen Location");
        _locationSubscription = null;
      });
    }).listen((loc.LocationData currentlocation) async {
      await FirebaseFirestore.instance.collection('location').doc('user1').set({
        'latitude': currentlocation.latitude,
        'longitude': currentlocation.longitude,
        'name': 'Khan'
      }, SetOptions(merge: true));
    });
    print("Listen Location");
  }

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  _stopListening() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
    print("Stop listen Location");
  }

  _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('done');
    } else if (status.isDenied) {
      _requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}



class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    // The InkWell wraps the custom flat button widget.
    return InkWell(
      // When the user taps the button, show a snackbar.
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Tap'),
        ));
      },
      child: const Padding(
        padding: EdgeInsets.all(12),
        child: Text('Flat Button'),
      ),
    );
  }
}



//
//
//
// //--------------------------------------
// const SizedBox(
// height: 30,
// ),
//
//
//
// const SizedBox(
// height: 50,
// ),
//
// BoxButton(
// Text('Scan \nQR Code',style: title,),
// Icon(Icons.qr_code_scanner_rounded,size: 100,color: white,),
// 250,
// double.infinity),
//
// const SizedBox(height: 30,),
//
// BoxButton(
// Text('View My Detils',style: title2,),
// Icon(Icons.remove_red_eye_outlined,size: screenWidth * 1.3/12,color: white,),
// 100,
// double.infinity),
//
// const SizedBox(height: 30,),
//
// BoxButton(
// Text('Student Details',style: title2,),
// Icon(Icons.groups_2,size: screenWidth * 1.3/12,color: white,),
// 100,
// double.infinity),
//
// const SizedBox(height: 30,),
//
// BoxButton(
// Text('Message',style: title2,),
// Icon(Icons.message,size: screenWidth * 1.3/12,color: white,),
// 100,
// double.infinity),
//
// const SizedBox(height: 40,),
