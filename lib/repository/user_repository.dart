import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:schooligo_driver/repository/user_model.dart';

class UserRepository extends GetxController{

  static Function<S>({String? tag}) get instance => Get.find ;
  final _db = FirebaseFirestore. instance;

  //Fetch User
  Future<UserModel>getUserDetails(String email) async{
    final snapshot = await _db.collection("Drivers").where("Email" , isEqualTo: email).get();
    final userData = snapshot.docs.map ((e) => UserModel. fromSnapshot (e)).single;
    return userData;
  }

}