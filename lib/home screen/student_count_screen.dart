import 'package:flutter/material.dart';


class StudentCountDetailScreen extends StatefulWidget {
  const StudentCountDetailScreen({super.key});

  @override
  State<StudentCountDetailScreen> createState() => _StudentCountDetailScreenState();
}

class _StudentCountDetailScreenState extends State<StudentCountDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        ),
        body: Container(
          child: ListView(
            children: const [
              // StudentDetailTile(),
              // StudentDetailTile(),
              // StudentDetailTile(),
              // StudentDetailTile(),
              // StudentDetailTile()
            ],
          ),
        ),
      ),
    );
  }
}
