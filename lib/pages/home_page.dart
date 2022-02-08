import 'package:adistetsa/widget/item_card.dart';
import 'package:adistetsa/widget/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget itemsStafPerpustakaan() {
      return Container(
        alignment: Alignment.center,
        child: Wrap(
          spacing: 25,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/staff-perpus/katalog-buku-page');
              },
              child: ItemCard(
                urlImg: 'katalog buku',
                text: 'Katalog Buku',
              ),
            ),
            ItemCard(
              urlImg: 'anggota perpustakaan',
              text: 'Anggota Perpustakaan',
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, '/staff-perpus/peminjaman-buku-page');
              },
              child: ItemCard(
                urlImg: 'peminjaman buku',
                text: 'Peminjaman Buku',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, '/staff-perpus/riwayat-peminjaman-page');
              },
              child: ItemCard(
                urlImg: 'riwayat peminjaman',
                text: 'Riwayat Peminjaman',
              ),
            ),
            ItemCard(
              urlImg: 'laporan jumlah anggota',
              text: 'Laporan Jumlah Anggota',
            ),
            ItemCard(
              urlImg: 'laporan sirkulasi peminjaman',
              text: 'Laporan Sirkulasi Peminjaman',
            ),
            ItemCard(
              urlImg: 'laporan koleksi buku',
              text: 'Laporan Koleksi Buku',
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      body: SafeArea(
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
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/roles-page', (route) => false);
                            },
                            child: Icon(
                              Icons.group_outlined,
                            ),
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
                  child: itemsStafPerpustakaan(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
