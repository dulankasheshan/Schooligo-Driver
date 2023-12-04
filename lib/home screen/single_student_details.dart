import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';

import '../utility/style.dart';

class SingleUserDetails extends StatefulWidget {
  final String profilePic;
  final String studenrName;
  final String school;
  final String mobileNumber;
  final String email;
  final String firstName;
  final String secondName;
  final String address;

  const SingleUserDetails({
    super.key, required this.profilePic,
    required this.studenrName,
    required this.school,
    required this.mobileNumber,
    required this.email,
    required this.firstName,
    required this.secondName,
    required this.address});

  @override
  State<SingleUserDetails> createState() => _SingleUserDetailsState();
}

class _SingleUserDetailsState extends State<SingleUserDetails> {
  @override
  Widget build(BuildContext context) {



    return SafeArea(
      child:  Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.all(small),
                      child: IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios)),
                    ),


                  ],
                ),



                //Profile image =========================
                Stack(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
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

                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(widget.profilePic)
                          )
                      ),

                    ),

                  ],
                ),


                //Student Name
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    widget.studenrName,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,

                    ),
                  ),

                ),

                //Student School
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    widget.school,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,

                    ),
                  ),

                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //call
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: TextButton(
                          onPressed: () {
                            FlutterPhoneDirectCaller.callNumber(widget.mobileNumber);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.call,
                                size: 27,
                                color: Colors.white,
                              ),

                            ],
                          ),
                        ),
                      ),

                      const SizedBox(width: 15,),

                      //message
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: TextButton(
                          onPressed: () {
                            // Navigator.of(context)
                            //     .pushNamed('/studentDetailScreen');
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.message,
                                size: 27,
                                color: Colors.white,
                              ),

                            ],
                          ),
                        ),
                      ),

                      const SizedBox(width: 15,),

                      //QR display
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const DisplayQR();
                              },
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.qr_code_scanner_rounded,
                                size: 27,
                                color: Colors.white,
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10,),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Divider(thickness: 0.4,),
                ),


                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    //height: 900,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0, // Adjust the blur radius as needed
                          spreadRadius: 0.0, // Adjust the spread radius as needed
                          offset: Offset(3, 3), // Adjust the offset as needed
                        ),
                      ],
                      color: Colors.white,
                    ),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          //User Name
                          TextField(
                            maxLines: null,
                            controller: TextEditingController(text: widget.email),
                            enabled: false, // Disable editing
                            style: const TextStyle(color: Colors.black), // Change text color
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Username:',
                              labelStyle: TextStyle(color: Colors.black), // Change label text color
                              hintStyle: TextStyle(color: Colors.black), // Change hint text color
                            ),
                          ),

                          const SizedBox(height: 30,),

                          //Full name
                          TextField(
                            maxLines: null,
                            controller: TextEditingController(text: widget.firstName + widget.secondName),
                            enabled: false, // Disable editing
                            style: const TextStyle(color: Colors.black), // Change text color
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Full Name:',
                              labelStyle: TextStyle(color: Colors.black), // Change label text color
                              hintStyle: TextStyle(color: Colors.black), // Change hint text color
                            ),
                          ),


                          const SizedBox(height: 30,),

                          //First Name
                          TextField(
                            maxLines: null,
                            controller: TextEditingController(text: widget.firstName),
                            enabled: false, // Disable editing
                            style: const TextStyle(color: Colors.black), // Change text color
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'First Name:',
                              labelStyle: TextStyle(color: Colors.black), // Change label text color
                              hintStyle: TextStyle(color: Colors.black), // Change hint text color
                            ),
                          ),

                          const SizedBox(height: 30,),

                          //LastName
                          TextField(
                            maxLines: null,
                            controller: TextEditingController(text: widget.secondName),
                            enabled: false, // Disable editing
                            style: const TextStyle(color: Colors.black), // Change text color
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Last Name:',
                              labelStyle: TextStyle(color: Colors.black), // Change label text color
                              hintStyle: TextStyle(color: Colors.black), // Change hint text color
                            ),
                          ),

                          const SizedBox(height: 30,),

                          //Address
                          TextField(
                            maxLines: null,
                            controller: TextEditingController(text: widget.address),
                            enabled: false, // Disable editing
                            style: const TextStyle(color: Colors.black), // Change text color
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Address:',
                              labelStyle: TextStyle(color: Colors.black), // Change label text color
                              hintStyle: TextStyle(color: Colors.black), // Change hint text color
                            ),
                          ),

                          const SizedBox(height: 30,),

                          //Mobile Number
                          TextField(
                            maxLines: null,
                            controller: TextEditingController(text: widget.mobileNumber),
                            enabled: false, // Disable editing
                            style: const TextStyle(color: Colors.black), // Change text color
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Mobile Number:',
                              labelStyle: TextStyle(color: Colors.black), // Change label text color
                              hintStyle: TextStyle(color: Colors.black), // Change hint text color
                            ),
                          ),

                          const SizedBox(height: 30,),

                          //Schoole
                          TextField(
                            maxLines: null,
                            controller: TextEditingController(text:widget.school),
                            enabled: false, // Disable editing
                            style: const TextStyle(color: Colors.black), // Change text color
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'School:',
                              labelStyle: TextStyle(color: Colors.black), // Change label text color
                              hintStyle: TextStyle(color: Colors.black), // Change hint text color
                            ),
                          ),

                          //
                          // const Padding(
                          //   padding: EdgeInsets.symmetric(vertical: 30),
                          //   child: Divider(thickness: 1,),
                          // ),
                          //
                          // Center(
                          //   child: SizedBox(
                          //     //width: 60,
                          //     height: 60,
                          //     child: TextButton(
                          //       onPressed: () {
                          //         showDialog(
                          //           context: context,
                          //           builder: (BuildContext context) {
                          //             return const DeleteAccountDialog();
                          //           },
                          //         );
                          //       },
                          //       style: ButtonStyle(
                          //         backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                          //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          //           RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.circular(20),
                          //           ),
                          //         ),
                          //       ),
                          //       child:  Row(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children: [
                          //           const Icon(
                          //             Icons.delete,
                          //             size: 27,
                          //             color: Colors.white,
                          //           ),
                          //
                          //           const SizedBox(width: 20,),
                          //
                          //           Text('Delete Account',style: buttonText2,)
                          //
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),



                        ],
                      ),
                    ),
                  ),
                ),





              ],
            ),
          )
      ),
    );
  }
}



class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(Icons.warning,color: Colors.orange,),
      title: const Text('Delete Account'),
      content: const Text('Are you sure you want to delete this account? This action cannot be undone.'),
      actions: <Widget>[


        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            //maxLines: null,
            obscureText: true,
            //controller: TextEditingController(text: 'Borella M.V '),
            //enabled: false, // Disable editing
            style: TextStyle(color: Colors.black), // Change text color
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter Password',
              labelStyle: TextStyle(color: Colors.black), // Change label text color
              hintStyle: TextStyle(color: Colors.black), // Change hint text color
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Center(
                child: SizedBox(
                  //width: 60,
                  height: 60,
                  child: TextButton(
                    onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(icon),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(
                        //   Icons.delete,
                        //   size: 27,
                        //   color: Colors.white,
                        // ),

                        const SizedBox(width: 20,),

                        Text('Cancle',style: buttonText2,)

                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Center(
                child: SizedBox(
                  //width: 60,
                  height: 60,
                  child: TextButton(
                    onPressed: () {
                      // showDialog(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return DeleteAccountDialog();
                      //   },
                      // );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(
                        //   Icons.delete,
                        //   size: 27,
                        //   color: Colors.white,
                        // ),

                        const SizedBox(width: 20,),

                        Text('Delete Account',style: buttonText2,)

                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),


        // TextButton(
        //   onPressed: () {
        //     Navigator.of(context).pop(); // Close the dialog
        //   },
        //   child: Text('Cancel'),
        // ),
        // TextButton(
        //   onPressed: () {
        //     // Implement the logic to delete the account here
        //     // You can use Navigator.of(context).pop() to close the dialog after successful deletion
        //   },
        //   child: Text(
        //     'Delete',
        //     style: TextStyle(color: Colors.red),
        //   ),
        // ),
      ],
    );
  }
}




class DisplayQR extends StatelessWidget {
  const DisplayQR({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(Icons.qr_code_scanner_rounded,color: Colors.black,),
      title: const Text('QR Code'),
      content: SizedBox(
       // width: 100,
        height: 200,
        //color: Colors.black,
        child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/QR_code_for_mobile_English_Wikipedia.svg/330px-QR_code_for_mobile_English_Wikipedia.svg.png'),
      ),
      actions: <Widget>[




        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Center(
                child: SizedBox(
                  //width: 60,
                  height: 60,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(icon),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(
                        //   Icons.delete,
                        //   size: 27,
                        //   color: Colors.white,
                        // ),

                        const SizedBox(width: 20,),

                        Text('Cancle',style: buttonText2,)

                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Center(
                child: SizedBox(
                  //width: 60,
                  height: 60,
                  child: TextButton(
                    onPressed: () {
                      // showDialog(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return DeleteAccountDialog();
                      //   },
                      // );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(
                        //   Icons.delete,
                        //   size: 27,
                        //   color: Colors.white,
                        // ),

                        const SizedBox(width: 20,),

                        Text('Download',style: buttonText2,)

                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),


      ],
    );
  }

}

