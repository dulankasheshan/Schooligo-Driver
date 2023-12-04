import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../home screen/single_student_details.dart';
import '../../utility/style.dart';

class StudentDetailTile extends StatefulWidget {

  final String profilePic;
  final String studenrName;
  final String school;
  final String mobileNumber;
  final String email;
  final String firstName;
  final String secondName;
  final String address;

  const StudentDetailTile({
    Key? key,
    required this.profilePic,
    required this.studenrName,
    required this.school,
    required this.mobileNumber,
    required this.email, required this.firstName, required this.secondName, required this.address,
  }) : super(key: key);

  // const StudentDetailTile({super.key});

  @override
  State<StudentDetailTile> createState() => _StudentDetailTileState();
}

class _StudentDetailTileState extends State<StudentDetailTile> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  const EdgeInsets.all(10.0),
      child:GestureDetector(
        onTap:  (){Get.to(() =>  SingleUserDetails(
          profilePic: widget.profilePic,
          studenrName: widget.studenrName,
          school: widget.school,
          mobileNumber: widget.mobileNumber,
          email: widget.email,
          firstName: widget.firstName,
          secondName: widget.secondName, address: widget.address,

        ));},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const[
               BoxShadow(
                color: Colors.grey,
                blurRadius: 3.0, // Adjust the blur radius as needed
                spreadRadius: 0.0, // Adjust the spread radius as needed
                offset: Offset(1, 1), // Adjust the offset as needed
              ),
            ],
          ),

          child: Slidable(

            key: const ValueKey(0),

            startActionPane:  ActionPane(
              motion: ScrollMotion(),

              children: [
                SlidableAction(
                  onPressed: (context) {
                    FlutterPhoneDirectCaller.callNumber(widget.mobileNumber);
                  },
                  backgroundColor: Color(0xFF7BC043),
                  foregroundColor: Colors.white,
                  icon: Icons.call,
                  label: 'Call',
                ),

              ],
            ),

            // The end action pane is the one at the right or the bottom side.
            endActionPane:  const ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  // An action can be bigger than the others.
                  flex: 2,
                  onPressed: doNothing,
                  backgroundColor: Color(0xFF21B7CA),
                  foregroundColor: Colors.white,
                  icon: Icons.message,
                  label: 'Message',
                ),

              ],
            ),

            // The child of the Slidable is what the user sees when the
            // component is not dragged.
            child: ListTile(
              leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),

                  child:  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white54,
                    child: CircleAvatar(
                      radius: 33,
                      backgroundImage: NetworkImage(
                        // user profile image address
                        widget.profilePic,
                        ),
                    ),
                  ),),
              title: Text(widget.studenrName,style: heading2,),
              subtitle: Text(widget.school,style: heading4,),

              trailing: GestureDetector(
                onTap: () => FlutterPhoneDirectCaller.callNumber(widget.mobileNumber),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.green
                  ),
                    child: const Icon(Icons.call,color: Colors.white,)),
              ),
            ),
          ),
        ),
      ),



    );
  }
}


void doNothing(BuildContext context) {}

void callFunction(BuildContext context, String mobileNumber) {
  // Implement your call functionality here
  // For example, you can use packages like url_launcher to initiate a phone call
  print('Call to $mobileNumber');
}

void messageFunction(BuildContext context, String mobileNumber) {
  // Implement your message functionality here
  // You can use packages like url_launcher to open a messaging app
  print('Message to $mobileNumber');
}