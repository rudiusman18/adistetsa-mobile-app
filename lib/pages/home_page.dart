import 'package:adistetsa/widget/item_card.dart';
import 'package:adistetsa/widget/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget itemsStafKurikulum() {
      return Container(
        alignment: Alignment.center,
        child: Wrap(
          spacing: 25,
          children: [
            ItemCard(text: 'asd'),
            ItemCard(text: 'asd'),
            ItemCard(text: 'asd'),
            ItemCard(text: 'asd'),
            ItemCard(text: 'asd'),
            ItemCard(text: 'asd'),
            ItemCard(text: 'asd'),
            ItemCard(text: 'asd'),
            ItemCard(text: 'asd'),
            ItemCard(text: 'asd'),
            ItemCard(text: 'asd'),
            ItemCard(text: 'asd'),
          ],
        ),
      );
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: 11,
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ADISTETSA',
                          style: mono1TextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: bold,
                          ),
                        ),
                        Icon(
                          Icons.group_outlined,
                        ),
                      ],
                    ),
                    Text(
                      'Selamat Datang di Aplikasi Digital SMAN 4 Malang',
                      style: mono1TextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: regular,
                      ),
                    ),
                    ProfileCard(),
                    Text(
                      'Menu',
                      style: mono1TextStyle,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: 20,
                ),
                child: itemsStafKurikulum(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
