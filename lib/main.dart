import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'authentication_repository.dart';
import 'firebase_options.dart';
import 'home screen/emergency_screen.dart';
import 'home screen/notification_screen.dart';
import 'home screen/payment_detail_screen.dart';
import 'home screen/qr_scan_screen.dart';
import 'home screen/setting page/password_change.dart';
import 'home screen/setting_screen.dart';
import 'home screen/single_student_details.dart';
import 'home screen/student_count_screen.dart';
import 'home screen/student_detail_screen.dart';
import 'home screen/setting page/userProfile.dart';
import 'screens/driver_details.dart';
import 'screens/driver_key_screen.dart';
import 'home screen/home_screen.dart';
import 'screens/navigation_view.dart';
import 'screens/signin_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/welcome_page.dart';
// import 'utility/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SchooliGo - Driver',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0xFF000000, // The primary value represents the black color code
          <int, Color>{
            50: Color(0xFF000000), // You can define shades of black as needed
            100: Color(0xFF000000),
            200: Color(0xFF000000),
            300: Color(0xFF000000),
            400: Color(0xFF000000),
            500: Color(0xFF000000),
            600: Color(0xFF000000),
            700: Color(0xFF000000),
            800: Color(0xFF000000),
            900: Color(0xFF000000),
          },
        ),
      ),
      home:  const WelcomePage(),

      routes: <String, WidgetBuilder>{
        '/signUpScreen': (context) =>  const SignUpScreen(),
        '/signInScreen': (context) =>  const SignInScreen(),
        '/driverKeyScreen': (context) =>  const DriverKeyScreen(),
        '/driverDetailsScreen': (context) =>  const DriverDetailsScreen(),
        '/navigationView': (context) =>  const NavigationView(),
        '/homeScreen': (context) =>  const HomeScreen(),
        '/qRScanScreen': (context) =>  const QRScanScreen(),
        '/driverProfileScreen': (context) =>  const DriverProfile(),
        '/studentCountDetailScreen': (context) =>  const StudentCountDetailScreen(),
        '/studentDetailScreen': (context) =>  const StudentDetailScreen(),
        '/notificationScreen': (context) =>  const NotificationScreen(),
        '/emergencyScreen': (context) =>  const EmergencyScreen(),
        '/paymentDetailScreen': (context) =>  const PaymentDetailScreen(),
        '/settingScreen': (context) =>  const SettingScreen(),
        '/passwordChange': (context) =>  const PasswordChange(),
        //'/paymentMoreDetails': (context) =>  const PaymentMoreDetails(),






        // '/forgetPasswordScreen': (context) =>  ForgetPasswordScreen(),
        // '/forgetPasswordScreen': (context) =>  ForgetPasswordScreen(),
        // '/emailVerificationScreen': (context) =>  EmailVerification(),
        // '/resetPasswordScreen': (context) =>  ResetPasswordScreen(),

      },

    );
  }
}
