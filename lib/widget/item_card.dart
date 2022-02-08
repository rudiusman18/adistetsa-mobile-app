import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class ItemCard extends StatelessWidget {
  final String urlImg;
  final String text;
  ItemCard({
    required this.urlImg,
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
            color: shadowColor,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/home/staff perpustakaan/$urlImg.png',
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
                style: mono1TextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: semiBold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
