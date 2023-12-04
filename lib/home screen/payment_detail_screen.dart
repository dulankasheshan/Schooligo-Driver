import 'package:flutter/material.dart';

import '../screens/components/payment_tile.dart';

class PaymentDetailScreen extends StatefulWidget {
  const PaymentDetailScreen({Key? key}) : super(key: key);

  @override
  State<PaymentDetailScreen> createState() => _PaymentDetailScreenState();
}

class PaymentDetail {
  final String date;
  final String totalBalance;
  final String paidStudentCount;
  final String pendingStudentCount;

  PaymentDetail({
    required this.date,
    required this.totalBalance,
    required this.paidStudentCount,
    required this.pendingStudentCount,
  });
}

class _PaymentDetailScreenState extends State<PaymentDetailScreen> {
  // Create a list of PaymentDetail objects
  final List<PaymentDetail> paymentDetails = [
    PaymentDetail(
      date: '10/2023',
      totalBalance: '24315.82',
      paidStudentCount: '32',
      pendingStudentCount: '3',
    ),
    PaymentDetail(
      date: '11/2023',
      totalBalance: '21000.50',
      paidStudentCount: '20',
      pendingStudentCount: '5',
    ),
    PaymentDetail(
      date: '12/2023',
      totalBalance: '18000.75',
      paidStudentCount: '18',
      pendingStudentCount: '3',
    ),
    PaymentDetail(
      date: '01/2024',
      totalBalance: '19500.30',
      paidStudentCount: '22',
      pendingStudentCount: '1',
    ),
    PaymentDetail(
      date: '02/2024',
      totalBalance: '22000.00',
      paidStudentCount: '0',
      pendingStudentCount: '25',
    ),
  ];

  // Custom method to parse the date format 'MM/yyyy' to DateTime
  DateTime parseDate(String date) {
    final parts = date.split('/');
    final month = int.parse(parts[0]);
    final year = int.parse(parts[1]);
    return DateTime(year, month);
  }

  @override
  Widget build(BuildContext context) {
    // Sort paymentDetails in descending order based on the date
    paymentDetails.sort((a, b) => parseDate(b.date).compareTo(parseDate(a.date)));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text('Payments'),
        ),
        body: ListView.builder(
          itemCount: paymentDetails.length,
          itemBuilder: (BuildContext context, int index) {
            // Use the sorted paymentDetails list to populate the PaymentTile
            return PaymentTile(
              date: paymentDetails[index].date,
              totalBalance: paymentDetails[index].totalBalance,
              paidStudentCount: paymentDetails[index].paidStudentCount,
              pendingStudentCount: paymentDetails[index].pendingStudentCount,
            );
          },
        ),
      ),
    );
  }
}
