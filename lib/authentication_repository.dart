import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:schooligo_driver/screens/navigation_view.dart';
import 'package:schooligo_driver/screens/welcome_page.dart';
import 'exeptions/signup_email_password_fail.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();
  //Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?> (_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever (firebaseUser, _setInitialScreen);
    }
  _setInitialScreen(User? user) {
    if(user == null){
      Get.offAll (() => const WelcomePage());
    }
    else{
      Get.offAll (() => const NavigationView());
    }
  }
  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try{
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    }on FirebaseAuthException catch(e){
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print ('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    }catch(_){
    }
  }
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try{
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    }on FirebaseAuthException catch(e){
      print(e);
    }catch(_){
    }
  }

  Future<void> logout() async{
    await _auth.signOut();
  }
}

