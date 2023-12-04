import 'package:flutter/material.dart';
import 'package:schooligo_driver/home%20screen/setting%20page/payment_more_details.dart';
import 'package:schooligo_driver/utility/style.dart';

class PaymentTile extends StatefulWidget {
  final String date;
  final String totalBalance;
  final String paidStudentCount;
  final String pendingStudentCount;

  const PaymentTile({
    Key? key,
    required this.date,
    required this.totalBalance,
    required this.paidStudentCount,
    required this.pendingStudentCount,
  }) : super(key: key);

  @override
  _PaymentTileState createState() => _PaymentTileState();
}

class _PaymentTileState extends State<PaymentTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0, // Adjust the blur radius as needed
                  spreadRadius: 0.0, // Adjust the spread radius as needed
                  offset: Offset(3, 3), // Adjust the offset as needed
                ),
              ],
            ),
            child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),

              width: double.infinity,

              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0,left: 20,right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(widget.date,style: heading3,),
                            //const SizedBox(width: 30),

                          ],
                        ),
                        const SizedBox(height: 30),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.monetization_on,
                                  color: Colors.green,
                                  size: 24,
                                ),
                                const SizedBox(width: 10), // Add spacing between the icon and text
                                Text(
                                  'Total Income: ',
                                  style: heading2,
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Rs. ${widget.totalBalance}',
                                  style: heading1),
                            )
                          ],
                        ),

                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                          child: Divider(thickness: .6,),
                        ),
                        //const SizedBox(height: 40),
                        Container(
                          //color: Colors.yellow,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.check,
                                    color: Colors.green,
                                    size: 24,
                                  ),
                                  const SizedBox(width: 10), // Add spacing between the icon and text
                                  Text(
                                    'Paid : ${widget.paidStudentCount}',
                                    style: heading3,
                                  ),
                                ],
                              ),

                              // Padding(
                              //   padding: const EdgeInsets.symmetric(horizontal: 60),
                              //   child: Divider(),
                              // ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                    size: 24,
                                  ),
                                  const SizedBox(width: 10), // Add spacing between the icon and text
                                  Text(
                                    'Pending : ${widget.pendingStudentCount}',
                                    style: heading3,
                                  ),
                                ],
                              ),







                            ],
                          ),
                        ),

                        const SizedBox(height: 30),

                      ],
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      // Payment More Details
                      // Navigator.of(context)
                      //     .pushNamed('/paymentMoreDetails');
                      //
                      // print({widget.paidStudentCount});

                      //method 2
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  PaymentMoreDetails(
                              date: widget.date,
                              totalBalance: widget.totalBalance,
                              paidStudentCount: widget.paidStudentCount,
                              pendingStudentCount: widget.pendingStudentCount,

                          )
                          // Pass the arguments as part of the RouteSettings. The
                          // DetailScreen reads the arguments from these settings.
                          // settings: RouteSettings(
                          //   arguments: todos[index],
                          // ),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(accent),
                      minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 60)), // Set the desired width and height
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Set the desired padding
                      ),
                    ),
                    child: const Text(
                      'More Details',
                      style: TextStyle(color: Colors.white,fontSize: 20),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(thickness: 1.3),
        )
      ],
    );
  }
}
