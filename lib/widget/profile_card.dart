import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: m2Color,
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              m5Color,
              m4Color,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              offset: Offset(0, 4),
              spreadRadius: 0,
              blurRadius: 4,
            )
          ]),
      margin: EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Container(
        margin: EdgeInsets.only(
          top: 12,
          bottom: 12,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/home/persegi profile.png',
                  width: 146.57,
                ),
                Text(
                  'Staff',
                  style: mono6TextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Aqsana Sirait M',
                      style: mono6TextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'NIP 199010102015051001',
                      style: mono6TextStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Bidang',
                      style: mono6TextStyle.copyWith(
                        fontWeight: regular,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      'Kurikulum',
                      style: mono6TextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Opacity(
                  opacity: 0.15,
                  child: Image.asset(
                    'assets/logo sekolah.png',
                    width: 83.14,
                    height: 97,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
