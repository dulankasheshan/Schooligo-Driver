import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final Widget icon;
  final String title;
  final String message;
  final String time;

  const NotificationTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.message,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(title),

                content: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(time,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black45),),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(message),
                      ),
                    ],
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
                          child: Text(
                            'Read',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3.0,
                spreadRadius: 0.0,
                offset: Offset(1, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.green,
              ),
              child: icon,
            ),
            title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            subtitle:  Text(message,style: const TextStyle(color: Colors.black45,fontSize: 15,),maxLines: 1,overflow: TextOverflow.ellipsis,),
            trailing: Text(time),
          ),
        ),
      ),
    );
  }
}
