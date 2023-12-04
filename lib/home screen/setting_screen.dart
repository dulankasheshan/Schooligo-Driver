import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:schooligo_driver/home%20screen/setting%20page/userProfile.dart';
import 'package:url_launcher/url_launcher.dart';


import '../controllers/signin_controller.dart';
import '../utility/style.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});
  //
  //
  // final String? id;
  // final String? profilePic;
  // final String? vehiclePlateNo;
  // final String? mobileNumber;
  // final String? email;
  // final String? firstName;
  // final String? secondName;
  // final String? address;
  //
  // const SettingScreen({
  //   Key? key,
  //   this.id,
  //   this.profilePic,
  //   this.vehiclePlateNo,
  //   this.mobileNumber,
  //   this.email,
  //   this.firstName,
  //   this.secondName,
  //   this.address,
  // }) : super(key: key);




  @override
  State<SettingScreen> createState() => _SettingScreenState();


}

class _SettingScreenState extends State<SettingScreen> {

  String driverName = "Sagara";
  String emailUrl = "dulankasr@gmail.com";




  @override
  Widget build(BuildContext context) {

    // double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child:  Scaffold(
          body: SingleChildScrollView(
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



                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(

                       // color: Colors.redAccent,
                        child: Column(
                          children: [

                            const SizedBox(height: 30,),


                            const SizedBox(height: 10,),
                            const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                'Settings',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w700,

                                ),
                              ),

                            ),

                            const SizedBox(height: 30,),


                            //Settings  ====================================
                            // Padding(
                            //   padding: const EdgeInsets.only(bottom: 20),
                            //   child: SizedBox(
                            //
                            //       child: ElevatedButton(
                            //         onPressed: () {
                            //           //Visit User Profile(Driver profile)
                            //           Get.to(() => DriverProfile(
                            //             profilePic: userdata.fileUrt,
                            //             id: userdata.id,
                            //             firstName: userdata.firstName,
                            //             secondName: userdata.lastName,
                            //             email: userdata.email,
                            //             mobileNumber: userdata.phoneNo,
                            //             vehiclePlateNo: userdata.vehicleNo,
                            //             address: userdata.address,
                            //
                            //           ));
                            //         },
                            //         style: ElevatedButton.styleFrom(
                            //           fixedSize: Size(screenWidth * 0.80, 70),
                            //           backgroundColor: accent,
                            //           textStyle: const TextStyle(
                            //             fontSize: 12,
                            //             fontWeight: FontWeight.bold,
                            //           ),
                            //           shape: RoundedRectangleBorder(
                            //             borderRadius: BorderRadius.circular(8),
                            //           ),
                            //         ),
                            //         child: Row(
                            //           mainAxisAlignment: MainAxisAlignment.start,
                            //           children: [
                            //             Container(
                            //
                            //                 width: 50,
                            //                 height: 50 ,
                            //                 decoration: BoxDecoration(
                            //                   borderRadius: BorderRadius.circular(20),
                            //                   color: Colors.orangeAccent,
                            //                 ),
                            //                 child: const Icon(Icons.person, color: Colors.white)), // Use the desired logout icon
                            //
                            //             const SizedBox(width: 20,),
                            //
                            //             const SizedBox(width: 8), // Add some spacing between the icon and text
                            //             Text('User Account', style: buttonText2),
                            //           ],
                            //         ),
                            //       )
                            //
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: SizedBox(

                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('/passwordChange');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(screenWidth * 0.80, 70),
                                      backgroundColor: accent,
                                      textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(

                                            width: 50,
                                            height: 50 ,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Colors.orangeAccent,
                                            ),
                                            child: const Icon(Icons.lock, color: Colors.white)), // Use the desired logout icon

                                        const SizedBox(width: 20,),

                                        const SizedBox(width: 8), // Add some spacing between the icon and text
                                        Text('Password Change', style: buttonText2),
                                      ],
                                    ),
                                  )

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: SizedBox(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    const url = "https://schooligoweb.blogspot.com/2023/10/driver-agreement-for-schooligo-app.html";
                                    final Uri _url = Uri.parse(url);

                                    await launchUrl(_url,mode: LaunchMode.externalApplication);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(screenWidth * 0.80, 70),
                                    backgroundColor: accent,
                                    textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.orangeAccent,
                                        ),
                                        child: const Icon(Icons.verified, color: Colors.white),
                                      ),
                                      const SizedBox(width: 20),
                                      const SizedBox(width: 8),
                                      Text('Agreement', style: buttonText2),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: SizedBox(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    const url = "https://schooligoweb.blogspot.com/2023/12/schooligo-help.htmll";
                                    final Uri _url = Uri.parse(url);

                                    await launchUrl(_url,mode: LaunchMode.externalApplication);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(screenWidth * 0.80, 70),
                                    backgroundColor: accent,
                                    textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.orangeAccent,
                                        ),
                                        child: const Icon(Icons.help, color: Colors.white),
                                      ),
                                      const SizedBox(width: 20),
                                      const SizedBox(width: 8),
                                      Text('Help', style: buttonText2),
                                    ],
                                  ),
                                ),
                              ),
                            ),



                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: SizedBox(

                                  child: ElevatedButton(
                                    onPressed: () {
                                      // reportBug function
                                      FeedBack(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(screenWidth * 0.80, 70),
                                      backgroundColor: accent,
                                      textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(

                                            width: 50,
                                            height: 50 ,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Colors.orangeAccent,
                                            ),
                                            child: const Icon(Icons.feedback_rounded, color: Colors.white)), // Use the desired logout icon

                                        const SizedBox(width: 20,),

                                        const SizedBox(width: 8), // Add some spacing between the icon and text
                                        Text('Feedback', style: buttonText2),
                                      ],
                                    ),
                                  )

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: SizedBox(

                                  child: ElevatedButton(
                                    onPressed: () {
                                      // reportBug function
                                      reportBug(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(screenWidth * 0.80, 70),
                                      backgroundColor: accent,
                                      textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(

                                            width: 50,
                                            height: 50 ,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Colors.orangeAccent,
                                            ),
                                            child: const Icon(Icons.bug_report, color: Colors.white)), // Use the desired logout icon

                                        const SizedBox(width: 20,),

                                        const SizedBox(width: 8), // Add some spacing between the icon and text
                                        Text('Bug Report', style: buttonText2),
                                      ],
                                    ),
                                  )

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: SizedBox(

                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Sign out function
                                       SignInController().signOut();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(screenWidth * 0.80, 70),
                                      backgroundColor: Colors.redAccent,
                                      textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(

                                            width: 50,
                                            height: 50 ,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Colors.red,
                                            ),
                                            child: const Icon(Icons.logout, color: Colors.white)), // Use the desired logout icon

                                        const SizedBox(width: 20,),

                                        const SizedBox(width: 8), // Add some spacing between the icon and text
                                        Text('Log Out', style: buttonText2),
                                      ],
                                    ),
                                  )

                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}



//  Functions ================================================


//
// void launchUrl(String url) async {
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }


//Bug report
Future<void> reportBug(BuildContext context) async {
  String bugDescription = ''; // Store the bug description entered by the user

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Report a Bug'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (text) {
                  bugDescription = text;
                },
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'Bug Description'),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Construct the email subject and body
              String emailSubject = 'Bug Report';
              String emailBody = 'Bug Description: $bugDescription';

              // Construct the email URL
              String emailUrl = 'mailto:dulankasr@gmail.com?subject=$emailSubject&body=$emailBody';

              // Launch the email client with the pre-filled email
              launch(emailUrl);

              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Submit'),
          ),
        ],
      );
    },
  );
}


//Feedback

Future<void> FeedBack(BuildContext context) async {
  String feedbackDescription = ''; // Store the bug description entered by the user

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Feedback '),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (text) {
                  feedbackDescription = text;
                },
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'Write Your Feedback'),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Construct the email subject and body
              String emailSubject = 'Send Feedback';
              String emailBody = 'Feedback Description: $feedbackDescription';

              // Construct the email URL
              String emailUrl = 'mailto:dulankasr@gmail.com?subject=$emailSubject&body=$emailBody';

              // Launch the email client with the pre-filled email
              launch(emailUrl);

              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Submit'),
          ),
        ],
      );
    },
  );
}