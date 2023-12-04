import 'package:flutter/material.dart';
import 'package:schooligo_driver/screens/components/message_tile.dart';

class Student {
  final String studentProfileImage;
  final String studentName;
  final String message;
  final String reply;
  final String time;
  final bool isReply;
  final bool isRead;

  Student({
    required this.studentProfileImage,
    required this.studentName,
    required this.message,
    required this.reply,
    required this.time,
    required this.isReply,
    required this.isRead,
  });
}

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Student> students = [
    // Replace with your actual student data
    Student(
      studentProfileImage: "https://cdn.pixabay.com/photo/2017/11/06/13/45/cap-2923682_1280.jpg",
      studentName: "Asanka Kumara",
      message: "Adha putha scole en ne",
      reply: "Ha ha",
      time: "11:34 AM",
      isReply: true,
      isRead: false
    ),
    Student(
      studentProfileImage: "https://cdn.pixabay.com/photo/2016/12/09/09/52/girl-1894125_1280.jpg",
      studentName: "Thomas Alwa",
      message: "Me maseta salli gewala tiyenne",
      reply: "Loku deyak",
      time: "10:30 AM",
      isReply: true,
        isRead: false
    ),
    Student(
      studentProfileImage: "https://cdn.pixabay.com/photo/2016/02/23/04/52/model-1216916_1280.jpg",
      studentName: "Mical Perera",
      message: "Mage name akuru weradi. Eka wenas karanna",
      reply: "Ewa kamak ne",
      time: "11:45 AM",
      isReply: true,
        isRead: false
    ),
    Student(
      studentProfileImage: "https://cdn.pixabay.com/photo/2015/06/04/20/36/girl-797837_1280.jpg",
      studentName: "John Doe",
      message: "Ape putha hawasa bus eke enne ne ",
      reply: "E unata slli gannawa",
      time: "10:30 AM",
      isReply: false,
        isRead: true
    ),
    Student(
      studentProfileImage: "https://cdn.pixabay.com/photo/2014/10/30/17/32/boy-509488_1280.jpg",
      studentName: "Jane Smith",
      message: "Mama Slli gewwa",
      reply: "Ha",
      time: "11:45 AM",
      isReply: true,
        isRead: true
    ),
    Student(
      studentProfileImage: "https://cdn.pixabay.com/photo/2015/09/09/06/57/child-931152_1280.jpg",
      studentName: "John Bidon",
      message: "Hello Sagara mame",
      reply: "Hi there!",
      time: "10:30 AM",
      isReply: true,
        isRead: true
    ),
    Student(
      studentProfileImage: "https://cdn.pixabay.com/photo/2016/11/20/18/18/girl-1843477_1280.jpg",
      studentName: "Jonathan Silwa",
      message: "Hi",
      reply: "Hello!",
      time: "11:45 AM",
      isReply: true,
        isRead: true
    ),
    Student(
      studentProfileImage: "https://cdn.pixabay.com/photo/2015/06/26/18/40/person-822803_1280.jpg",
      studentName: "John Shanaka",
      message: "Hello",
      reply: "Hi there!",
      time: "10:30 AM",
      isReply: false,
        isRead: true
    ),
    Student(
      studentProfileImage: "https://cdn.pixabay.com/photo/2021/07/15/07/50/newborn-6467761_1280.jpg",
      studentName: "Lasith Bathiya",
      message: "Hi",
      reply: "Hello!",
      time: "11:45 AM",
      isReply: true,
        isRead: true
    ),
    Student(
      studentProfileImage: "https://cdn.pixabay.com/photo/2015/04/24/20/59/girl-738306_1280.jpg",
      studentName: "Malinga Santhsh",
      message: "Hi",
      reply: "Hello!",
      time: "11:45 AM",
      isReply: true,
        isRead: true
    ),
    Student(
      studentProfileImage: "https://cdn.pixabay.com/photo/2016/03/12/21/05/boy-1252771_1280.jpg",
      studentName: "Somege Putha",
      message: "Hello",
      reply: "Hi there!",
      time: "10:30 AM",
      isReply: false,
        isRead: true
    ),
    Student(
        studentProfileImage: "https://cdn.pixabay.com/photo/2016/03/12/21/03/girl-1252739_1280.jpg",
      studentName: "Lethara Peethara",
      message: "Hi",
      reply: "Ai ude mawa dalagiye",
      time: "11:45 AM",
      isReply: true,
        isRead: true
    ),
  ];

  List<Student> filteredStudents = [];

  @override
  void initState() {
    super.initState();
    // Initialize the filtered list with all students initially
    filteredStudents = List.from(students);
  }

  void filterStudents(String query) {
    setState(() {
      // Filter the students based on the query
      filteredStudents = students
          .where((student) => student.studentName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   icon: const Icon(Icons.arrow_back_ios),
          // ),
          title: const Text('Messages'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56.0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search Message',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (query) => filterStudents(query),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: filteredStudents.length,
            itemBuilder: (BuildContext context, int index) {
              final student = filteredStudents[index];
              return MessageTile(
                studentProfileImage: student.studentProfileImage,
                studentName: student.studentName,
                message: student.message,
                reply: student.reply,
                time: student.time,
                isReply: student.isReply,
                isRead: student.isRead,
              );
            },
          ),
        ),
      ),
    );
  }
}
