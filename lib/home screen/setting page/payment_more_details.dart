import 'package:flutter/material.dart';
import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:get/get.dart';
import 'package:schooligo_driver/screens/components/payment_pendind_student_tile.dart';

import '../../utility/style.dart';

class PaymentMoreDetails extends StatefulWidget {
  final String date;
  final String totalBalance;
  final String paidStudentCount;
  final String pendingStudentCount;

  const PaymentMoreDetails({
    Key? key,
    required this.date,
    required this.totalBalance,
    required this.paidStudentCount,
    required this.pendingStudentCount,
  }) : super(key: key);

  @override
  State<PaymentMoreDetails> createState() => _PaymentMoreDetailsState();
}

class _PaymentMoreDetailsState extends State<PaymentMoreDetails> {
  late List<PieData> pies;
  String tapIndex = "";

  @override
  void initState() {
    double paidStudentCountM = double.parse(widget.paidStudentCount);
    double pendingStudentCountM = double.parse(widget.pendingStudentCount);

    super.initState();
    pies = [
      PieData(value: paidStudentCountM, color: Colors.green),
      PieData(value: pendingStudentCountM, color: Colors.red),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text('Payment More Details'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Month:  ' + widget.date, style: heading3),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: Divider(thickness: .6),
                          ),
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
                                  const SizedBox(width: 10),
                                  Text(
                                    'Total Income: ',
                                    style: heading2,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text('Rs. ' + widget.totalBalance, style: heading1),
                              )
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: Divider(thickness: .6),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        color: Colors.green,
                                        size: 24,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Paid : ' + widget.paidStudentCount.toString(),
                                        style: heading3,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        color: Colors.red,
                                        size: 24,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Pending : ' + widget.pendingStudentCount.toString(),
                                        style: heading3,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const SizedBox(height: 30),
                                  EasyPieChart(
                                    key: const Key('pie 1'),
                                    children: pies,
                                    borderEdge: StrokeCap.butt,
                                    pieType: PieType.crust,
                                    onTap: (index) {},
                                    style: const TextStyle(color: Colors.white, fontSize: 0),
                                    gap: 0.02,
                                    start: 0,
                                    size: 130,
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Pending Students SizedBox =====================================
                          if (int.parse(widget.pendingStudentCount) > 0)
                            SizedBox(
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                    child: Divider(thickness: .6),
                                  ),
                                  // const SizedBox(height: 30),
                                  const SizedBox(height: 30),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Pending Students: ',
                                      style: heading2,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  // Pending Students List
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: int.parse(widget.pendingStudentCount),
                                    itemBuilder: (context, index) {
                                      return PaymentStudentTile(isPaid: false);
                                    },
                                  ),
                                ],
                              ),
                            ),

                          // Paid Students SizedBox =====================================
                          if (int.parse(widget.paidStudentCount) > 0)
                            SizedBox(
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                    child: Divider(thickness: .6),
                                  ),
                                  // const SizedBox(height: 30),
                                  const SizedBox(height: 20),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Paid Students: ',
                                      style: heading2,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  // Paid Students List
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: int.parse(widget.paidStudentCount),
                                    itemBuilder: (context, index) {
                                      return PaymentStudentTile(isPaid: true);
                                    },
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
