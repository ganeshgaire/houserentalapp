// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
              tooltip: 'Show Notification',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Notification reloaded'),
                  ),
                );
              },
              icon: const Icon(Icons.notifications_active))
        ],
        title: const Text(
          'Notification',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            const Icon(
              Icons.notifications,
              size: 100,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Nothing Here!!!',
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(
              height: 10,
            ),
            const Flexible(
              child: Text(
                'Tap the notificatiom reloaded button below and check again',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            ElevatedButton(
              autofocus: true,
              style: ElevatedButton.styleFrom(primary: Colors.purpleAccent),
              onPressed: () {},
              child: const Text(
                'Reload Notification ',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
