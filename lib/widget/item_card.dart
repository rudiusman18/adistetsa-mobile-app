import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class ItemCard extends StatelessWidget {
  // final String urlIcon;
  final String text;
  ItemCard({
    // required this.urlIcon,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 18,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 8,
      ),
      width: 95,
      height: 95,
      decoration: BoxDecoration(
        color: mono6Color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(0, 2),
            color: shadowColor.withOpacity(0.25),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo sekolah.png',
            width: 27,
            height: 30,
          ),
          SizedBox(
            height: 6,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                text,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
