import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:schooligo_driver/utility/style.dart';

class EmergencyTile extends StatelessWidget {
  // const EmergencyTile({super.key});

  // final String profilePic;
  final Widget icon;
  final String name;
  final String number;

  const EmergencyTile({
    Key? key,
    // required this.profilePic,
    required this.icon,
    required this.name,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  const EdgeInsets.all(10.0),
      child:Container(
        decoration: BoxDecoration(
          boxShadow: const[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 3.0, // Adjust the blur radius as needed
              spreadRadius: 0.0, // Adjust the spread radius as needed
              offset: Offset(1, 1), // Adjust the offset as needed
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),

        child: Slidable(

          // Specify a key if the Slidable is dismissible.
          key: const ValueKey(0),

          // The start action pane is the one at the left or the top side.
          startActionPane:  ActionPane(
            // A motion is a widget used to control how the pane animates.
            motion: ScrollMotion(),

            // A pane can dismiss the Slidable.
            //dismissible: DismissiblePane(onDismissed: () {}),

            // All actions are defined in the children parameter.
            children: [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                onPressed: (context) {
                  FlutterPhoneDirectCaller.callNumber(number);
                },
                backgroundColor: Color(0xFF7BC043),
                foregroundColor: Colors.white,
                icon: Icons.call,
                label: 'Call',
              ),


            ],
          ),

          // The end action pane is the one at the right or the bottom side.
          endActionPane: const ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                // An action can be bigger than the others.
                flex: 2,
                onPressed: messageFunction,
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
                color: accent,
              ),
              child: icon,
            ),
            title: Text(name,style: heading3,),
            subtitle: Text(number,style: heading4,),

            trailing: GestureDetector(
              onTap: () => FlutterPhoneDirectCaller.callNumber(number),

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



    );
  }
}


void doNothing(BuildContext context) {}


void callFunction(BuildContext context) {
  // Implement your call functionality here
  // For example, you can use packages like url_launcher to initiate a phone call
  print('call');
}

void messageFunction(BuildContext context) {
  // Implement your message functionality here
  // You can use packages like url_launcher to open a messaging app
  print('Message');
}