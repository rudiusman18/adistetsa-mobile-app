import 'package:adistetsa/theme.dart';
import 'package:flutter/material.dart';

class ListPerpustakaanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget perpustakaanAppbar() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Perpustakaan',
          style: mono1TextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 18,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: mono6Color,
        shadowColor: mono3Color,
        elevation: 4,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/main-page/back', (route) => false);
          },
          icon: Icon(Icons.arrow_back),
          color: mono2Color,
        ),
      );
    }

    Widget contentItem(String text) {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        padding: EdgeInsets.only(
          bottom: 17,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: mono1TextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Divider(
              thickness: 0.5,
              color: mono3Color,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: perpustakaanAppbar(),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/staff-perpus/katalog-buku-page');
            },
            child: contentItem(
              'katalog Buku',
            ),
          ),
          contentItem(
            'Peminjaman',
          ),
          contentItem(
            'Riwayat Peminjaman',
          ),
        ],
      ),
    );
  }
}
