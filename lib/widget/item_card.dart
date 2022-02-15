import 'package:adistetsa/models/role_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  final String urlImg;
  final String text;
  ItemCard({
    required this.urlImg,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);
    RolesModel rolesModel = provider.role;
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
            rolesModel.name == 'Staf Perpustakaan'
                ? 'assets/home/staff perpustakaan/$urlImg.png'
                : rolesModel.name == 'Guru'
                    ? 'assets/home/guru/$urlImg.png'
                    : '',
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
