import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';
import '../authentication_repository.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();


  final email = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final fName = TextEditingController();
  final lName = TextEditingController();
  final phoneNumber = TextEditingController();
  final vehiclePlateNumber = TextEditingController();
  final address = TextEditingController();
  File image = File("path");
  String  fileUrt = "";




  Future<void> registerUser () async {
    //Authentication
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email.text, password.text);
    //upload photo

    try {
      final ref = FirebaseStorage. instance. ref ().
      child ('path').child('${DateTime.now() .toIso8601String ()}.jpg');
      final result = await ref.putFile(image);
      fileUrt = await result .ref. getDownloadURL();
    }catch (e) {
      print(e);
    }

    //insert data
    try {
      await FirebaseFirestore.instance.collection('Drivers').add({
        'ID': const Uuid().v4(),
        'UserName': userName.text,
        'Email': email.text,
        'FirstName' : fName.text,
        'LastName' : lName.text,
        'VehicleNo': vehiclePlateNumber.text,
        'PhoneNumber' : phoneNumber.text,
        'Address' : address.text,
        'ProfileImage' : fileUrt,
      }).whenComplete(
            () =>
            Get.snackbar("Success", "You account has been created.",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green.withOpacity(0.1),
                colorText: Colors.green),
      ).catchError(
              (error, stackTrace) {
            Get.snackbar ("Error", "Something went wrong. Try again",
                snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.redAccent.withOpacity(0.1),
                colorText: Colors.red);
            print(error.toString());

          }
      );
    } catch (e) {
      print(e);
    }
  }
  void setImage(File image){
    this.image = image;
  }
  String getImage(){
    return image.path;
  }
}