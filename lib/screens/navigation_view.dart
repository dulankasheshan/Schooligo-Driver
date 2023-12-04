
import 'package:flutter/material.dart';
import 'package:schooligo_driver/home%20screen/message_screen.dart';


import '../home screen/home_screen.dart';
import '../utility/style.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});


  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {



   int currentTab = 0;
  final List<Widget> Screens = [
    const HomeScreen(),
    const MessageScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();

  @override
  Widget build(BuildContext context) {
    //final newTrip = new Trip(null, null, null, null, null, null);


    return SafeArea(
      child: Scaffold(
        //backgroundColor: accent,
        body: PageStorage(bucket: bucket, child: currentScreen),
        floatingActionButton: FloatingActionButton(

            onPressed: (){
              print("QR Scaner");
              Navigator.of(context)
                  .pushNamed('/qRScanScreen');

            },

          backgroundColor: black,
          child: Icon(Icons.qr_code_scanner_rounded,color: white,size: 30,),


        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 20,

          child: SizedBox(
            // decoration: BoxDecoration(
            //   color: black,
            //   borderRadius: BorderRadius.circular(50)
            // ),
            //color: black,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen = const HomeScreen();
                          currentTab = 0;
                        });
                      },
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.dashboard_rounded,
                            color: currentTab == 0 ? accent : icon,
                          ),
                          Text(
                            'Dashboard',
                            style: TextStyle(
                              color: currentTab == 0 ? accent : icon,
                            ),
                          )
                        ],
                      ),

                    ),
                    const SizedBox(
                      width: 80,
                    )

                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    MaterialButton(

                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen = const MessageScreen();
                          currentTab = 1;
                        });
                      },
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.message,
                            color: currentTab == 1 ? accent : icon,
                          ),
                          Text(
                            'Messages',
                            style: TextStyle(
                              color: currentTab == 1 ? accent : icon,
                            ),
                          )
                        ],
                      ),

                    )
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