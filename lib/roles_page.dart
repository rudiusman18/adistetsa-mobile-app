import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class RolesPage extends StatefulWidget {
  @override
  _RolesPageState createState() => _RolesPageState();
}

int currentIndex = -1;

class _RolesPageState extends State<RolesPage> {
  @override
  Widget build(BuildContext context) {
    Widget option({required int index, required String text}) {
      return GestureDetector(
        onTap: () {
          setState(() {
            currentIndex = index;
            print(currentIndex);
          });
        },
        child: Container(
          height: 44,
          padding: EdgeInsets.symmetric(
            horizontal: 12,
          ),
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 24,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: currentIndex == index ? m1Color : mono3Color,
                width: 2,
              )),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: currentIndex == index
                      ? m1TextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: bold,
                        )
                      : mono3TextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: bold,
                        ),
                ),
              ),
              currentIndex == index
                  ? Icon(
                      Icons.check_circle,
                      color: m1Color,
                    )
                  : Container(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/roles/bg_kiri_atas.png',
              width: 300,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/roles/bg_kiri.png',
                width: 120,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/roles/bg_kanan.png',
                width: 100,
              ),
            ),
            // NOTE: ini adalah konten
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: 17,
                  bottom: 30,
                ),
                child: Column(
                  children: [
                    Text(
                      'Pilih Akun',
                      style: mono1TextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 43,
                    ),
                    Image.asset(
                      'assets/logo sekolah.png',
                      width: 107.14,
                      height: 125,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 26,
                        left: 27,
                        right: 27,
                      ),
                      padding: EdgeInsets.only(
                        top: 35,
                        bottom: 25,
                        left: 19,
                        right: 19,
                      ),
                      decoration: BoxDecoration(
                        color: mono6Color,
                        border: Border.all(
                          color: shadowColor,
                        ),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: shadowColor,
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Silakan memilih akun Anda',
                            style: mono1TextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          option(index: 0, text: 'Guru'),
                          option(index: 1, text: 'Staff Kurikulum'),
                          SizedBox(
                            height: 18,
                          ),
                          Container(
                            width: double.infinity,
                            child: Text(
                              '*Anda hanya dapat menggunakan satu akun ',
                              style: mono3TextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: regular,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 37,
                          ),
                          Container(
                            width: 163,
                            height: 46,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: m2Color,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/main-page', (route) => false);
                              },
                              child: Text(
                                'Pilih',
                                style: mono6TextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 71,
                    ),
                    Text(
                      'Keluar',
                      style: m3TextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Studium Et Sapientia',
                            style: mono2TextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Belajar dan Bijaksana',
                            style: mono3TextStyle.copyWith(
                              fontSize: 10,
                              fontWeight: regular,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
