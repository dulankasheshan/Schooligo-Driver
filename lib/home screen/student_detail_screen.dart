import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../screens/components/student_detail_tile.dart';

class StudentDetailScreen extends StatefulWidget {
  const StudentDetailScreen({Key? key}) : super(key: key);

  @override
  State<StudentDetailScreen> createState() => _StudentDetailScreenState();
}

class _StudentDetailScreenState extends State<StudentDetailScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Student> students = [
    Student('Nawodya Gagani', 'Mulleriyawa M.V',
        'https://cdn.pixabay.com/photo/2016/10/06/03/34/teen-1718115_1280.jpg', '0875242331'),
    Student('Harshani Senaka', 'Mulleriyawa M.V',
        'https://cdn.pixabay.com/photo/2015/07/09/00/29/woman-837156_1280.jpg', '7464646'),
    Student('Indika Imesh', 'Urapola M.V',
        'https://cdn.pixabay.com/photo/2012/06/19/10/32/owl-50267_1280.jpg', '24546331'),
    Student('Nadeera Sampath', 'Badulla M.V',
        'https://cdn.pixabay.com/photo/2015/04/23/21/59/tree-736877_1280.jpg', '25744442331'),
    Student('Mudara Mamaruchira', 'Mulleriyawa M.V',
        'https://cdn.pixabay.com/photo/2017/11/06/13/45/cap-2923682_1280.jpg', '57855242331'),
    Student('Sumudu Madushika', 'Janadhipathi Vidyalaya',
        'https://cdn.pixabay.com/photo/2016/11/29/20/22/girl-1871104_1280.jpg', '257677646'),
    Student('Dulari Jayapathma', 'Nittabuwa M.V',
        'https://cdn.pixabay.com/photo/2015/06/12/21/58/child-807547_1280.jpg', '24546331'),
    Student('Udayanga Rusiru Sampath', 'Kurunegala M.V',
        'https://cdn.pixabay.com/photo/2012/06/19/10/32/owl-50267_1280.jpg', '5456442331'),
    // Add more students here
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
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text('Student Details'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56.0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search Students',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: filterStudents,
              ),
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("Students").where('DiverID', isEqualTo: "ca95c4cc-eec8-4ddf-95d7-9082589917d5")
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
              if(snapshot.hasError){
                return Center(child: Text(snapshot.error.toString()),);
              }else if(snapshot.hasData){
                final messages = snapshot. data?.docs.reversed. toList ();
                return ListView.builder(
                    itemCount: messages?.length,
                    itemBuilder: (BuildContext context, int index){
                      // final filteredMessages = filteredStudents[index];
                      return StudentDetailTile(

                        email: ('${messages?[index]["Email"]}'),
                        studenrName: ('${messages?[index]["FirstName"]}'),
                        school: ('${messages?[index]["School"]}'),
                        profilePic: ('${messages?[index]["ProfileImage"]}'),
                        mobileNumber: ('${messages?[index]["PhoneNumber"]}'),
                        firstName: ('${messages?[index]["FirstName"]}'),
                        secondName: ('${messages?[index]["LastName"]}'),
                        address: ('${messages?[index]["Address"]}'),

                      );
                    }
                );
              }else{
                return const Center (child: CircularProgressIndicator());
              }
            }),

        // ListView.builder(
        //   itemCount: filteredStudents.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     final student = filteredStudents[index];
        //     return StudentDetailTile(
        //       studenrName: student.studentName,
        //       school: student.school,
        //       profilePic: student.profilePic,
        //       mobileNumber: student.mobileNumber,
        //     );
        //   },
        // ),
      ),
    );
  }
}

class Student {
  final String studentName;
  final String school;
  final String profilePic;
  final String mobileNumber;

  Student(this.studentName, this.school, this.profilePic, this.mobileNumber);
}
