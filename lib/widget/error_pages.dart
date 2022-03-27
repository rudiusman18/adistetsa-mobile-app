import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class ErrorPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mono6Color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/404.png',
            ),
            Text(
              'Page Not Found!',
              style: mono1TextStyle.copyWith(
                fontWeight: bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
