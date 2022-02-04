import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mono6Color,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                'assets/splash_screen/bg_kiri.png',
                height: 600,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/splash_screen/bg_kanan.png',
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 52,
                bottom: 56,
              ),
              child: Column(
                children: [
                  Text(
                    'Selamat Datang di ADISTETSA',
                    style: m1TextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    'Aplikasi Digital SMA Negeri 4 Malang',
                    style: p1TextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        'assets/logo sekolah.png',
                        width: 148.28,
                        height: 180,
                      ),
                    ),
                  ),
                  Container(
                    width: 211,
                    child: Text(
                      'Unggul dalam IMTAQ, IPTEK dan Berpijak pada Budaya Bangsa',
                      style: mono2TextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 37,
                  ),
                  Container(
                    width: 284,
                    height: 46,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: m2Color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login-page');
                      },
                      child: Text(
                        'Get Started',
                        style: mono6TextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 77,
                  ),
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
    );
  }
}
