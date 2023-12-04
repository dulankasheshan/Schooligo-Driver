import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNo;
  final String password;
  final String address;
  final String fileUrt;
  final String userName;
  final String vehicleNo;

  const UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNo,
    required this.address,
    required this.fileUrt,
    required this.userName,
    required this.vehicleNo,
  });

  //Fetch data
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: data['ID'],
      firstName: data['FirstName'],
      lastName: data['LastName'],
      email: data['Email'],
      phoneNo: data['PhoneNumber'],
      password: '',
      address: data['Address'],
      fileUrt: data['ProfileImage'],
      userName: data['UserName'],
      vehicleNo: data['VehicleNo'],
    );
  }
}