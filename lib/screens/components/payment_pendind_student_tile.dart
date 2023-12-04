import 'package:flutter/material.dart';
import '../../utility/style.dart';

class PaymentStudentTile extends StatelessWidget {
  final bool isPaid;

  const PaymentStudentTile({Key? key, required this.isPaid}) : super(key: key);

  void _handlePaymentRequest(BuildContext context) {
    // Add your logic for payment request handling here


    // Show a Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text('Payment request sent!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 3.0,
              spreadRadius: 0.0,
              offset: Offset(1, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: ListTile(
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white54,
              child: CircleAvatar(
                radius: 33,
                backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2023/11/05/12/57/squirrel-8367079_1280.jpg',
                ),
              ),
            ),
          ),
          title: Text('Kamal Addara', style: heading2),
          subtitle: Text("ABD school", style: heading4),
          trailing: isPaid
              ? null
              : GestureDetector(
            onTap: () {
              // Handle the payment request
              _handlePaymentRequest(context);
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.orangeAccent,
              ),
              child: const Icon(Icons.notifications_active_rounded, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
