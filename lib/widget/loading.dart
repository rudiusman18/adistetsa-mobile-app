import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

Future loading(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: mono6Color,
                backgroundColor: m1Color,
              ),
            ],
          ),
        );
      });
}
