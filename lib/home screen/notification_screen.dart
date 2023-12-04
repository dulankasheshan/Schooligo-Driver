import 'package:flutter/material.dart';

import '../screens/components/notification_tile.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Define a list of notification items as temporary data
  List<NotificationItem> notificationItems = [
    NotificationItem(
      icon: const Icon(Icons.system_security_update, color: Colors.white),
      title: 'Software Update',
      message: 'You have new software update',
      time: '2:34 P.M',
    ),
    NotificationItem(
      icon: const Icon(Icons.notifications_active, color: Colors.white),
      title: 'New Message',
      message: 'You have received a new message',
      time: '3:15 P.M',
    ),
    NotificationItem(
      icon: const Icon(Icons.payments_outlined, color: Colors.white),
      title: 'Payment',
      message: 'Kamal Perera Pay this month payment',
      time: '3:15 P.M',
    ),
    NotificationItem(
      icon: const Icon(Icons.payments_outlined, color: Colors.white),
      title: 'Payment',
      message: 'Saliya Kumara Pay this month payment',
      time: '3:15 P.M',
    ),
    NotificationItem(
      icon: const Icon(Icons.payments_outlined, color: Colors.white),
      title: 'Payment',
      message: 'Sadunika Perera Pay this month payment',
      time: '3:15 P.M',
    ),
    NotificationItem(
      icon: const Icon(Icons.system_security_update, color: Colors.white),
      title: 'Software Update',
      message: 'You have new software update',
      time: '2:34 P.M',
    ),
    NotificationItem(
      icon: const Icon(Icons.notifications_active, color: Colors.white),
      title: 'New Message',
      message: 'You have received a new message',
      time: '3:15 P.M',
    ),
    NotificationItem(
      icon: const Icon(Icons.payments_outlined, color: Colors.white),
      title: 'Payment',
      message: 'Ahinsa Samadhi Pay this month payment',
      time: '3:15 P.M',
    ),
    NotificationItem(
      icon: const Icon(Icons.payments_outlined, color: Colors.white),
      title: 'Payment',
      message: 'Sandun Saranga Pay this month payment',
      time: '3:15 P.M',
    ),
  ];

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
          title: const Text('Notifications'),
        ),
        body: ListView.builder(
          itemCount: notificationItems.length,
          itemBuilder: (BuildContext context, int index) {
            // Get the notification item for the current index
            final item = notificationItems[index];

            return NotificationTile(
              icon: item.icon,
              title: item.title,
              message: item.message,
              time: item.time,
            );
          },
        ),
      ),
    );
  }
}

class NotificationItem {
  final Icon icon;
  final String title;
  final String message;
  final String time;

  NotificationItem({
    required this.icon,
    required this.title,
    required this.message,
    required this.time,
  });
}
