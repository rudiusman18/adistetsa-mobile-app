import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/404.png'),
        Center(
          child: Text('Calendar is under maintenance'),
        ),
      ],
    );
  }
}
