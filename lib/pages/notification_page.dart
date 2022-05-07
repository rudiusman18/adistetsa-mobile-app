import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/404.png'),
        Center(
          child: Text('Notification is under maintenance'),
        ),
      ],
    );
  }
}
